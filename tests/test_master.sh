role_path=$1
ansible-playbook $role_path/tests/test_master.yml -i $role_path/tests/hosts

