echo
tput setaf 2; echo -n "Total Pending transactions "; tput setaf 7; tac latest/zero*.log | grep -oam 1 -E "\"("totalPending")\":[0-9\"]*"
echo "-----------------------------------------------------------------"
tput setaf 2; echo -n "Last message "; tput setaf 7; tail -n 1 latest/zero*.log

