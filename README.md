
# AzureTerraformMagic - ATM

This repository contains reusable Terraform modules to deploy and manage Azure resources. These modules are designed to simplify infrastructure provisioning and can be used to create and manage various Azure services such as Virtual Machines, Virtual Networks, Resource Groups, and more.

## Repository Structure

```
├── modules
│   ├── analytics
│   │   ├── power_bi    			# Power Bi module
|   ├── containers
|   |   ├── container_registries	# Azure Container Registries module
|   |   ├── kubernetes				# Azure Kubernetes module
|   ├── dev_tools
|   |   ├── load_testing			# Azure Load Testing module
│   ├── management
|   |   ├── application_insights	# Application Insights module
|   |   ├── log_analytics_ws		# Log Analytics workspace module
│   │   ├── resource_group 			# Resource Group module
│   ├── networking
│   │   ├── virtual_network        	# Virtual Network module
│   │   ├── subnet   				# Subnet module
│   ├── locals          			# Shared locals module
├── env            					# Example configurations
│   ├── dev
├── README.md           			# Documentation (this file)
```

## Prerequisites

-   **Terraform**: Install the latest version of Terraform.
-   **Azure CLI**: Install and configure the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
-   **Azure Subscription**: Ensure you have access to an Azure subscription.
    

## How to Use

### 1. Clone the Repository
```
git clone <repository_url>
cd <repository_folder>
```

### 2. Configure Your Environment

Before using the modules, ensure the following:
-   You have logged into Azure using `az login`.
-   You have set up your Terraform backend for state management (e.g., Azure Blob Storage).

### 3. Initialize Terraform

Run the following command to initialize Terraform:
```
terraform init
```

### 4. Plan and Apply

-   **Plan**: Review the changes Terraform will make:
    ```
    terraform plan
    ```
    
-   **Apply**: Deploy the resources:
    ```
    terraform apply
    ```
    

### 5. Destroy Resources

To clean up and remove the resources created by Terraform:
```
terraform destroy
```

## Available Modules

### 1. Resource Group (`modules/management/resource_group`)

Creates an Azure Resource Group.

**Inputs:**
-   `rg`: Object with resource group details:
    -   `name`: Name of the resource group.
    -   `location`: Azure region.
-   `tags`: Tags to apply to the resource group.
    

### 2. Virtual Network (`modules/networking/virtual_network`)

Creates an Azure Virtual Network.

**Inputs:**
-   `vnet`: Object with virtual network details:
    -   `name`: Name of the virtual network.
    -   `address_space`: CIDR blocks.
    -   `rg_name`: Resource group for the VNet.
    -   `location`: Azure region.
        

### 3. ACR (`modules/containers/container_registries`)

Creates an Azure Container Registry.

**Inputs:**
-   `acr`: Object with ACR details:
    -   `acr_name`: Name of the ACR.
    -   `rg_name`: Resource group for the ACR.
    -   `location`: Azure region.
    -   `sku`: Size of the ACR.
    -   `admin_enabled`: Should Admin account enabled.
    -   `public_network_access_enabled`: Should ACR is publicly accessible.

## Best Practices

-   **Backend Configuration**: Always configure a remote backend for state management (e.g., Azure Blob Storage).
-   **Versioning**: Use version constraints to lock module and provider versions.
 -   **Environment Isolation**: Use separate state files and configurations for different environments (e.g., staging, production).   
-   **Shared Locals**: Use the `locals` module for common variables such as `tags` and default settings.
    

## Contributing
Feel free to raise issues, suggest features, or submit pull requests. Follow the contributing guidelines.
## License
This repository is licensed under the MIT License.