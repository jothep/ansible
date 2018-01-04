#!/bin/bash
KUBERNETES_PUBLIC_ADDRESS={{ k8slb }}
master1={{ master1 }}
master2={{ master2 }}
master3={{ master3 }}
clusterIp={{ clusterip }}

cd /opt/certs/
cat > kubernetes-csr.json <<EOF
{
  "CN": "kubernetes",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "CN",
      "L": "Shenzhen",
      "O": "Kubernetes",
      "OU": "Kubernetes The Hard Way",
      "ST": "Shenzhen"
    }
  ]
}
EOF

cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -hostname=${master1},${master2},${master3},${KUBERNETES_PUBLIC_ADDRESS},127.0.0.1,10.254.0.1,${clusterIp},kubernetes,kubernetes.default,kubernetes.default.svc \
  -profile=kubernetes \
  kubernetes-csr.json | cfssljson -bare kubernetes

ls kubernetes*
