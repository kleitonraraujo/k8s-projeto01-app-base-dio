#!/bin/bash

echo "Criando as imagens..........."

docker build -t denilsonbonetti/projeto-backend:1.0 backend/.
docker build -t denilsonbonetti/projeto-database:1.0 database/.

echo "Realizando o push das imagens..........."

docker push denilsonbonetti/projeto-backend:1.0
docker push denilsonbonetti/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..........."

kubctl apply -f ./services.yml

echo "Criando os deployments..........."

kubctl apply -f ./deployments.yml
