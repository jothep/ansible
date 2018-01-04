kubectl config set-cluster kubernetes \
--certificate-authority=/opt/ssl/kubernetes/ca.pem \
--embed-certs=true \
--server=https://10.0.14.248:6443 \
--kubeconfig=nodeconfig

kubectl config set-credentials node \
--client-certificate=/opt/ssl/node/node.pem \
--embed-certs=true \
--client-key=/opt/ssl/node/node-key.pem \
--kubeconfig=nodeconfig

kubectl config set-context kubernetes \
--cluster=kubernetes \
--user=node \
--kubeconfig=nodeconfig

kubectl config use-context kubernetes --kubeconfig=nodeconfig

cp -f nodeconfig /opt/ssl/node/nodeconfig

