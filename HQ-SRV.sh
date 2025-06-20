hostnamectl set-hostname hq-srv.au-team.irpo
#Файл Сироткиной
#Создание пользователя sshuser и настройка sshd конфига
useradd sshuser -u 1010
echo "sshuser:P@ssw0rd" | chpasswd
usermod -aG wheel sshuser
touch /etc/sudoers
vim /etc/sudoers
sshuser ALL=(ALL) NOPASSWD:ALL
#Дальше ssh

apt-get update && apt-get install tzdata  
timedatectl set-timezone Europe/Samara

# DNS
apt-get update && apt-get install -y dnsmasq
vim /etc/dnsmasq.conf 
no-resolv
no-poll
no-hosts
listen-address=192.168.18.62

server=77.88.8.8
server=8.8.8.8

cache-size=1000
all-servers
no-negcache

host-record=hq-rtr.au-team.irpo,192.168.18.1
host-record=hq-srv.au-team.irpo,192.168.18.62
host-record=hq-cli.au-team.irpo,192.168.18.66

address=/br-rtr.au-team.irpo/192.168.17.1
address=/br-srv.au-team.irpo/192.168.17.30

cname=moodle.au-team.irpo,hq-rtr.au-team.irpo
cname=wiki.au-team.irpo,hq-rtr.au-team.irpo

systemctl restart dnsmasq

