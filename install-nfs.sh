#!/bin/bash

printf "Uninstalling nfs...\n"
printf "#######################################################\n\n"
ansible-playbook -i ./inventory/k3s-cluster/hosts.ini reboot-nfs.yml

printf "Installing nfs...\n"
printf "#######################################################\n\n"
ansible-playbook -i ./inventory/k3s-cluster/hosts.ini nfs.yml
