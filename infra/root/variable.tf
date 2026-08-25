variable "rg_details" {
  type = map(object({
    name     = string
    location = string
    tag_name = string
  }))
}

variable "vnet_details" {
  type = map(object({
    name           = string
    location       = string
    resource_group = string
    address_space  = list(string)
  }))
}

variable "subnet_details" {
  type = map(object({
    name                 = string
    resource_group       = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "public_ip" {
  description = "This is used to provide the public ip details"
}

variable "NIC_details" {
  description = "This is used to provide the NIC details"
}

variable "windows_server" {
}