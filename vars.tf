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
    default = "ironman"
}
variable "template_name" {
    default = "ubuntu-2004-cloudinit-template"
}
variable "kube_server_count" {
    default = 1
}
variable "kube_server_memory" {
    default = 4096
}
variable "kube_server_disksize" {
    default = "10G"
}
variable "kube_agent_count" {
    default = 3
}
variable "kube_agent_memory" {
    default = 4096
}
variable "kube_agent_disksize" {
    default = "10G"
}