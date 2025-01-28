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
    description = "Cluster definition"
}

variable "environment" {
    type = map(number)
     default = {
        dev  = 2
        prod = 2
        qa   = 2
    }
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
}

variable "odoo" {
    type = object({
      name = string
      image = string
      replicas = number
      port = number 
      labels = list(string)
    })
}

variable "postgres" {
  type = object({
    password = string
  })
}