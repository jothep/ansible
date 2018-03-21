#!/bin/bash
app=$1

#to init a folder of app

mkdir -p $app/file
mkdir -p $app/group_vars
mkdir -p $app/hosts
mkdir -p $app/roles/$app/tasks

touch $app/$app.yml
touch $app/hosts/hosts
touch $app/group_vars/all.yml
echo "[$app]" > $app/hosts/hosts
touch $app/roles/$app/tasks/main.yml
cat << EOF > $app/$app.yml
## 
- hosts: $app
  #gather_facts: no
  roles:
  - $app
  tags:
  - $app
  vars_files:
    - group_vars/all.yml
EOF

