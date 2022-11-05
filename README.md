## Kubernetes server + worker node setup in proxmox using terraform and ansible

### Preqreqs
- Update provider info to reflect proxmox credentials
    - In proxmox, create a new admin user + create new API key
- Update the SSH key vars.tf to reflect your RSA public key identity
    - Normally in ~/.ssh/id_rsa.pub
- Have ansible installed on whatever machine you're running your playbooks on
    - Update ansible-hosts.txt to reflect the newly created VMs
    - See more in the readme in ./playbooks/

### To run
1. `terraform init`
2. `terraform plan`
3. `terraform apply`
4. Continue to ansible setup in ./playbooks/