variable "tags" {
  type = map(string)
}

# Resource Group
variable "rg" {
  type = map(object({
    rg_name  = string
    location = string
  }))
}
