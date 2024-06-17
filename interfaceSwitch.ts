enable
    configure terminal
        interface vlan 10
        description interface SVI Switch 3650
        ip address 192.168.10.252 255.255.255.0
        no shutdown
        end
    write
    show ip interface brief
    ping 192.168.10.252