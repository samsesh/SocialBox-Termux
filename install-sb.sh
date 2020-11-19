#!/bin/bash
#Sysupdate
apt-get update
apt full-upgrade -y
#Python
apt-get install python -y
apt-get install tor -y
#gmail
git clone https://github.com/Ha3MrX/Gemail-Hack.git
#facebook
if [ -d facebook ]; then
        echo "Directory facebook exists.[✔]"
else
	mkdir facebook
	cd facebook
	wget raw.githubusercontent.com/Sup3r-Us3r/scripts/master/fb-brute.pl
	cd ..
fi
#Instagram
#git clone https://github.com/umeshshinde19/instainsane.git
cd instainsane
chmod +x instainsane.sh
chmod +x install.sh
./install.sh
cd ..
#Twitter
#git clone https://github.com/imprithwishghosh/-tweetshell-.git
cd tweetshell
chmod +x tweetshell.sh
chmod +x install.sh
./install.sh
cd ..
