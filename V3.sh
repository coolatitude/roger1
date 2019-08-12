#network configuration
apt remove ifupdown
cp ./V3/99-disable-network-config.cfg /etc/cloud/cloud.cfg.d/
mkdir ~/.roger/trash
mv /etc/netplan/* ~/.roger/trash
cp ./V3/01-network-card.yaml /etc/netplan/
netplan generate
netplan apply

#change ssh port
echo ./V3/sshd_config >> /etc/ssh/sshd_config.cfg
systemctl restart ssh
