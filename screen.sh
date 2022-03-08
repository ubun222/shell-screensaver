while getopts ":n:" opt; do
    case $opt in
        n)
        num=$OPTARG
        ;;
esac
done

num=${num:-5}

LINE=$(stty size|awk '{print $1}')
COLUMN=$(stty size|awk '{print $2}')

fif=""
stdout()
{
trap 'break' 2

printf "\033[?25l"
    xline=
    alline=
    m3=$(printf "\033[3m")
    m0=$(printf "\033[0m")
for ti in `seq $((COLUMN))` ;do
xline="${xline} "
done
for ti in `seq $((LINE))` ;do
alline="$xline
$alline"
done
alline="${alline}$xline${enter}${m5}Bash-English-Training    CTRL+C以继续"





prt=
whiledo()
{

for iii in `seq $num` ;do

prt="$prt
printf \"\\\033[\$x$iii;\${y${iii}}H\"
printf \"\\\033[\${colour}m\$shape\"
"
done

#echo "$prt"
}


########################
printf "\033[0m"
printf "\033[3m$alline"
printf "\033[0m"

shape=$(printf "\033[1m●")
colour=30;


flash()
{

    preif="

printf \"\\033[\$$1;\${$2}H\"

printf \"\\b    \"

[[  \"\$$1\" -le \"1\"  ]] && $1ud=d && colour=\$((colour+1))
[[  \"\$$2\" -le \"1\"  ]] && $2rl=r && colour=\$((colour+1))
if [[  \${$1ud} == d  ]] ;then
  $1=\$(($1+1))
  fi
if [[  \${$2rl} == r  ]];then
 $2=\$(($2+1))
 fi
[[  \"\$$1\" -ge \"\$LINE\"  ]] && $1ud=u && colour=\$((colour+1)) 
[[  \"\$$2\" -ge \"\$COLUMN\"  ]] && $2rl=l && colour=\$((colour+1)) 
if [[  \${$1ud} == u  ]];then
 $1=\$(($1-1))
fi
if [[  \${$2rl} == l  ]];then
 $2=\$(($2-1))
 fi
"
#printf %s "$preif"
}


  for iii in `seq $num` ;do
  rx=$((RANDOM%$LINE+1))
  ry=$((RANDOM%$COLUMN+1))
  eval x$iii=\$rx
  eval y$iii=\$ry
  bool=$((RANDOM%2+1))
 [[  "$bool" -eq 1  ]] && eval x${iii}ud=u &&  eval y${iii}rl=r
 [[  "$bool" -eq 2  ]] && eval x${iii}ud=d &&  eval y${iii}rl=l

flash x$iii y$iii
 fif="$fif

 $preif"

#echo $fif
done


whiledo
while true;do
[[  $colour  -gt  38  ]] && colour=30




eval "$prt"

sleep 0.2
eval "$fif"

sleep 0.01
done

}
stdout
printf "\033[?25l"
printf "\033[0m"
sleep 0.2
clear
trap  2
read

