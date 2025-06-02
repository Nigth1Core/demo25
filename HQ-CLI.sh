hostnamectl set-hostname hq-cli.au-team.irpo;
apt-get update && apt-get install tzdata  
timedatectl set-timezone Europe/Samara

# SSH user
useradd sshuser -u 1010
echo "sshuser:P@ssw0rd" | chpasswd
usermod -aG wheel sshuser
touch /etc/sudoers
vim /etc/sudoers
sshuser ALL=(ALL) NOPASSWD:ALL

#Дальше ssh

# А это к Samba  2.1 Syshelper
echo "default_realm = AU-TEAM.IRPO" | sudo tee -a /etc/krb5.conf
echo "nameserver 192.168.0.30" | sudo tee -a /etc/resolv.conf

apt-get update && apt-get install -y gpupdate
gpupdate-setup enable
apt-get install -y admc
apt-get install -y gpui
apt-get install -y libnss-role
control libnss-role
roleadd hq wheel
rolelst
apt-get install -y admx-*
admx-msi-setup
