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