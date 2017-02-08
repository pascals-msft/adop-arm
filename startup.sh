#!/bin/bash 

OVERRIDES=


echo ' 
      ###    ########   #######  ########  
     ## ##   ##     ## ##     ## ##     ## 
    ##   ##  ##     ## ##     ## ##     ## 
   ##     ## ##     ## ##     ## ########  
   ######### ##     ## ##     ## ##        
   ##     ## ##     ## ##     ## ##        
   ##     ## ########   #######  ##        
'

usage(){
  cat <<END_USAGE

Usage: ./startup.sh
   -u <INITIAL_ADMIN_USER>
   -p <INITIAL_ADMIN_PASSWORD>

END_USAGE
}


while getopts "u:p:" opt; do
  case $opt in
    u)
      export INITIAL_ADMIN_USER=${OPTARG}
	      ;;
    p)
      export INITIAL_ADMIN_PASSWORD_PLAIN=${OPTARG}
	      ;;
    *)
      echo "Invalid parameter(s) or option(s)."
      usage
      exit 1
      ;;
  esac
done

if [ -z $INITIAL_ADMIN_USER ] | [ -z $INITIAL_ADMIN_PASSWORD_PLAIN ]; then
  usage
  exit 1
fi

# install latest version of compose
#curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/1.10.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# get and install ADOP

# cd /tmp
# git clone https://github.com/Accenture/adop-docker-compose.git
# cd adop-docker-compose
# ./adop compose init

# git is not installed by default on Red Hat: switching to wget
cd /tmp
wget https://github.com/Accenture/adop-docker-compose/archive/master.zip -O adop-docker-compose.zip
unzip adop-docker-compose.zip
cd adop-docker-compose-master
./adop compose init
