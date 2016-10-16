#!/usr/bin/env bash

set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

${SCRIPT_ROOT}/virsh-destroy.sh
${SCRIPT_ROOT}/virsh-undefine.sh

echo "remove lvm volumes ..."

lvremove -f /dev/system/kubernetes-master
lvremove -f /dev/system/kubernetes-master-docker
lvremove -f /dev/system/kubernetes-master-kubelet

lvremove -f /dev/system/kubernetes-storage
lvremove -f /dev/system/kubernetes-storage-docker
lvremove -f /dev/system/kubernetes-storage-kubelet

lvremove -f /dev/system/kubernetes-etcd0
lvremove -f /dev/system/kubernetes-etcd0-docker
lvremove -f /dev/system/kubernetes-etcd0-kubelet

lvremove -f /dev/system/kubernetes-etcd1
lvremove -f /dev/system/kubernetes-etcd1-docker
lvremove -f /dev/system/kubernetes-etcd1-kubelet

lvremove -f /dev/system/kubernetes-etcd2
lvremove -f /dev/system/kubernetes-etcd2-docker
lvremove -f /dev/system/kubernetes-etcd2-kubelet

lvremove -f /dev/system/kubernetes-worker0
lvremove -f /dev/system/kubernetes-worker0-docker
lvremove -f /dev/system/kubernetes-worker0-kubelet

lvremove -f /dev/system/kubernetes-worker1
lvremove -f /dev/system/kubernetes-worker1-docker
lvremove -f /dev/system/kubernetes-worker1-kubelet

lvremove -f /dev/system/kubernetes-worker2
lvremove -f /dev/system/kubernetes-worker2-docker
lvremove -f /dev/system/kubernetes-worker2-kubelet


echo "done"
