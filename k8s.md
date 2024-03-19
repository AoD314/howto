# K8s

# Install 

Docs: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl

help links:
- https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/

```

sudo su - root

apt update
apt upgrade
apt autoremove

apt install software-properties-common apt-transport-https ca-certificates gnupg2 gpg sudo

echo "overlay" >> /etc/modules
echo "br_netfilter" >> /etc/modules

echo 1 > /proc/sys/net/ipv4/ip_forward

apt purge kubernetes-cni kubectl kubelet kubeadm containerd
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
apt update

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get install -y kubelet kubeadm kubectl
#disable auto update
apt-mark hold kubelet kubeadm kubectl

systemctl enable --now kubelet

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


kubeadm init --pod-network-cidr=10.100.0.0/16

kubeadm join 192.168.1.13:6443 --token l6dvo4.fgrek25oxnaxrxy5 \
        --discovery-token-ca-cert-hash sha256:ca0efe27f81a34dcc383faa8fc10457287d37cbfa5fb6c8317d8c151b83c9f73


```

Access to k8s:

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


```

# Commands

```
kubectl get nodes [<NAME> -o yaml]

```
