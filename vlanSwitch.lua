enable
    show vlan brief
    configure terminal
        vlan 10
        name switch
        exit
    vlan 20
        name server
        exit
    vlan 30
        name wireless
        exit
    vlan 40
        name estoque 
        exit
    vlan 50
        name financeiro
        exit
    vlan 60 
        name grencia
        exit
    end
write
show vlan brief