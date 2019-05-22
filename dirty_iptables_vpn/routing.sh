#!/bin/bash
#scheme: any -> $MY_LOCAL_IP:18085 -> $VPN_SERVER_IP:8085
MY_LOCAL_IP=
MY_VPN_IP=
VPN_SERVER_IP=

sudo iptables -t nat -I PREROUTING --dst $MY_LOCAL_IP -p tcp --dport 18085 -j DNAT --to-destination $VPN_SERVER_IP:8085
sudo iptables -t nat -I POSTROUTING -p tcp --dst $VPN_SERVER_IP --dport 8085 -j SNAT --to-source $MY_VPN_IP
sudo iptables -t nat -I OUTPUT --dst $MY_LOCAL_IP -p tcp --dport 18085 -j DNAT --to-destination $VPN_SERVER_IP:8085
sudo iptables -I FORWARD -i $MY_VPN_IP --dst $VPN_SERVER_IP -j ACCEPT

