# variable "defaultTags" {
#   type = map(string)
# }

variable "tags" {
  type = map(string)
}

# variable "createdOn" {
#   type = string
# }

# Resource Group
variable "rg" {
  type = map(object({
    rg_name  = string
    location = string
  }))
}
