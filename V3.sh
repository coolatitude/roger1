non-root user:
	do it at the installation

use sudo:
	default config

Stop DHCP:
	set a custom nat network on virtualbox
	use this:
		https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/netplan-how-to-configure-static-ip-address-in-ubuntu-18-04-using-netplan.html
	192.10.0.56/30

change ssh port:
	change "PORT" line in /etc/ssh/sshd_config.cfg and add 23 // the default port is 22
	set port forwarding on virtualbox

set firewall:
&&
DOS protection:
&&
protection against scans:
	used this config link http://lepepe.github.io/sysadmin/2016/01/19/ubuntu-server-ufw.html


before:
	echo "SHELL=/bin/bash\nMAILTO=root\n" >> /home/pvanderl/ex.cron

script to update:
	echo "apt -q -y upgrade >> /var/log/update_script.log" > /home/pvanderl/update.sh
	echo "	0 4 * * 0		root	/home/pvanderl/update.sh
			@reboot			root	/home/pvanderl/update.sh\n" >> ex.cron
	crontab -u pvanderl ex.cron

script to monitor changes:
	echo "
FILE="/etc/crontab"

[[ -z `find $FILE -newermt "-24 hours"` ]]

if [ $? -eq 0 ]
then
    exit 1
else
    mail -s "$FILE has been modfified." root
fi" > /home/pvanderl/check.sh

	echo "	0 0 * * *		root	/home/pvanderl/check.sh" >> ex.cron
	crontab -u pvanderl ex.cron
