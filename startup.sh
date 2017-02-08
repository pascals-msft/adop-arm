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

# install git if not present (for instance on Red Hat)

if [ -f /etc/redhat-release ]; then
  yum install -y git;
fi

# get and install ADOP
cd /tmp
git clone https://github.com/Accenture/adop-docker-compose.git
cd adop-docker-compose
./adop compose init
