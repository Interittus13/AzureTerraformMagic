variable "rg_module" {
    type = map(object({
        name = string
        location = optional(string, "central india")
        tags = optional(map(string))
    }))
}