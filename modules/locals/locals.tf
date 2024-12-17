locals {
  account_info = {
    subscription_id = "db349500-42dc-484d-8f42-28157bc01930"
  }

  defaultTags = {
    bizimpact = "medium",
    createdBy = "Terraform"
    owner     = "Terraform"
    env       = "staging"
    dept      = "IT",
    email     = "arpit@gmail.com",
    createdOn = formatdate("DD-MM-YYYY", timestamp()),
  }
}


