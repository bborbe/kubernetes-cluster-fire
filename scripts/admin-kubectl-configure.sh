#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

mkdir -p $HOME/.kube/fire
kubectl config set-cluster fire-cluster --server=https://172.16.22.10:443 --certificate-authority=$HOME/.kube/fire/ca.pem
kubectl config set-credentials fire-admin --certificate-authority=$HOME/.kube/fire/ca.pem --client-key=$HOME/.kube/fire/admin-key.pem --client-certificate=$HOME/.kube/fire/admin.pem
kubectl config set-context fire-system --cluster=fire-cluster --user=fire-admin
kubectl config use-context fire-system

echo "test with 'kubectl get nodes'"
