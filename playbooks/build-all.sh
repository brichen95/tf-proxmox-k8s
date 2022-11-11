#!/bin/bash

# Ping everything just in case
ansible -i ansible-hosts.txt all -u ubuntu -m ping

ansible-playbook -i ansible-hosts.txt ansible-install-kubernetes-dependencies.yml

ansible-playbook -i ansible-hosts.txt ansible-init-cluster.yml

ansible-playbook -i ansible-hosts.txt ansible-get-join-command.yml

ansible-playbook -i ansible-hosts.txt ansible-join-workers.yml