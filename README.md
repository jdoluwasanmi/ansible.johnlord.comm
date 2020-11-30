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
