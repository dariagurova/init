#!/bin/sh

touch ~/cron_mod.sh
echo "#!/bin/sh" > ~/cron_mod.sh
echo "file=/etc/crontab" >> ~/cron_mod.sh
echo "mod=\`find \$file -mtime -1\`" >> ~/cron_mod.sh
echo "if [ \! -z \$mod ]" >> ~/cron_mod.sh
echo "then" >> ~/cron_mod.sh
echo "	echo "Crontab Modified" | mail -s \"Crontab modified\" root" >> ~/cron_mod.sh
echo "fi" >> ~/cron_mod.sh
chmod +x ~/cron_mod.sh

touch ~/temp
crontab -l > ~/temp
echo "0 0 * * * sh ~/cron_mod.sh" >> ~/temp
crontab ~/temp
rm ~/temp
