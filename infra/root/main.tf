module "rg" {
  source     = "../modules/resource_group"
  rg_details = var.rg_details
}

module "vnet" {
  source       = "../modules/vnet"
  vnet_details = var.vnet_details
  rgname       = module.rg.rg_name
}

module "subnet" {
  source         = "../modules/subnet"
  subnet_details = var.subnet_details
  rgname         = module.rg.rg_name
  vnetName       = module.vnet.vnet_name
}

module "public_ip" {
  source    = "../modules/public_ip"
  public_ip = var.public_ip
  rgname    = module.rg.rg_name
}

module "NSG" {
  source = "../modules/Network_security_group"
  network_security_group = var.network_security_group
  rgname = module.rg.rg_name
}

module "NSG_Rule" {
  source = "../modules/network_security_rule"
  nsg_rule = var.nsg_rule
  nsg_name = module.NSG.nsg_name
  rgname = module.rg.rg_name
}

module "NICs" {
  source       = "../modules/Network_interface_card"
  NIC_details  = var.NIC_details
  rgname       = module.rg.rg_name
  subnet_id    = module.subnet.subnet_id
  public_ip_id = module.public_ip.pub_ip_id
}

module "NIC_NSG_Assocation" {
  source = "../modules/NSG_NIC_Association"
  nic_nsg_assocation =   var.nic_nsg_assocation
  nsg_id = module.NSG.nsg_id
  NIC_id = module.NICs.NIC_id
}

module "linux-vm" {
  source   = "../modules/linux_vm"
  linux_vm = var.linux_vm
  nic_id   = module.NICs.NIC_id
  rgname   = module.rg.rg_name
}

module "storage_account" {
  source = "../modules/storage_account"
  storage_details = var.storage_details
  rgname = module.rg.rg_name
}

module "blob_container" {
  source = "../modules/blob_container"
  blob_container = var.blob_container
  storage_id = module.storage_account.storage_id
}