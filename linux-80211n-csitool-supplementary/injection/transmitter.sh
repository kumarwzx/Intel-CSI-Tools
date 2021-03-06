#!/usr/bin/sudo /bin/bash  
sudo modprobe -r iwldvm iwlwifi mac80211  
modprobe -r iwlwifi mac80211 cfg80211  
modprobe iwlwifi debug=0x40000  
if [ "$#" -ne 2 ]; then  
    echo "Going to use default settings!"  
    chn=64  
    bw=HT20  
else  
    chn=$1  
    bw=$2  
fi  
ifconfig wlan0 2>/dev/null 1>/dev/null  
while [ $? -ne 0 ]  
do  
            ifconfig wlan0 2>/dev/null 1>/dev/null  
done  
iw dev wlan0 interface add mon0 type monitor  
  
ifconfig wlan0 down  
while [ $? -ne 0 ]  
do  
    ifconfig wlan0 down  
done  
ifconfig mon0 up  
while [ $? -ne 0 ]  
do  
           ifconfig mon0 up  
done  
  
iw mon0 set channel $chn $bw
