# ansible



---
- name: This sets up an httpd webserver
  hosts: webhost
  tasks:
  - name: Install apache packages 
    yum:
      name: httpd
      state: present
  - name: ensure httpd is running
    service:
      name: httpd 
      state: started
  - name: Open port 80 for http access
    firewalld:
      service: http
      permanent: true
      state: enabled
  - name: Restart the firewalld service to load in the firewall changes
    service: 
      name: firewalld 
      state: restarted


vim /etc/ansible/hosts
bitpost.johnlord.comm ansible_ssh_host=ans.johnlord.comm ansible_user=r
oot

ansible-playbook main.yml --ask-pass

---
- name: update the system
  hosts: webservers
  tasks:
  - name: update the system
    yum:
      name: "*"
      state: latest
      
ansible-playbook -u root --ask-pass -l bitpost.johnlord.comm main.yml

UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\r\n@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @\r\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\r\nIT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY! 
solution: type this in your inventory
[all:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o userknownhostsfile=/dev/null'

yum install ansible -y
ssh-keygen -b 4048
ssh-copy-id root@CLIENTS IP
vim /etc/ansible/hosts
edit webservers
10.10.10.99 ansible_user=<user>

ansible webservers -m ping
ansible webservers -a "service httpd status"
ansible webservers -a "systemctl status vsftpd"
ansible webservers -a "cat /proc/cpuinfo"

[webservers]
apache.johnlord.comm ansible_ssh_user=root


BASIC YUM UPDATE EPEL INSTALL AND PACKAGE INSTALL
---
- name: update the system
  hosts: new
  tasks:
  - name: update the system
    yum:
      name: "*"
      state: latest
  - name: Install a list of packages
    yum:
      name:
        - epel-release
        - vim
      state: present
  - name: Install epel-release package
    yum:
      name: epel-release
      state: present  
  - name: Install EPEL repo.
    yum:
      name: https://dl.fedoraproject.org/pub/epel/epel-release-latest-{{ ansible_distribution_major_version }}.noarch.rpm
      state: present
  - name: Ensure EPEL is enabled 
    yum: 
      name: epel-release 
      state: present 
      
      
      
httpd ansible
---
- name: This sets up an httpd webserver
  hosts: webservers
  tasks:
  - name: Install apache packages
    yum:
      name: httpd
      state: present
  - name: ensure httpd is running
    service:
      name: httpd
      state: started



***ANSIBLE TOWER CONFIGURATION***
RAM:4G
HD: 32G
systemctl disable firewalld; systemctl stop firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config


Step 1: Change directories
Change directories to /tmp

cd /tmp

Step 2: Download Red Hat Ansible Tower
Download the latest Ansible Tower package

curl -O https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-3.7.3-1.tar.gz

Step 3: Untar and unzip the package file

tar xvfz /tmp/ansible-tower-setup-3.7.3-1.tar.gz

Step 4: Change directories
Change directories into the Ansible Tower setup package

cd /tmp/ansible-tower-setup-*/

Step 5: Open inventory file
Using an editor of your choice, open the inventory file

vim inventory

Step 6: Identify variables
Fill a few variables out in an inventory file: admin_password, pg_password, rabbitmq_password

[tower]
localhost ansible_connection=local

[database]

[all:vars]
admin_password='password'

pg_host=''
pg_port=''

pg_database='awx'
pg_username='awx'
pg_password='password'
pg_sslmode='prefer'  # set to 'verify-full' for client-side enforced SSL

# Isolated Tower nodes automatically generate an RSA key for authentication;
# To disable this behavior, set this value to false
# isolated_key_generation=true


# SSL-related variables

# If set, this will install a custom CA certificate to the system trust store.
# custom_ca_cert=/path/to/ca.crt

# Certificate and key to install in nginx for the web UI and API
# web_server_ssl_cert=/path/to/tower.cert
# web_server_ssl_key=/path/to/tower.key

# Server-side SSL settings for PostgreSQL (when we are installing it).
# postgres_use_ssl=False
# postgres_ssl_cert=/path/to/pgsql.crt
# postgres_ssl_key=/path/to/pgsql.key
Step 7: Run setup
Run the Ansible Tower setup script

sudo ./setup.sh

Step 7 will take approx. 10-15 minutes to complete. This may be a good time to take a break.

Step 8: Confirm results
At this point, your Ansible Tower installation should be complete. You can access your Tower workshop (not forgetting that workshopname is the name of your workshop, and # is your student number) at:

https://example.tower.0.rhnaps.io
Ensuring Installation Success
