#!/bin/bash

# Function to extract CPU times
get_cpu_times() {
    awk '/^cpu / {
        busy = $2 + $3 + $4 + $7 + $8 + $9;
        total = $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9;
        print busy, total;
    }' /proc/stat
}


read -r busy1 total1 < <(get_cpu_times)
sleep 1

read -r busy2 total2 < <(get_cpu_times)

busy_diff=$((busy2 - busy1))
total_diff=$((total2 - total1))

if [ "$total_diff" -ne 0 ]; then
    cpu_usage=$(awk -v b="$busy_diff" -v t="$total_diff" 'BEGIN { printf "%.2f", (b / t) * 100 }')
    echo "Total CPU Usage: $cpu_usage%"
else
    echo "Error: Division by zero."
fi


mem=$(free -m | grep Mem: | awk '{usage= $3 * 100 / $2 ; print usage ;}') 
echo "memory usage is $mem%"
free=$(free -m | awk '/Mem:/ { printf "%.2f\n", $4 / 1024 }');
echo "free memory is $free GB"
disk_usage=$(df -h --total | grep 'total' | awk '{print $5}')
echo "Disk usage is $disk_usage"

# Get the number of running processes
topPr=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)
topPrpids=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 )
echo -e "Top 5 processes by CPU usage: \n$topPr"
echo -e "Top 5 process IDs by CPU usage: \n$topPrpids"