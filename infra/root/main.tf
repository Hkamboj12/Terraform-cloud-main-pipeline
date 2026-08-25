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

module "NICs" {
  source       = "../modules/Network_interface_card"
  NIC_details  = var.NIC_details
  rgname       = module.rg.rg_name
  subnet_id    = module.subnet.subnet_id
  public_ip_id = module.public_ip.pub_ip_id
}

module "windows-server" {
  source =   "../modules/windows_server"
  windows_server = var.windows_server
  nic_id = module.NICs.NIC_id
  rgname = module.rg.rg_name
}