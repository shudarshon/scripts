#!/bin/bash

apt-get install wget curl git zip unzip htop software-properties-common python-setuptools build-essential gcc node-rimraf automake autoconf screen supervisor -y

###install chromium browser

install_chrome() {

apt-get install chromium-browser -y

}

###install atom

install_atom() {

add-apt-repository ppa:webupd8team/atom -y
apt-get update
apt-get install atom -y

}

###install and customize vim

install_vim() {

apt-get update
apt-get install vim -y
git clone --recursive https://github.com/jessfraz/.vim.git .vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
cd $HOME/.vim
git submodule update --init

}

###install python and pip

install_python_pip() {

curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
rm get-pip.py

}

###installing ansible

install_ansible() {

apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install ansible -y

}

###installing awscli

install_awscli() {

pip install --upgrade awscli
pip install saws
aws --version

}

###install fabric

install_fabric() {

pip install fabric

}
###install java

install_java() {

add-apt-repository ppa:webupd8team/java -y
apt update
apt install oracle-java8-installer -y
update-alternatives --config java	            #choose the java path from here
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre
whereis java
java --version

}

###installing sdkman

install_sdkman() {

curl -s "https://get.sdkman.io" | sudo bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

}

###installing nodejs and yarn

install_node_yarn() {

curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get install nodejs -y

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install yarn -y

}

###installing docker and docker compose

install_docker() {

apt-get update --fix-missing
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce -y
systemctl enable docker
systemctl start docker
systemctl status docker
usermod -aG docker ${USER}
docker info

curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

}

###installing kubectl-k8s administering tool

install_k8s() {

apt-get update --fix-missing
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl -v

}

###installing packer

install_packer(){

apt-get update --fix-missing
wget https://releases.hashicorp.com/packer/1.1.0/packer_1.1.0_linux_amd64.zip?_ga=2.232436184.61790985.1507479007-1415811543.1507479007 -O packer.zip
unzip packer.zip
mv packer /usr/local/bin/
rm packer.zip
packer -v

}

###installing terraform

install_terraform(){

apt-get update --fix-missing
wget https://releases.hashicorp.com/terraform/0.9.11/terraform_0.9.11_linux_386.zip?_ga=2.175031905.2120335327.1499887964-1517736643.1499887964
mv terraform_0.9.11_linux_386.zip\?_ga\=2.175031905.2120335327.1499887964-1517736643.1499887964 terraform.zip
unzip terraform.zip
mv terraform /usr/local/bin/
rm terraform*
terraform -v

}

###installing progam

install_python_pip
install_awscli
install_fabric
install_ansible
install_java
install_docker
install_k8s
install_packer
install_terraform
install_sdkman
install_node_yarn
install_chrome
install_vim
install_atom
