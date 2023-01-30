variable "template_name" {
  default = "ubuntu-2204-cloudinit-template"
}

variable "proxmox_host" {
  default = "ironman"
}

variable "kube_control_count" {
  default = 1
}
variable "kube_control_memory" {
  default = 4096
}
variable "kube_control_cores" {
  default = 2
}
variable "kube_control_disksize" {
  default = "10G"
}

variable "kube_node_count" {
  default = 2
}
variable "kube_node_memory" {
  default = 10240
}
variable "kube_node_cores" {
  default = 2
}
variable "kube_node_disksize" {
  default = "10G"
}
