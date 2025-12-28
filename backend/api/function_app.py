import logging
import azure.functions as func
from azure.cosmos import CosmosClient
import json
import os

app = func.FunctionApp(http_auth_level=func.AuthLevel.ANONYMOUS)

@app.route(route="CCPortfolioCounter2")
def CCPortfolioCounter2(req: func.HttpRequest) -> func.HttpResponse:
    try:
        conn = os.environ["AzurePortfolioConnectionString"]
        database_name = "AzurePortfolio"
        container_name = "Counter"

        client = CosmosClient.from_connection_string(conn_str=conn)
        database = client.get_database_client(database_name)
        container = database.get_container_client(container_name)
        
        item = container.read_item("1", partition_key="1")
        updated_item = updatecount(item)
        updated_item = container.upsert_item(item)
    
        # Updated return statement with Cache-Control headers
        return func.HttpResponse(
            body=json.dumps(updated_item["count"]),
            status_code=200,
            mimetype="application/json",
            headers={
                "Cache-Control": "no-cache, no-store, must-revalidate",
                "Pragma": "no-cache",
                "Expires": "0",
                "Access-Control-Allow-Origin": "*" # Helps with CORS issues if they arise
            }
        )
    except Exception as e:
        logging.error(f"Error: {e}")
        return func.HttpResponse(status_code=400)

def updatecount(item):
    count = item["count"]
    count = int(count) + 1
    item["count"] = str(count)
    return item
