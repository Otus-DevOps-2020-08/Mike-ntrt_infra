# Mike-ntrt_infra
Mike-ntrt Infra repository

### HW Lec 5 - Cloud Bastion

bastion_IP = 178.154.224.60
someinternalhost_IP = 10.130.0.11

ssh connect oneline through Jumphost(otion `-J`):
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

connect string:
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
