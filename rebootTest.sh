while :
do
#python3 tool.py -a -ip 192.168.1.47 -password pi -s  -cmd "sudo systemctl --force --force reboot"

    time python3 tool.py -ip 192.168.1.47 -password pi -s  -cmd " reboot"
    sleep 5
done