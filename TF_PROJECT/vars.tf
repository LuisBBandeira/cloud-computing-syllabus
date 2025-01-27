variable "cluster" {
    type = object({
      name = string
      nodes = number
      addons = list(string)
    })
    default = {
      name = "default-name"
      nodes = 1
    }
    nullable = false
    description = "Cluster definition"
}

variable "environment" {
    type = list(string)
    default =["dev","qa","prod"]
}

variable "deploy" {
  type = object({
    name = string
    image= string
    containerName = string
    port = number
    labels= list(string)
  })
}

variable "odoo" {
    type = object({
      name = string
      image = string
      port = number 
      labels = list(string)
    })
}