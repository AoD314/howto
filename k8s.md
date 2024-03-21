# K8s

## Commands

```
echo y | kubeadm reset || true
rm -rf /etc/cni/net.d || true
rm -rf /var/lib/etcd || true
rm -rf ~/.kube || true
```

## Install 

Docs: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl

### docker & containerd

```
systemctl status docker
systemctl status containerd
```

```
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install containerd docker-buildx-plugin docker-compose-plugin

systemctl start containerd
systemctl status containerd
systemctl enable containerd

apt-get install docker.io

systemctl start docker
systemctl status docker
systemctl enable docker

```
### k8s

```
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' > /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get install kubelet kubeadm kubectl

apt-mark hold kubelet kubeadm kubectl

systemctl enable --now kubelet
systemctl status kubelet

kubeadm init --pod-network-cidr=10.100.0.0/16

kubeadm join 192.168.1.13:6443 --token <TOKEN> \
        --discovery-token-ca-cert-hash sha256:<HASH>

```

### config kubectl

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
