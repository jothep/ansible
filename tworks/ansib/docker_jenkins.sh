#!/bin/bash
ansible-playbook -i /opt/tworks/ansib/hosts/hosts /opt/tworks/ansib/docker.yml -vv

ansible-playbook -i /opt/tworks/ansib/hosts/hosts /opt/tworks/ansib/jenkins.yml -vv

ansible-playbook -i /opt/tworks/ansib/hosts/hosts /opt/tworks/ansib/jk-build.yml -vv
