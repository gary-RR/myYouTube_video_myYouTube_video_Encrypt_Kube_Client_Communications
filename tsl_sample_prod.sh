MY_DOMAIN_DNS_NAME="your-domain-name.com"

#Create deployment test
kubectl create deployment test --image=gcr.io/google-samples/hello-app:1.0
#Create service my-service
kubectl expose deployment test --name my-service  --port=80 --target-port=8080 

#Cert Issuer prod
kubectl apply -f cert_issuer_prod.yaml

kubectl get ClusterIssuer
#kubectl describe ClusterIssuer letsencrypt-prod

kubectl apply -f ingress_prod.yaml  

kubectl get ingress
#kubectl describe ingress  tls-ingress-prod

kubectl get certs -o wide
#kubectl describe cert letsencrypt-prod

openssl s_client -connect  $MY_DOMAIN_DNS_NAME:443 2>/dev/null 

curl  https://$MY_DOMAIN_DNS_NAME

#Clean up
kubectl delete deployment test
kubectl delete svc my-service
kubectl delete ClusterIssuer letsencrypt-prod 
kubectl delete ingress tls-ingress-prod

#Trouble shooting tips: https://cert-manager.io/docs/troubleshooting/acme/