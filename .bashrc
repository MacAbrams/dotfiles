# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
sess=$(( $SHLVL -1 ))
if [ "$sess" -eq "0" ];then
	sess=""
fi
update_ps1(){
COL="\[\e[92m\]"
CHARG="$(cat /sys/class/power_supply/AC/online)"
if [ "$CHARG" -eq "1" ];then
	CHARG="+"
else
	CHARG=""
fi
BAT="$(cat /sys/class/power_supply/BAT0/capacity)"
if [ "$BAT" -lt "66" ];then
	COL="\[\e[91m\]"
fi
alias ls='ls --color=auto'
	PS1="\[\033[92m\]\t\[\033[0m\] ${COL}${CHARG}${BAT} \[\033[0m\][\[\033[91m\]\u\[\033[0m\]@\[\033[95m\]\h${sess} \[\033[96m\]\W\[\033[0m\]]\$ "
}
PROMPT_COMMAND=update_ps1
