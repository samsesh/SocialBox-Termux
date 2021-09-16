#!/bin/bash
git pull >> /dev/null
chmod 777 -R *
chmod 777 -R .
#Sysupdate
apt-get update -qq >> /dev/null
#apt full-upgrade 
#req
apt install python2 python tor perl figlet runit openssl -y >> /dev/null
clear
sleep 2
figlet Installing ...
#gmail
figlet gmail bf
git clone https://github.com/Ha3MrX/Gemail-Hack.git >> /dev/null
sleep 2
clear
figlet Installing ...
figlet facebook bf
#facebook
if [ -d facebook ]; then
        echo "Directory facebook exists.[✔]"
else
	mkdir facebook
	cd facebook
	wget raw.githubusercontent.com/Sup3r-Us3r/scripts/master/fb-brute.pl
	cd ..
fi
sleep 2
clear
figlet Installing ...
figlet instagram bf1
#Instagram 1
#git clone https://github.com/umeshshinde19/instainsane.git
cd instainsane
chmod +x instainsane.sh
chmod +x install.sh
./install.sh
cd ..
sleep 2
clear
figlet Installing ...
figlet twitter bf
#Twitter
#git clone https://github.com/imprithwishghosh/-tweetshell-.git
cd tweetshell
chmod +x tweetshell.sh
chmod +x install.sh
./install.sh
cd ..
clear
figlet Installing ...
figlet instagram bf 2
# instagram 2
git clone https://github.com/samsesh/insta-bf.git
cd insta-bf 
bash ./andriod_setup.sh	>> /dev/null
clear
figlet done
