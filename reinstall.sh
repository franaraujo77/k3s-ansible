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

printf "Processing all nodes...\n"
printf "#######################################################\n\n"

#iterate over all nodes listed by kubectl
for ns in $(kubectl get nodes -l '!node-role.kubernetes.io/master' --no-headers | awk '{print $1}'); do
    kubectl label node ${ns} node-role.kubernetes.io/worker 
done