install a k8s cluster by ansible
certs
etcd
flannel
docker
k8smaster
/opt/ansible/k8/
ansible-playbook -i hosts/build site.yml -vv

## create new playbook repo
./initapp.sh $PlaybookName
