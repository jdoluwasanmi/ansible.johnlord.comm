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
