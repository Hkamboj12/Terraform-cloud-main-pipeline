variable "vnet_details" {
  type = map(object({
    name           = string
    location       = string
    resource_group = string
    address_space  = list(string)
  }))
}

variable "rgname" {
}