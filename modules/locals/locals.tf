locals {
  account_info = {
    subscription_id = "db000000-0000-0000-0000-00000bc00000"
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


