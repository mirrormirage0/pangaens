echo
# Get status for Pangaea Shards and put in file "network"
wget -q https://harmony.one/pga/network
echo "_________________________________________________________"
echo
echo " PANGAEA MyNode Health Check"
echo "_________________________________________________________"
echo
echo " Is my Node running? Is it connected to latest bootnode: "
ps aux | grep '[h]armony -bootnodes' | grep 54.86.126.90
echo "_________________________________________________________"
echo
# Put ShardID in variable
shardID=$(tac latest/*.log | grep -oam 1 -E "\"(blockShard|[Ss]hardID)\":[0-3]")
echo -n " What Shard am I on: ";  echo $shardID
echo "_________________________________________________________"
echo
# Get number for shard
shardNO=$(echo $shardID | grep -Po '.(?=.{0}$)')
echo " Online status of my Shard: "
# Create variable for next grep command
shardLINE=$(echo shard $shardNO)
# Get only the line for the correct shard number
shardSTATUS=$(tac network | grep -i "$shardLINE")
echo $shardSTATUS
echo "_________________________________________________________"
echo
echo -n " What Block Number is my node on: "; tac latest/zero*.log | grep -oam 1 -E "\"(blockNumber|myBlock)\":[0-9\"]*"
echo "_________________________________________________________"
echo
echo -n " What is my node's local time: "; tput setaf 7; date
echo "_________________________________________________________"
echo
echo " What was the last time my node synched: "
grep "Node is now IN SYNC" latest/zerolog*.log | tail -n1
echo "_________________________________________________________"
echo
echo " Have I reached consensus: "
grep -i "BINGO" latest/zerolog*.log | tail -n1
echo "_________________________________________________________"
echo
echo " What is my wallet balance?"
./wallet.sh -t balances
echo
# Cleanup file "network" for next run
rm network
