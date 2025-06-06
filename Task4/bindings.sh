#!/bin/bash

# Привязка роли cluster-admin группе cluster-admins
kubectl create clusterrolebinding cluster-admin-cluster-admins --clusterrole=cluster-admin --group=cluster-admins

# Приавязка роли cluster-secret-manager к группе cluster-security
kubectl create clusterrolebinding cluster-secret-manager-cluster-security --clusterrole=cluster-secret-manager --group=cluster-security

# Приавязка роли cluster-reader к группе cluster-security
kubectl create clusterrolebinding cluster-reader-cluster-security --clusterrole=cluster-reader --group=cluster-security

# Привязка роли business1-developer к группе business1-developers в namespace business1-dev
kubectl create rolebinding business1-developer-business1-developers --role=business1-developer --group=business1-developers --namespace=business1-dev