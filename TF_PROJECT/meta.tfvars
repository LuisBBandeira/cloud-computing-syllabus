cluster = {
  name   = "meta-cluster"
  nodes  = 4
  addons = ["ingress"]
}

environment = {
    dev = 2
    prod = 2
    qa   = 2
}

deploy = {
  name          = "social-app"
  labels = [ "sc-app" ]
  replicas      = 2
  containerName = "meta-social"
  image         = "nginx:alpine"
  port          = 3000
}

odoo = {
  name     = "meta-crm"
  labels   = ["odoo-crm"]
  replicas = 3
  image    = "odoo:16"
  port     = 8070
}

postgres = {
  password = "M3taP@ssw0rdSecure!456"
}