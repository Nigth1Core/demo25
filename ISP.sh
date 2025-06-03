ТОЛЬКО IP и SSH
Не забыть etc/resolv.conf
#Файл Сироткиной
useradd sshuser -u 1010
echo "sshuser:P@ssw0rd" | chpasswd
usermod -aG wheel sshuser
touch /etc/sudoers
vim /etc/sudoers
sshuser ALL=(ALL) NOPASSWD:ALL
#Дальше ssh
