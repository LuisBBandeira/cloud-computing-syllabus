# Terraform Minikube Project

# Overview
This project deploys a local Kubernetes cluster with Minikube, then sets up namespaces, deployments, and services (including Odoo and PostgreSQL). It uses Terraform for managing resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.35.1 |
| <a name="requirement_minikube"></a> [minikube](#requirement\_minikube) | 0.4.4 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.35.1 |
| <a name="provider_minikube"></a> [minikube](#provider\_minikube) | 0.4.4 |


## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.my-deploy](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/deployment) | resource |
| [kubernetes_deployment.odoo-deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/deployment) | resource |
| [kubernetes_deployment.postgres](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/deployment) | resource |
| [kubernetes_namespace_v1.my-ns](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/namespace_v1) | resource |
| [kubernetes_service.odoo](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/service) | resource |
| [kubernetes_service.postgres](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/service) | resource |
| [minikube_cluster.my-cluster](https://registry.terraform.io/providers/scott-the-programmer/minikube/0.4.4/docs/resources/cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Defines the overall configuration for the cluster. It includes the cluster name, the number of nodes, and a list of addons (for example, ingress controllers) to be enabled. This variable provides a default configuration and is optional. | <pre>object({<br/>      name = string<br/>      nodes = number<br/>      addons = list(string)<br/>    })</pre> | <pre>{<br/>  "addons": [<br/>    "ingress"<br/>  ],<br/>  "name": "default-name",<br/>  "nodes": 1<br/>}</pre> | no |
| <a name="input_deploy"></a> [deploy](#input\_deploy) | Specifies the configuration for the primary application deployment. It requires information such as the deployment name, container image, the number of replicas, container name, container port, and associated labels. This input is required. | <pre>object({<br/>    name = string<br/>    image= string<br/>    replicas = number<br/>    containerName = string<br/>    port = number<br/>    labels= list(string)<br/>  })</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Provides a mapping for different environments (e.g., dev, prod, qa). The numeric values can be used to dictate environment-specific settings such as replica counts or other parameters. This variable comes with a default mapping and is optional. | `map(number)` | <pre>{<br/>  "dev": 2,<br/>  "prod": 2,<br/>  "qa": 2<br/>}</pre> | no |
| <a name="input_odoo"></a> [odoo](#input\_odoo) | Configures the Odoo deployment settings. It contains the Odoo application name, image, replica count, port, and labels. This input is required to deploy the Odoo component correctly. | <pre>object({<br/>      name = string<br/>      image = string<br/>      replicas = number<br/>      port = number <br/>      labels = list(string)<br/>    })</pre> | n/a | yes |
| <a name="input_postgres"></a> [postgres](#input\_postgres) | Defines thContains sensitive configuration for the PostgreSQL database, specifically the database password. This variable is required to securely configure the PostgreSQL deployment. | <pre>object({<br/>    password = string<br/>  })</pre> | n/a | yes |



## Getting Started

1. **Clone or copy the project**  
   Make sure all .tf and .tfvars files are present in the same directory.

2. **Select a .tfvars file**  
   Decide which environment file fits your needs (e.g., `meta.tfvars`, `rockstar.tfvars`, `netflix.tfvars`).

3. **Initialize Terraform**  
   ```bash
   terraform init
    ```

4. **Select the workspace**
    Decide which workspace fits your needs (e.g., meta , rockstar, netflix).

    ```bash
    terraform workspace select meta
    ```


5. **Plan your changes** 

   ```bash
   terraform plan -var-file="meta.tfvars" -out=meta
   ```
   Adjust the .tfvars file name as needed.


6. **Apply the configuration** 

   ```bash
   terraform apply meta
   ```

## Testing the Deployment

1. **Apply the configuration** 

    Confirm pods are up
    
   ```bash
   kubectl get pods --all-namespaces
   ```

2. **Access Services** 

   For LoadBalancer services, minikube typically assigns a tunnel or URL.
    
   ```bash
   minikube service list
   ```

   Use the displayed URL to test your application in the browser or via curl

