output "pub_ip_id" {
  value = {
    for key, pub_id in azurerm_public_ip.pip_ip :
    key => pub_id.id
  }
}