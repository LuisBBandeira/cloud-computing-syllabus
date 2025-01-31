variable "cluster" {
    type = object({
      name = string
      nodes = number
      addons = list(string)
    })
    default = {
      name = "default-name"
      nodes = 1
      addons = [ "ingress" ]
    }
    nullable = false
    description = "Defines the overall configuration for the cluster. It includes the cluster name, the number of nodes, and a list of addons (for example, ingress controllers) to be enabled. This variable provides a default configuration and is optional."
}

variable "environment" {
    type = map(number)
     default = {
        dev  = 2
        prod = 2
        qa   = 2
    }
    description =   "Provides a mapping for different environments (e.g., dev, prod, qa). The numeric values can be used to dictate environment-specific settings such as replica counts or other parameters. This variable comes with a default mapping and is optional."

}

variable "deploy" {
  type = object({
    name = string
    image= string
    replicas = number
    containerName = string
    port = number
    labels= list(string)
  })
  description = "Specifies the configuration for the primary application deployment. It requires information such as the deployment name, container image, the number of replicas, container name, container port, and associated labels. This input is required."

}

variable "odoo" {
    type = object({
      name = string
      image = string
      replicas = number
      port = number 
      labels = list(string)
    })
    description = "Configures the Odoo deployment settings. It contains the Odoo application name, image, replica count, port, and labels. This input is required to deploy the Odoo component correctly."

}

variable "postgres" {
  type = object({
    password = string
  })
  sensitive = true
  description = "Defines thContains sensitive configuration for the PostgreSQL database, specifically the database password. This variable is required to securely configure the PostgreSQL deployment."

}