role_path=$1
ansible-playbook $role_path/tests/test.yml -i $role_path/tests/hosts
