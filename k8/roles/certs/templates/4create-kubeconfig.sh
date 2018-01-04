kubectl config set-cluster kubernetes \
--certificate-authority=/opt/certs/ca.pem \
--embed-certs=true \
--server={{ fullk8slb }} \
--kubeconfig=/opt/certs/kubeconfig

kubectl config set-credentials admin \
--client-certificate=/opt/certs/kubernetes.pem \
--embed-certs=true \
--client-key=/opt/certs/kubernetes-key.pem \
--kubeconfig=/opt/certs/kubeconfig

kubectl config set-context kubernetes \
--cluster=kubernetes \
--user=admin \
--kubeconfig=/opt/certs/kubeconfig

kubectl config use-context kubernetes --kubeconfig=/opt/certs/kubeconfig

