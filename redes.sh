#!/bin/bash

echo "________________________________________________________"
echo "Changin IP Address of the PC to 192.168.1.2"
ip addr add 192.168.1.2/24 dev enp5s0
echo "________________________________________________________"
echo "Changin IP Address of the PC to 10.0.65.2"
ip addr add 10.0.65.2/24 dev enp5s0
echo "________________________________________________________"
echo "Check the address: "
ip addr show dev enp5s0
echo "________________________________________________________"
echo "Connecting to the router 1"
telnet 192.168.1.1
echo "________________________________________________________"
echo "Checking that we are in the router 1 showing the IP: "
show interface vlan0
echo "________________________________________________________"
echo "Add new IP 10.0.65.1/24"
configure terminal
interface vlan0
ip address 10.0.65.1/24
echo "________________________________________________________"
echo "Checking new added IP address:"
exit
exit
show interface vlan0
echo "________________________________________________________"
echo "Connect to second router"
echo "________________________________________________________"
echo "Changin vlan1 to enable connection, new IP 192.168.2.2/24"
configure terminal
interface vlan1
ip address 192.168.2.2/24
no ip address 192.168.2.1/24
echo "________________________________________________________"
echo "Add IP 10.0.0.1"
ip address 10.0.0.1/30
echo "________________________________________________________"
echo "Checking new IP address (192.168.2.2/24 & 10.0.0.1/30)"
exit
exit
show interface vlan1
echo "________________________________________________________"
echo "Telnet to second router with ip 192.168.2.1"
telnet 192.168.2.1
echo "________________________________________________________"
echo "Check we are in the second router (IP 192.168.2.1 on vlan1")
show interface vlan1
echo "________________________________________________________"
echo "Add new IP 10.0.0.2/30"
configure terminal
interface vlan1
ip address 10.0.0.2/30
echo "________________________________________________________"
echo "Check the IP in vlan1"
exit
exit
show interface vlan1
echo "________________________________________________________"
echo "Add IP 10.0.46.1/24 to vlan0"
configure terminal
interface vlan0
ip address 10.0.46.1/24
echo "________________________________________________________"
echo "Check the IP on vlan0 (10.0.46.1/24)"
exit
exit
show interface vlan0
echo "________________________________________________________"
echo "________________________________________________________"
echo "SETTING THE ROUTE BETWEEN A AND B"
echo "________________________________________________________"
echo "________________________________________________________"
echo ""
echo ""
echo "________________________________________________________"
echo "Configuring the route from PC-B to router 1"
configure terminal
ip route vlan0 vlan1
ip route 10.0.46.0/24 10.0.0.2
echo "Configuring the route from PC-B to connection between routers"
configure terminal
ip route 10.0.0.0/30 10.0.0.1
echo "________________________________________________________"
echo "Show route"
exit
exit
show ip route
echo "________________________________________________________"
echo "________________________________________________________"
echo "EXITING ROUTER 2, ENTERING ROUTER 1 TO CONFIGURE ROUTE"
echo "________________________________________________________"
echo "________________________________________________________"
exit
echo "Check we are in router 1 (vlan1 = 10.0.0.1/30)"
show interface vlan1
echo "________________________________________________________"
echo "Configuring the route between router 1 and router 2"
configure terminal
ip route 10.0.0.1 10.0.0.2
echo "Configuring the route between PC-A and vlan1"
configure terminal
ip route 10.0.65.0/24 10.0.0.1
echo "________________________________________________________"
echo "Show route"
exit
exit
show ip route
echo "________________________________________________________"
echo "________________________________________________________"
echo "MILESTONE 1 DONE"
echo "________________________________________________________"
echo "________________________________________________________"