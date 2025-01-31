cluster = {
  name = "netflix-prod"
  nodes  = 3
  addons = ["ingress"]
}

environment = {
    dev = 1
    prod = 2
    qa = 1
}

deploy = {
  name = "streaming-app"
  labels = [ "stream-app" ]
  replicas = 5
  containerName = "netflix-streaming"
  image = "nginx:alpine"
  port = 8080
}

odoo = {
  name = "netflix-odoo"
  labels = ["odoo-internal"]
  replicas = 2
  image = "odoo:16"
  port = 8069
}

postgres = {
  password = "s3cur3P@ssw0rdNetflix123!"
}