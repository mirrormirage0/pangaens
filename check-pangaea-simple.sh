echo
echo "_________________________________________________________"
echo
echo " PANGEA MyNode Health Check"
echo "_________________________________________________________"
echo
echo " Is my Node running? Is it connected to latest bootnode: "
ps aux | grep '[h]armony -bootnodes' | grep 54.86.126.90
echo "_________________________________________________________"
echo
echo -n " What Block Number is my node on: "; tput setaf 7; tac latest/zero*.log | grep -oam 1 -E "\"(blockNumber|myBlock)\":[$
echo "_________________________________________________________"
echo
echo -n " What is my node's local time: "; tput setaf 7; date
echo "_________________________________________________________"
echo
echo " What was the last time my node synched: "
grep "Node is now IN SYNC" latest/zerolog*.log | tail -n1
echo "_________________________________________________________"
echo
echo " Do I have reached consensus: "
grep -i "BINGO" latest/zerolog*.log | tail -n1
echo "_________________________________________________________"
echo
echo -n " What Shard am I on: "; tput setaf 7; tac latest/*.log | grep -oam 1 -E "\"(blockShard|[Ss]hardID)\":[0-3]"
echo "_________________________________________________________"
echo
echo " What is my wallet balance?"
./wallet.sh -t balances
echo "_________________________________________________________"
echo
echo " What are the last 2 Bingos?"
tac latest/zero*.log | grep -am 2 "BINGO"
echo
