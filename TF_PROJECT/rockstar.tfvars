cluster = {
  name   = "rockestar-games"
  nodes  = 2
  addons = ["ingress"]
}

environment = {
    prod = 2
    qa   = 4
}

deploy = {
  name          = "gaming-backend"
  replicas      = 3
  containerName = "rockstar-engine"
  image         = "nginx:alpine"
  port          = 8000
}

odoo = {
  name     = "rockestar-ops"
  labels   = "odoo-ops"
  replicas = 1
  image    = "odoo:16"
  port     = 8069
}

postgres = {
  password = "R0ckst@rGTA6DBP@ss!"
}