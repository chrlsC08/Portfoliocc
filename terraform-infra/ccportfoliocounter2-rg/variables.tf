variable "app_insights_connection_string" {
  type      = string
  sensitive = false
}

variable "cosmos_connection_string" {
  type      = string
  sensitive = false
}

# Add this one!
variable "cosmos_key" {
  type      = string
  sensitive = false
}

variable "allowed_origins" {
  type    = list(string)
  default = ["*"] 
}