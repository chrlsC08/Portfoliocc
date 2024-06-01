window.addEventListener('DOMContentLoaded' , (event) =>{
    getVisitCount();
})

const functionApiURL = 'https://getcountccportfolio.azurewebsites.net/api/GetPortfolioCounter?code=ApF1E8ya67p-ZonXwLAfBrtE2DYU1wsQsGkyAfyPFXYpAzFuuBh-BA%3D%3D';
const functionApiLocal  = 'http://localhost:7071/api/GetPortfolioCounter';
const getVisitCount = () => {
    let count = 30;
    fetch(functionApiURL).then(response => {
        return response.json()
        //return response
    }).then(response =>{
        console.log("Website called function API.");
        console.log(response);
        //count = response.count;
        count = response
        document.getElementById("counter").innerText = count;
    }).catch(function(error){
        console.log(error);
    });
    return count;
}