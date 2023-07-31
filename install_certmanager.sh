kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.12.1/cert-manager.yaml
   

kubectl get pods -n cert-manager -o wide


#cert-manager kubectl plugin 
curl -L -o kubectl-cert-manager.tar.gz https://github.com/jetstack/cert-manager/releases/latest/download/kubectl-cert_manager-linux-amd64.tar.gz
tar xzf kubectl-cert-manager.tar.gz
sudo mv kubectl-cert_manager /usr/local/bin

kubectl cert-manager check api


#Clean up
 kubectl delete -f https://github.com/jetstack/cert-manager/releases/download/v1.12.1/cert-manager.yaml