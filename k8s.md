# K8s

## Commands

```
echo y | kubeadm reset || true
rm -rf /etc/cni/net.d || true
rm -rf /var/lib/etcd || true
rm -rf ~/.kube || true
```

## kubeadm

```
kubeadm token create --print-join-command
```

## kubectl

```
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
```

```
kubectl get pods -A
```

Check k8s:

```
kubectl run -i --tty busybox --image=busybox -- sh
kubectl attach busybox -i
kubectl delete pod busybox
```


## Install 

Docs: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl

### docker & containerd

```
apt-get install -y ca-certificates curl gnupg lsb-release
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
sudo apt-get install docker.io -y
systemctl enable docker.service
systemctl start docker.service


systemctl status containerd
systemctl status docker

echo 1 > /proc/sys/net/ipv4/ip_forward
lsmod | grep br_netfilter
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system

cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "314m"
  },
  "storage-driver": "overlay2"
}
EOF

sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker

```

if there are some issues:

reinit containerd config:
```
containerd config default > /etc/containerd/config.toml
```
then set:
```
systemd_cgroup=false --> true
...
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
     SystemdCgroup = true
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

kubeadm init --pod-network-cidr=10.244.0.0/16 --cri-socket=unix:///var/run/containerd/containerd.sock

kubeadm join 192.168.1.13:6443 --token <TOKEN> \
        --discovery-token-ca-cert-hash sha256:<HASH>

```

### config kubectl

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
or 
```
echo "export KUBECONFIG=/etc/kubernetes/admin.conf" > /etc/environment
export KUBECONFIG=/etc/kubernetes/admin.conf
```

# Helm

## Install

```
wget https://get.helm.sh/helm-v3.14.3-linux-amd64.tar.gz
tar -zxvf helm-v3.14.3-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
```

# Gitlab

https://docs.gitlab.com/ee/install/docker.html
https://docs.gitlab.com/runner/install/kubernetes.html

```
export GITLAB_HOME=/path/to/folder
docker run --detach   \
    --hostname gitlab.zion.com   \
    --env GITLAB_OMNIBUS_CONFIG="external_url 'http://gitlab.zion.com'" \
    --publish 8443:443 \
    --publish 8080:80 \
    --publish 8022:22 \
    --name gitlab \
    --restart always \
    --volume $GITLAB_HOME/config:/etc/gitlab
    --volume $GITLAB_HOME/logs:/var/log/gitlab \
    --volume $GITLAB_HOME/data:/var/opt/gitlab  \
    --shm-size 256m \
    gitlab/gitlab-ce:16.10.0-ce.0
```

This container uses the official Linux package, so all configuration is done in the unique configuration file /etc/gitlab/gitlab.rb.

To access the GitLab configuration file, you can start a shell session in the context of a running container. This will allow you to browse all directories and use your favorite text editor:

```
docker exec -it gitlab /bin/bash
docker restart gitlab
```

# some may be helpfull links:

* https://github.com/containerd/containerd/blob/main/docs/cri/config.md
