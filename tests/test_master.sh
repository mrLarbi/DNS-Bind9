role_path=$1
dns_master_ip=$2
dns_slave_ip=$3
conf_hostname=$4
conf_domain=$5
ansible-playbook $role_path/tests/test_master.yml -i $role_path/tests/hosts \
            --extra-vars "bind_hostname=$conf_hostname" \
            --extra-vars "bind_domain_name=$conf_domain" \
            --extra-vars "{\"bind_master_entries\":[{\"name\": \"www\", \"ip\":\"${dns_master_ip}\"}]}" \
            --extra-vars "{\"bind_slave_hosts\":[\"${dns_slave_ip}\"]}" || exit 1
            
echo "nameserver $dns_master_ip" > /etc/resolv.conf 

#test master
ping -c 4 www.$conf_hostname.$conf_domain || exit 1

#test forwarders
ping -c 4 www.google.com || exit 1
