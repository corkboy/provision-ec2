#!/usr/bin/env bash

# Ensure our environment is configured correctly for dev first
source ./ScriptLib/bootstrap-devops.sh

# Then run the playbook
ansible-playbook -i playbooks/inventory playbooks/main.yml

echo "Your playbook has completed!"
