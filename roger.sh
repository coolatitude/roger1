GR='\033[0;32m'
NC='\033[0m'
clear

echo "${GR}Welcome on my roger skyline project\n\nProof it is up to date:\n${NC}"
apt-get update
apt-get upgrade
apt-get install
echo "${GR}\nHere is the disk and partitions infos:\n${NC}"
lsblk

