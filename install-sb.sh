#!/bin/bash
# SocialBox-Termux Installer
# Updated: Fix re-cloning, security, Python 3 support

git pull >> /dev/null 2>&1

# Use reasonable permissions instead of 777
chmod +x SocialBox.sh
chmod +x install-sb.sh
chmod +x instainsane/instainsane.sh
chmod +x instainsane/install.sh
chmod +x tweetshell/tweetshell.sh
chmod +x tweetshell/install.sh

# System update
apt-get update -qq >> /dev/null

# Install dependencies (python3 instead of deprecated python2)
apt install python3 python tor perl figlet runit openssl curl wget -y >> /dev/null

clear
sleep 2
figlet "Installing ..."

# Helper function for safe cloning
safe_clone() {
    local repo_url=$1
    local dir_name=$2
    
    if [ -d "$dir_name" ]; then
        echo "Updating $dir_name..."
        cd "$dir_name"
        git pull >> /dev/null 2>&1
        cd ..
    else
        echo "Cloning $dir_name..."
        git clone "$repo_url" "$dir_name" >> /dev/null 2>&1
    fi
}

# Gmail brute force
figlet "gmail bf"
safe_clone "https://github.com/Ha3MrX/Gemail-Hack.git" "Gemail-Hack"

sleep 2
clear
figlet "Installing ..."
figlet "facebook bf"

# Facebook brute force (Perl script)
if [ -d "facebook" ]; then
    echo "Directory facebook exists.[✔]"
else
    mkdir facebook
    cd facebook
    wget -q "https://raw.githubusercontent.com/Sup3r-Us3r/scripts/master/fb-brute.pl" -O fb-brute.pl
    cd ..
fi

sleep 2
clear
figlet "Installing ..."
figlet "instagram bf1"

# Instagram 1 (instainsane - bundled)
cd instainsane
chmod +x instainsane.sh
chmod +x install.sh
./install.sh
cd ..

sleep 2
clear
figlet "Installing ..."
figlet "twitter bf"

# Twitter (tweetshell - bundled)
cd tweetshell
chmod +x tweetshell.sh
chmod +x install.sh
./install.sh
cd ..

sleep 2
clear
figlet "Installing ..."
figlet "instagram bf 2"

# Instagram 2 (insta-bf)
safe_clone "https://github.com/samsesh/insta-bf.git" "insta-bf"
cd insta-bf
bash ./andriod_setup.sh >> /dev/null 2>&1
cd ..

sleep 2
clear
figlet "done"
cd ..

# Facebook 2 (Python 3 - replaces old fikrado.py)
figlet "facebook bf 2"
safe_clone "https://github.com/IAmBlackHacker/Facebook-BruteForce.git" "facebook-bf"
cd facebook-bf
pip3 install requests bs4 >> /dev/null 2>&1
cd ..

# Instagram 3 (igbf - modern, Python 3, proxy support)
figlet "instagram bf 3"
safe_clone "https://github.com/s41r4j/igbf.git" "igbf"
cd igbf
pip3 install requests >> /dev/null 2>&1
cd ..

# Modern All-in-One (sosec - Instagram/Facebook/Gmail/Twitter)
figlet "sosec toolkit"
safe_clone "https://github.com/samueleamato/sosec.git" "sosec"
cd sosec
pip3 install -r requirements.txt >> /dev/null 2>&1
cd ..

# Final message
clear
figlet "Complete"
echo "Installation finished. Run './SocialBox.sh' to start."