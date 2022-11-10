#!/bin/sh

echo "Criando imagens................"
docker build -t edu704/backend-projeto-kubernetes:1.0 backend/.
docker build -t edu704/database-projeto-kubernetes:1.0 database/.

echo "subindo imagens para o dockerhub..................."
docker push edu704/backend-projeto-kubernetes:1.0
docker push edu704/database-projeto-kubernetes:1.0

echo "criando serviços do cluster................."
kubectl apply -f svc-db.yml
kubectl apply -f svc-php.yml

echo "Relizando deploymentes.........."
kubectl apply -f pv.yml
kubectl apply -f pvc.yml
kubectl apply -f deployment-db.yml
kubectl apply -f deployment-backend.yml
