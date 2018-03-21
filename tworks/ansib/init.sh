#!/bin/bash
yum install -y ansible
if [ $? != 0 ];then
    echo "ansible安装失败"
    exit 1

sed -i "s/#host_key_checking = False/host_key_checking = False/g" /etc/ansible/ansible.cfg

yum install -y wget
if [ $? != 0 ];then
    echo "wget安装失败"
    exit 1

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install docker-py
