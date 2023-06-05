#!/bin/bash

printf "Uninstalling k3s...\n"
printf "#######################################################\n\n"
ansible-playbook -i ./inventory/k3s-cluster/hosts.ini reset.yml
ansible-playbook -i ./inventory/k3s-cluster/hosts.ini reboot.yml

printf "Installing k3s...\n"
printf "#######################################################\n\n"
ansible-playbook -i ./inventory/k3s-cluster/hosts.ini site.yml

printf "Refreshing local kucectl config\n"
printf "#######################################################\n\n"
scp khadas@192.168.15.73:~/.kube/config ~/.kube/config