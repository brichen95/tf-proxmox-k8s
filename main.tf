# All props to https://austinsnerdythings.com/2021/09/01/how-to-deploy-vms-in-proxmox-with-terraform/

terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.8"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.proxmox_api_url
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure = true # I don't have proxmox https/SSL set up right
}

resource "proxmox_vm_qemu" "kube-server" {
  count = var.kube_server_count
  name = "kube-server-0${count.index + 1}"
  target_node = var.proxmox_host
  vmid = "70${count.index + 1}"
  clone = var.template_name
  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = var.kube_server_memory
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disk {
    slot = 0
    size = var.kube_server_disksize
    type = "scsi"
    storage = "local"
    iothread = 1
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  network {
    model = "virtio"
    bridge = "vmbr17"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=10.0.1.7${count.index + 1}/24,gw=10.0.1.1"
  ipconfig1 = "ip=10.17.0.7${count.index + 1}/24"
  sshkeys = var.ssh_key
}

resource "proxmox_vm_qemu" "kube-agent" {
  count = var.kube_agent_count
  name = "kube-agent-0${count.index + 1}"
  target_node = var.proxmox_host
  vmid = "80${count.index + 1}"
  clone = var.template_name
  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = var.kube_agent_memory
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disk {
    slot = 0
    size = var.kube_agent_disksize
    type = "scsi"
    storage = "local"
    iothread = 1
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  network {
    model = "virtio"
    bridge = "vmbr17"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=10.0.1.8${count.index + 1}/24,gw=10.0.1.1"
  ipconfig1 = "ip=10.17.0.8${count.index + 1}/24"
  sshkeys = var.ssh_key
}

# resource "proxmox_vm_qemu" "kube-storage" {
#   count = 1
#   name = "kube-storage-0${count.index + 1}"
#   target_node = var.proxmox_host
#   vmid = "90${count.index + 1}"
#   clone = var.template_name
#   agent = 1
#   os_type = "cloud-init"
#   cores = 2
#   sockets = 1
#   cpu = "host"
#   memory = 4096
#   scsihw = "virtio-scsi-pci"
#   bootdisk = "scsi0"
#   disk {
#     slot = 0
#     size = "20G"
#     type = "scsi"
#     storage = "local-lvm"
#     iothread = 1
#   }
#   network {
#     model = "virtio"
#     bridge = "vmbr0"
#   }
#   network {
#     model = "virtio"
#     bridge = "vmbr17"
#   }
#   lifecycle {
#     ignore_changes = [
#       network,
#     ]
#   }
#   ipconfig0 = "ip=10.0.1.9${count.index + 1}/24,gw=10.0.1.1"
#   ipconfig1 = "ip=10.17.0.9${count.index + 1}/24"
#   sshkeys = var.ssh_key
# }