CURRENT_UPTIME=$(uptime | awk '{print $3}')

CURRENT_MEM_MB=$(free -h | awk 'NR==2 {print $3}')

CURRENT_DISK_USAGE=$(df -h | awk '/sda3/ {print $3}')

CURRENT_CPU_USAGE=$(top -bn1 | grep '^CPU:' | awk '{print 100 - $8}')


echo -e "$(date)\nUPTIME: $CURRENT_UPTIME HH:MM\nMEMORY USAGE: $CURRENT_MEM_MB MB\nDISK USAGE: $CURRENT_DISK_USAGE GB\nCPU USAGE: $CURRENT_CPU_USAGE%\n" >> system_report.log