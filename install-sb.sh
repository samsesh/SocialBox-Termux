#!/bin/bash
#Sysupdate
apt-get update
apt full-upgrade 
#Python
apt-get install python
apt-get install tor
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
#fi
#Instagram
#git clone https://github.com/thelinuxchoice/instainsane.git
cd instainsane
chmod +x instainsane.sh
chmod +x install.sh
./install.sh
cd ..
#Twitter
#git clone https://github.com/thelinuxchoice/tweetshell.git
cd tweetshell
chmod +x tweetshell.sh
chmod +x install.sh
./install.sh
cd ..

