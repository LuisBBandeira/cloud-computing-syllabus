cluster = {
  name   = "meta-cluster"
  nodes  = 1
  addons = ["ingress"]
}

environment = {
    dev = 1
    prod = 1
    qa   = 1
}

deploy = {
  name = "social-app"
  labels = [ "sc-app" ]
  replicas = 1
  containerName = "meta-social"
  image = "nginx:alpine"
  port = 3000
}

odoo = {
  name = "meta-crm"
  labels = ["odoo-crm"]
  replicas = 1
  image = "odoo:16"
  port = 8070
}

postgres = {
  password = "M3taP@ssw0rdSecure!456"
}