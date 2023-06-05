#!/bin/bash

ansible-playbook -i ./inventory/k3s-cluster/hosts.ini reboot.yml
