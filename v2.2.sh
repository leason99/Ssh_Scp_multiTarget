python3 tool.py -ip 192.168.1.40 -s  -cmd "./unlock"
python3 tool.py -ip 192.168.1.40 -s  -cmd "echo raspberry | sudo rm -r /home/pi/start"
python3 tool.py -ip 192.168.1.40  -scp upload  -remotePath "/home/pi/start" -localPath "./r/start_rasp_exec"


python3 tool.py -ip 192.168.1.40 -s  -cmd "echo raspberry | sudo chmod +x /home/pi/start/start"
python3 tool.py -ip 192.168.1.40 -s  -cmd "echo raspberry | sudo mkdir exe"
python3 tool.py -ip 192.168.1.40  -scp upload  -remotePath "/home/pi/crontabFile" -localPath "./r/crontabFile"
python3 tool.py -ip 192.168.1.40 -s  -cmd "echo raspberry | sudo crontab ./crontabFile"



python3 tool.py -ip 192.168.1.40 -s  -cmd "chmod 777 /etc/rc.local /etc/fstab"

python3 tool.py -ip 192.168.1.40  -scp upload  -remotePath "/etc/rc.local" -localPath "./r/rc.local"
python3 tool.py -ip 192.168.1.40  -scp upload  -remotePath "/etc/fstab" -localPath "./r/fstab"
python3 tool.py -ip 192.168.1.40  -scp upload  -remotePath "/home/pi/arm-sdtool" -localPath "./r/arm-sdtool"

python3 tool.py -ip 192.168.1.40 -s  -cmd "echo raspberry | sudo reboot"
