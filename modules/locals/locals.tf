locals {
  # createdOn = formatdate("DD-MM-YYYY", timestamp())

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


