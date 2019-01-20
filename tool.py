#!/usr/bin/python
#coding:utf-8
import paramiko
import argparse
import nmap


from paramiko import SSHClient

from scp import SCPClient
import sys

def scanAllDeivce(ip,port):
    nm = nmap.PortScanner()         # instantiate nmap.PortScanner object
    nm.scan('{}/24'.format(ip),str(port))
    print(nm.command_line())
    return  nm,nm.all_hosts()

def sshCmd(ip,  port, username, password,cmd,sudo):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    
    ssh.connect(ip, port, username, password)
    if args.s:
        stdin, stdout, stderr=ssh.exec_command('echo {} | sudo  {}'.format(password,cmd))
    else:
        stdin, stdout, stderr=ssh.exec_command('{}'.format(password,cmd))
    #print(stdin.readlines())
    for line in stdout.readlines():
        print(line)
    #print(stdout.readlines())
    for line in stderr.readlines():
        print(line)

def scp (ip,port, username, password,mode,remotePath,localPath):
    



    ssh = SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    ssh.connect(ip, int(port), username, password, look_for_keys=False)
    
    def progress4(filename, size, sent, peername):
        sys.stdout.write("(%s:%s) %s\'s progress: %.2f%%   \r" % (peername[0], peername[1], filename, float(sent)/float(size)*100) )

    scp = SCPClient(ssh.get_transport(), progress4=progress4)

    try :
        if mode=="upload":
            scp.put(localPath,remotePath,recursive=True)
        elif mode=="download":
            scp.get(localPath,remotePath,recursive=True)
    except  Exception as e:
        print(e)
        
    scp.close()
    ssh.close()


parser = argparse.ArgumentParser(description="It's tool for update file or command multidevices")
parser.add_argument('-s',action="store_true",help="get sudo in ssh")
parser.add_argument('-a',action="store_true",help='scan device in the same network and procee with it')
parser.add_argument('-ip',help='Target device ip')
parser.add_argument('-cmd', help="command you want conduct in device")
parser.add_argument('-scp',help="upload|download")
parser.add_argument('-remotePath',help="file path in remote")
parser.add_argument('-localPath',help="file path in remote")
parser.add_argument('-username',help="Target device username")
parser.add_argument('-password',help="Target device password")


args = parser.parse_args()
ip=args.ip
username="pi"
password="raspberry"
port =22
if args.username:
    username=args.username
if args.password:
    password=args.password
print(username)

if args.a:
    nm,all_hosts=scanAllDeivce(ip,port)
    for  deviceIp in all_hosts :
        if nm[deviceIp]['tcp'][22]['state']=='open' :
            print(ip)

            try :
                if args.cmd:
                    sshCmd(deviceIp,port, username, password,args.cmd,args.s)
                elif args.scp :
                    
                    scp (deviceIp,port, username, password,args.scp,args.remotePath,args.localPath)
            except  Exception as e:
                print(e)
else :
    if args.cmd:
        sshCmd(args.ip,port, username, password,args.cmd,args.s)
    elif args.scp :
        scp (args.ip,port, username, password,args.scp,args.remotePath,args.localPath)



            
           
