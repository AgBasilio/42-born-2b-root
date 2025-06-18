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
#Last boot: $who \n
#LVM use: $algo \n Si LVM está activo o no.
#TCP Connections : $(ss -t) \n El número de conexiones activas.
#User log: $w \n El número de usuarios del servidor/
#Network: $ip address \n La dirección IPv4 de tu servidor y su MAC (Media Access Control)
#Sudo : $ss \n El número de comandos ejecutados con sudo."

#wall -n $text
echo -e $text | wall