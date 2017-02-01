#!/bin/sh

RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo "\n\n${ORANGE}Going to the appropriate folder${NC}"
cd ~/UTH/CE426-WWW-Technologies/World_Traveler/project/WorldTraveler/dist
echo "\n\n${ORANGE}Copying the file${NC}"
scp  WorldTraveler.war root@snf-726970.vm.okeanos.grnet.gr:/var/lib/tomcat/webapps
