python3 tool.py -ip 192.168.1.19 -s  -cmd "echo raspberry | sudo ./arm-sdtool /dev/mmcblk0 unlock"
python3 tool.py -ip 192.168.1.19 -s  -cmd "./unlock"
python3 tool.py -ip 192.168.1.19 -s  -cmd "echo raspberry | sudo rm -r /home/pi/start"
python3 tool.py -ip 192.168.1.19  -scp upload  -remotePath "/home/pi/start" -localPath "./r/start_rasp_exec"
python3 tool.py -ip 192.168.1.19 -s  -cmd "echo raspberry | sudo chmod +x /home/pi/start/start"
python3 tool.py -ip 192.168.1.19 -s  -cmd "echo raspberry | sudo reboot"
