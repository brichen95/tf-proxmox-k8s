variable "proxmox_api_url" {
    default = "https://<proxmox_ip>:8006/api2/json"
}
variable "proxmox_api_token_id" {
    default = "<proxmox_username>@pam!<token_name>"
}
variable "proxmox_api_token_secret" {
    default = "<proxmox_token_secret>"
}
variable "ssh_key" {
    default = "ssh-rsa <my_rsa_pub_key>"
}
variable "proxmox_host" {
    default = "<proxmox_cluster>"
}