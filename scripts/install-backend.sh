# api
ansible-playbook playbooks/harden-vps.yml -i hosts -e 'inventory=apis' -v
ansible-playbook playbooks/install-docker.yml -i hosts -e 'inventory=apis' -v
ansible-playbook playbooks/install-update-explorer-be.yml -i hosts -e 'inventory=apis' -v
# indexer
ansible-playbook playbooks/harden-vps.yml -i hosts -e 'inventory=indexers' -v
ansible-playbook playbooks/install-docker.yml -i hosts -e 'inventory=indexers' -v
ansible-playbook playbooks/install-update-explorer-be.yml -i hosts -e 'inventory=indexers' -v