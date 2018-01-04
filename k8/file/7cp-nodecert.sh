for no in 10.0.14.1 10.0.14.2 ;do
scp -P 12346 /opt/ssl/node/* ${no}:/opt/ssl/kubernetes/
done
