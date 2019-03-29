# Tweetshell v1.0
Multi-thread Twitter BruteForcer in Shell Script

## Author: github.com/thelinuxchoice
## IG: instagram.com/thelinuxchoice
## Edit for Termux : github.com/samsesh
Tweetshell is an Shell Script to perform multi-threaded brute force attack against Twitter, this script can bypass login limiting and it can test infinite number of passwords with a rate of +400 passwords/min using 20 threads.

## Legal disclaimer:

Usage of TweetShell for attacking targets without prior mutual consent is illegal. It's the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program 

![tweet](https://user-images.githubusercontent.com/34893261/38052298-2abf6b28-32a7-11e8-83e6-de7c015b774e.png)

### Features
- Multi-thread (400 pass/min, 20 threads)
- Save/Resume sessions
- Anonymous attack through TOR
- Default password list (best +39k 8 letters)
- Check valid username
- Check and Install all dependencies

### Usage:
```
git clone https://github.com/thelinuxchoice/tweetshell
cd tweetshell
chmod +x tweetshell.sh
service tor start
sudo ./tweetshell.sh
```

### Install requirements (Curl, Tor):

```
chmod +x install.sh
./install.sh
```
