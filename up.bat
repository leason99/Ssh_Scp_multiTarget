tool.exe -ip 192.168.2.1 -s -a -cmd "./unlock"
tool.exe -ip 192.168.2.1 -s -a -cmd "rm /etc/resolv.conf"
tool.exe -ip 192.168.2.1 -s -a -cmd "touch /tmp/resolv.conf"
tool.exe -ip 192.168.2.1 -s -a -cmd "ln -s /tmp/resolv.conf /etc/resolv.conf"
tool.exe -ip 192.168.2.1 -s -a -cmd "chmod 777 /etc/rc.local /etc/fstab"
tool.exe -ip 192.168.2.1 -a -scp upload  -remotePath "/etc/rc.local" -localPath "./d/rc.local"
tool.exe -ip 192.168.2.1 -a -scp upload  -remotePath "/etc/fstab" -localPath "./d/fstab"
tool.exe -ip 192.168.2.1 -s -a -cmd "reboot"
pause