PAT="~/.roger/V3/"
#network configuration
apt remove ifupdown
cp ${PAT}99-disable-network-config.cfg /etc/cloud/cloud.cfg.d/
mkdir ~/.roger/trash
mv /etc/netplan/* ~/.roger/trash
cp ${PAT}01-network-card.yaml /etc/netplan/
netplan generate
netplan apply

#change ssh port
echo ${PAT}sshd_config >> /etc/ssh/sshd_config.cfg
systemctl restart ssh
