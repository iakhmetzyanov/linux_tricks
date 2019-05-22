#/bin/bash
# startup ipsec tunnel
TARGET_NETWORK=192.168.0.0
TARGET_NET_MASK=16
PIDFILE=/var/run/charon.pid /usr/sbin/ipsec start
sleep 2
ipsec up L2TP-PSK
sleep 2
ipsec statusall
sleep 2

# startup xl2tpd ppp daemon then send it a connect command
(sleep 3 && echo "c myVPN" > /var/run/xl2tpd/l2tp-control) &
/usr/sbin/xl2tpd -p /var/run/xl2tpd.pid -c /etc/xl2tpd/xl2tpd.conf -C /var/run/xl2tpd/l2tp-control -D &
sleep 10
PPP=$(ip a show ppp0 | grep inet | cut -d ' ' -f 6)
#Добавление маршрута до сервера pilot
ip route add $TARGET_NETWORK/$TARGET_NET_MASK via ${PPP} dev ppp0

