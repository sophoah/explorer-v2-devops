# api
ansible-playbook playbooks/install-update-explorer-be.yml -i hosts -e 'inventory=apis' -v
# indexer
ansible-playbook playbooks/install-update-explorer-be.yml -i hosts -e 'inventory=indexers' -v