enable
    show ip interface brief
    ping 192.168.10.252
    ping 192.168.10.250 
    ping 192.168.10.251
    configure terminal
        interface range GigabitEthernet 1/0/10 - 12
            description interface de servidores
            switchport mode access 
            switchport nonegatiate
            switchport access vlan 20
            exit
        interface GigabitEthernet 1/0/23
            description interface de wireless
            switchport mode access 
            switchport nonegatiate
            switchport access vlan 30
            exit
write