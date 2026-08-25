variable "subnet_details" {
  type = map(object({
    name                 = string
    resource_group       = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "rgname" {
}

variable "vnetName" {
}