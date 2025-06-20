#! /bin/bash
# /usr/local/bin/

text="#Architecture: $(uname -a) \n"
text="$text#CPU physical: $(lscpu | grep Socket | awk '{print $2}') \n"
text="$text#vCPU: $nproc \n"

mem_total=$(free --mega | grep Mem | awk '{print $2}')
mem_used=$(free --mega | grep Mem | awk '{print $3}')
#mem_ratio=$(($mem_used * 100/$mem_total))%
mem_ratio=$(free --mega | awk '/Mem:/ {printf "%.2f", $3 * 100 / $2}')
text="$text#Memory Usage: $mem_used/${mem_total}MB ($mem_ratio%) \n"

#text="$text#Disk Usage: $(df -BG -H --total | grep total | awk '{print $3/$2GB ($5)}') \n"
# text="$text#Disk Usage: $( df --block-size=1G --total | awk '/total/ {
#     used=$3; total=$2; rate=$5;
#     print used "/" total "GB (" rate ")"
# }' ) \n"
text="$text#Disk Usage: $(df -BG -H --total | grep total | awk '{printf "%.2f/%.0fGB (%s)", $3, $2, $5}')\n"
text="$text#CPU load: $(mpstat | awk '/all/ {printf "%.2f%%", 100-$13}')\n"
text="$text#Last boot: $(who -b | awk '{print $3 " " $4}')\n"
#LVM use: $algo \n Si LVM está activo o no.
# [ "$(lsblk -o TYPE | grep -c lvm)" -gt 0 ] && echo "yes" || echo "no"
# lsblk -o TYPE | grep -q '^lvm$' && echo "yes" || echo "no"
# && means: Run the next command only if the previous command succeeded (exit code 0).
# look for exactly lvm '^lvm$' --> ^ marca el inicio, $ marca el fin de la palabra
text="$text#LVM use: $(lsblk -o TYPE | grep -q '^lvm$' && printf "yes" || printf "no")\n"
# awk  </proc/net/tcp 'BEGIN{t=0};{if ($4 == "01") {t++;}};END{print t}'
text="$text#TCP Connections : $(ss -s | awk '/TCP:/ {print $4}' | tr -d ,) \n"
#User log: $w \n El número de usuarios del servidor/
# w | head -n 1 | awk '{print $4}'
# who | wc -l
text="$text#User log: $(who | wc -l)\n"
text="$text#Network: IP $(hostname -I | awk '{print $1}')"
text="$text ($(ip addr show | awk '/link.ether/ {print $2}'))\n"
text="$text#Sudo : $(sudo journalctl _COMM=sudo | grep -c COMMAND=) cmd \n"

#wall -n $text
echo -e $text | wall