variable "linux_vm" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    size                 = string
    admin_username       = string
    admin_password       = string
    network_interface_id = string
  }))
}

variable "rgname" {
  type = map(string)
}

variable "nic_id" {
  type = map(string)
}