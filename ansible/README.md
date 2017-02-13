## Deploy

$ ansible-playbook playbook.yml -l webserver -i hosts/hosts


docker run -it -v ~/.ssh/id_rsa:/root/.ssh/id_rsa  -v $(pwd)/keys/id_rsa.pub:/root/.ssh/id_rsa.pub -v $(pwd):/ansible/playbooks  philm/ansible_playbook playbook.yml -i hosts
