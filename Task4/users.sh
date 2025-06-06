#!/bin/bash

# Пользователь petrov (cluster-admins)
openssl genrsa -out petrov.key 2048
openssl req -new -key petrov.key -out petrov.csr -subj "/CN=petrov/O=cluster-admins"
openssl x509 -req -in petrov.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out petrov.crt -days 365
kubectl config set-credentials petrov --client-certificate=petrov.crt --client-key=petrov.key

# Пользователь ivanov (cluster-readers and cluster-security)
openssl genrsa -out ivanov.key 2048
openssl req -new -key ivanov.key -out ivanov.csr -subj "/CN=ivanov/O=cluster-readers/O=cluster-security"
openssl x509 -req -in ivanov.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out ivanov.crt -days 365
kubectl config set-credentials ivanov --client-certificate=ivanov.crt --client-key=ivanov.key

# Пользователь sidorov (business1-developers)
openssl genrsa -out sidorov.key 2048
openssl req -new -key sidorov.key -out sidorov.csr -subj "/CN=sidorov/O=business1-developers"
openssl x509 -req -in sidorov.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out sidorov.crt -days 365
kubectl config set-credentials sidorov --client-certificate=sidorov.crt --client-key=sidorov.key
