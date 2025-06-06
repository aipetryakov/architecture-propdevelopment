#!/bin/bash

# business1-dev namespace для разработки по соответвующему направлению 
kubectl create namespace business1-dev

# сluster-admin роль для всего кластера (уже существует в kubernetes)

# secret-manager роль для всего кластера
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-secret-manager
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["*"]
EOF

# cluster-reader роль для всего кластера
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-reader
rules:
- apiGroups: ["*"]
  resources: ["*"]
  verbs: ["get", "list", "watch"]
EOF

# business1-developer роль для namespace business1
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: business1-dev
  name: business1-developer
rules:
- apiGroups: ["", "apps", "extensions"]
  resources: ["deployments", "replicasets", "pods", "services"]
  verbs: ["*"]
EOF
