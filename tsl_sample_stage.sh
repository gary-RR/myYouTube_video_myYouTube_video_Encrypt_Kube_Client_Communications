MY_DOMAIN_DNS_NAME="your-domain-name.com"

#Create deployment test
kubectl create deployment test --image=gcr.io/google-samples/hello-app:1.0
#Create service my-service
kubectl expose deployment test --name my-service  --port=80 --target-port=8080 

#Cert Issuer stage
kubectl apply -f cert_issuer_stage.yaml

kubectl get ClusterIssuer
#kubectl describe ClusterIssuer letsencrypt-stage 

#Create stage ingress
kubectl apply -f ingress_stage.yaml

kubectl get ingress
#kubectl describe ingress  tls-ingress-stage

kubectl get certs -o wide
#kubectl describe cert letsencrypt-stage

openssl s_client -connect  $MY_DOMAIN_DNS_NAME:443 2>/dev/null 

curl -k https://$MY_DOMAIN_DNS_NAME

#Clean up
kubectl delete deployment test
kubectl delete svc my-service
kubectl delete ClusterIssuer letsencrypt-stage 
kubectl delete ingress tls-ingress-stage

#Trouble shooting tips: https://cert-manager.io/docs/troubleshooting/acme/