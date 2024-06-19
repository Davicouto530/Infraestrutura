!Switch 2960 (acesso lado esquerdo)

enable
    configure terminal
    interface FastEthernet 0/1 
    description VLAN 40 estoque
    switchport mode access
    switchport access vlan 40
    switchport nonegotiate
    do write
    exit
    do sh runn

    enable
    configure terminal
    interface FastEthernet 0/2
    description VLAN 50 financeiro
    switchport mode access
    switchport access vlan 50
    switchport nonegotiate
    do write
    exit
    do sh runn

    enable
    configure terminal
    interface FastEthernet 0/3
    description VLAN 60 gerencia
    switchport mode access
    switchport access vlan 60
    switchport nonegotiate
    do write
    exit
    interface range FastEthernet 0/4 - 22
        description no arthur
        shutdown
        end
write

