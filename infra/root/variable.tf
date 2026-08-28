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

variable "linux_vm" {
  description = "This is used to provide the VM details"
}

variable "network_security_group" {
  description = " This is used to NSG for application"
}

variable "nsg_rule" {
  description = " This variable is for nsg rules"
}

variable "nic_nsg_assocation" {
  description = "This is used for nic and nsg"
}

variable "storage_details" {
  description = "This is used to enter the storage account details"
}

variable "blob_container" {
    description = "This variable is used to create the blob container inside the storage account"
}