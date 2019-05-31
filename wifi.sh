python3 tool.py -ip 192.168.1.19 -s -a -cmd "./unlock"

python3 tool.py -ip 192.168.1.40 -s -a  -cmd "chmod 777 /etc/wpa_supplicant/wpa_supplicant.conf /etc/modprobe.d/raspi-blacklist.conf"

python3 tool.py -ip 192.168.1.19  -a -scp upload  -remotePath "/etc/modprobe.d/raspi-blacklist.conf" -localPath "./raspberry/wifi/raspi-blacklist.conf"
python3 tool.py -ip 192.168.1.19  -a -scp upload  -remotePath "/etc/wpa_supplicant/wpa_supplicant.conf" -localPath "./raspberry/wifi/wpa_supplicant.conf"

python3 tool.py -ip 192.168.1.19 -s -a  -cmd "echo raspberry | sudo reboot"
