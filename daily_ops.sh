checkDiskUsage(){
    CURRENT_DISK_USAGE=$(df -ah | grep "/dev/sda3" | awk '{print $5}' | sed 's/%//')

    if [ "$CURRENT_DISK_USAGE" -ge 80 ]; then
        echo "WARNING! your disk is almost full!"
    else
        echo "Disk Usage is $CURRENT_DISK_USAGE%"
    fi
}
checkInternet(){
    ping -c 1 google.com > /dev/null 2>&1
    if  [ "$?" -ne 0 ]; then
        echo "No Internet Connectivity"
        echo "No internet - $(date)" >> netcheck.log
    else
        echo "Internet Connectivity Successful"
    fi
}
backupEtc(){
    tar czf etc-backup-$(date +%F).tar.gz /etc 2>/dev/null
}
logProcess(){
    echo $(date) >> ops.log
}

#check disk usage of /dev/sda3 (my main disk)
checkDiskUsage
#check internet connectivity
checkInternet
#backup /etc directory
backupEtc
#log the current process
logProcess