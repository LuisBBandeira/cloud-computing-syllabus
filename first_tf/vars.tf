variable "environment" {
  type = list(string)
  default = toset([ "dev" , "beta" , " prod" ])
  description = "environment (aka k8s namespace)"
#   validation {
#     condition = contains(["dev","beta","prod"], var.environment)
#     error_message = "Environment should be one of [dev, beta, prod] "
#   }

}