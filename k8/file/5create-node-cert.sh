#!/bin/bash
KUBERNETES_PUBLIC_ADDRESS='10.0.14.248'
node1=10.0.14.1
node2=10.0.14.2
name1=aliyun-kube-node-10-0-14-1
name2=aliyun-kube-node-10-0-14-2
clusterIp=10.240.0.1

cat > node-csr.json <<EOF
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
  -hostname=${node1},${node2},${name1},${name2},${KUBERNETES_PUBLIC_ADDRESS},127.0.0.1,10.254.0.1,${clusterIp},kubernetes,kubernetes.default \
  -profile=kubernetes \
  node-csr.json | cfssljson -bare node

ls node*
mkdir -p /opt/ssl/node
cp node.pem /opt/ssl/node
cp node-key.pem /opt/ssl/node
