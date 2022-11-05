### I have VM's in proxmox, I need to hook them together to set up kubernetes

#### Preqreqs
- Ansible installed
- Edit _ansible-hosts.txt_ to reflect IP's
- Below command should work

    `ansible -i ansible-hosts.txt all -u ubuntu -m ping`


#### Steps to run
1. Install k8s dependencies

    `ansible-playbook -i ansible-hosts.txt ansible-install-kubernetes-dependencies.yml`

2. Initialize k8s cluster

    `ansible-playbook -i ansible-hosts.txt ansible-init-cluster.yml`

3. Get k8s join command

    `ansible-playbook -i ansible-hosts.txt ansible-get-join-command.yml`

4. Join k8s workers

    `ansible-playbook -i ansible-hosts.txt ansible-join-workers.yml`

#### Useful commands
- Get k8s nodes/status

    `kubectl get nodes`
    