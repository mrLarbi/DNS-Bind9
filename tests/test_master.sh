role_path=$1
dns_master_ip=$2
conf_hostname="yoda"
conf_domain="jedi"
ansible-playbook $role_path/tests/test_master.yml -i $role_path/tests/hosts
                        \ --extra-vars "hostname=$conf_hostname"
                        \ --extra-vars "domain_name=$conf_domain"

echo "nameserver $dns_ip" > /etc/resolv.conf 

ping -c 4 www.$conf_hostname.$conf_domain
