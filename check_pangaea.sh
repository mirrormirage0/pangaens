echo
echo "_________________________________________________________"
echo
tput setaf 1; echo " PANGAEA MyNode Health Check"
tput setaf 7; echo "_________________________________________________________"
echo
tput setaf 2; echo " Is my Node running? Is it connected to latest bootnode: "
tput setaf 7; ps aux | grep '[h]armony -bootnodes' | grep 54.86.126.90
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
tput setaf 2; echo -n " What Shard am I on: "; tput setaf 7; tac latest/*.log | grep -oam 1 -E "\"(blockShard|[Ss]hardID)\":[0-3]"
echo "_________________________________________________________"
echo
tput setaf 2; echo " What is my wallet balance?"
tput setaf 7; ./wallet.sh -t balances
echo
