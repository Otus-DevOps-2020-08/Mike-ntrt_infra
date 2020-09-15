# Mike-ntrt_infra
Mike-ntrt Infra repository

### HW Lec 6 - Cloud Testapp  

testapp_IP = 84.201.133.117  
testapp_port = 9292  

YC examle create lowcost VM  
```
yc compute instance create \  
--name reddit-app \  
--hostname reddit-app \  
--platform="standard-v2" \  
--core-fraction=5 \  
--cores=2 \  
--memory=1 \  
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=3GB \  
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \  
--preemptible \  
```

### HW Lec 5 - Cloud Bastion

bastion_IP = 178.154.224.60  
someinternalhost_IP = 10.130.0.11  

#### ssh
ssh connect oneline through Jumphost(option `-J`):  
`ssh -i .ssh/appuser -A -J appuser@178.154.224.60 appuser@10.130.0.11`

ssh connect via alias: 
add ssh config file (~/.ssh/config):
```
Host bastion
    Hostname 178.154.224.60
    User appuser
    IdentityFile ~/.ssh/appuser

Host someinternalhost
    Hostname 10.130.0.11
    User appuser
    IdentityFile ~/.ssh/appuser
    ProxyJump bastion
```
ProxyJump is a short alias for ProxyCommand in the new versions of OpenSSH

connection string:  
`ssh someinternalhost`

let's check connection:
```
appuser@someinternalhost:~$ w
 11:15:59 up  2:53,  1 user,  load average: 0.00, 0.00, 0.00
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
appuser  pts/0    10.130.0.4       11:14    0.00s  0.02s  0.00s w
appuser@someinternalhost:~$ ip -4 a show eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    inet 10.130.0.11/24 brd 10.130.0.255 scope global eth0
       valid_lft forever preferred_lft forever
appuser@someinternalhost:~$
```
#### pritunl

sslip.io resolve `<ip>.sslip.io` into ip address  
install Lets Encrypt tls certificate:  
https://178.154.224.60 -> settings -> Lets Encrypt Domain -> 178.154.224.60.sslip.io

we use Tunnelblick to connect to pritunel server  
connection to the Internalhost string:  
`ssh -i ~/.ssh/appuser appuser@10.130.0.11`
