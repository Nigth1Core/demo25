
apt-get update && apt-get install tzdata  
timedatectl set-timezone Europe/Samara

# SSH user
useradd sshuser -u 1010
echo "sshuser:P@ssw0rd" | chpasswd
usermod -aG wheel sshuser
touch /etc/sudoers
vim /etc/sudoers
sshuser ALL=(ALL) NOPASSWD:ALL

#Дальше файл ssh

#Создание NTP_chrony

#Создание Samba DC
apt-get update && apt-get install -y task-samba-dc bind 
control bind-chroot disabled
grep -q KRB5RCACHETYPE /etc/sysconfig/bind || echo 'KRB5RCACHETYPE="none"' >> /etc/sysconfig/bind
systemctl stop bind
rm -f /etc/samba/smb.conf
rm -rf /var/lib/samba
rm -rf /var/cache/samba
mkdir -p /var/lib/samba/sysvol
samba-tool domain provision 
systemctl restart samba
systemctl enable --now samba
samba-tool domain info 127.0.0.1
samba-tool computer list
samba-tool group add hq

# скрипт на пользователей
for i in {1..5}; do
samba-tool user add user$i-hq P@ssw0rd;
samba-tool user setexpiry user$i-hq --noexpiry;
samba-tool group addmembers "hq" user$i-hq;
done

apt-get install -y admx-*
amdx-msi-setup

#Настройка Ansible в 2.4 syshelper

#Установка Docker в 2.5 syshelper

