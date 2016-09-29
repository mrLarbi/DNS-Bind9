role_path=$1
dns_master_ip=$2
dns_slave_ip=$3
conf_hostname=$4
conf_domain=$5
ansible-playbook $role_path/tests/test_slave.yml -i $role_path/tests/hosts \
            --extra-vars "hostname=$conf_hostname" \
            --extra-vars "domain_name=$conf_domain" \
            --extra-vars "master_host=${dns_master_ip}"
            
echo "nameserver $dns_master_ip" > /etc/resolv.conf
echo "nameserver $dns_slave_ip" >> /etc/resolv.conf

#test master
ping -c 4 www.$conf_hostname.$conf_domain

#test forwarders
ping -c 4 www.google.com
