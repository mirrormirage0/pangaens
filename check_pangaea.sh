echo
# Get status for Pangaea Shards and put in file "network"
wget -q https://harmony.one/pga/network
echo "_________________________________________________________"
echo
tput setaf 1; echo " PANGAEA MyNode Health Check"
tput setaf 7; echo "_________________________________________________________"
echo
tput setaf 2; echo " Is my Node running? Is it connected to latest bootnode: "
tput setaf 7; ps aux | grep '[h]armony -bootnodes' | grep 54.86.126.90
echo "_________________________________________________________"
echo
# Put ShardID in variable
shardID=$(tac latest/*.log | grep -oam 1 -E "\"(blockShard|[Ss]hardID)\":[0-3]")
tput setaf 2; echo -n " What Shard am I on: "; tput setaf 7; echo $shardID
echo "_________________________________________________________"
echo
# Get number for shard
shardNO=$(echo $shardID | grep -Po '.(?=.{0}$)')
tput setaf 2; echo " Online status of my Shard: "
# Create variable for next grep command
shardLINE=$(echo shard $shardNO)
# Get only the line for the correct shard number
shardSTATUS=$(cat network | grep -i "$shardLINE")
tput setaf 7; echo $shardSTATUS
echo "_________________________________________________________"
echo
tput setaf 2; echo -n " What Block Number is my node on: "; tput setaf 7; tac latest/zero*.log | grep -oam 1 -E "\"(blockNumber|myBlock)\":[0-9\"]*"
echo "_________________________________________________________"
echo
tput setaf 2; echo -n " What is my node's local time: "; tput setaf 7; date
echo "_________________________________________________________"
echo
tput setaf 2; echo " What was the last time my node synched: "
tput setaf 7; grep "Node is now IN SYNC" latest/zerolog*.log | tail -n1
echo "_________________________________________________________"
echo
tput setaf 2; echo " Do I have reached consensus: "
tput setaf 7; grep -i "BINGO" latest/zerolog*.log | tail -n1
echo "_________________________________________________________"
echo
tput setaf 2; echo " What is my wallet balance?"
tput setaf 7; ./wallet.sh -t balances
echo
# Cleanup file "network" for next run
rm network
