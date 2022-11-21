variable "template_name" {
    default = "ubuntu-2004-cloudinit-template"
}

variable "kube_control_count" {
    default = 1
}
variable "kube_control_memory" {
    default = 4096
}
variable "kube_control_disksize" {
    default = "10G"
}

variable "kube_node_count" {
    default = 3
}
variable "kube_node_memory" {
    default = 4096
}
variable "kube_node_disksize" {
    default = "10G"
}