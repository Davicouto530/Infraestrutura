Habilitando o Log de Debug no Router.
  service timestamps debug datetime msec

Habilitando o Tamanho Mínimo da Senha de Usuários e Serviços.
  security passwords min-length 8

Aumentando o Nível de Segurança contra Brute Force no Acesso Remoto.
  login block-for 120 attempts 2 within 60

!Acessando o modo EXEC Privilegiado
enable

!Configuração de Data/Hora Router
clock set 19:54:00 05 May 2024

	!Acessando o modo de Configuração Global de comandos
	configure terminal

		!Configuração do nome do router
		hostname rt-01

		!Habilitando o serviço de criptografia de senhas do Tipo-7 Password 
		service password-encryption

		!Habilitando o serviço de marcação de Data/Hora detalhado nos Logs
		service timestamps log datetime msec
		service timestamps debug datetime msec

		!Desativando a resolução de nomes de domínio
		no ip domain-lookup

		!Configuração do Banner da mensagem do dia
		banner motd #AVISO: acesso autorizado somente a funcionarios#
		
		!Habilitando o comprimento mínimo da criação das senhas do Tipo-5 ou Tipo-7
		security passwords min-length 8

		!Habilitando o uso senha do Tipo-5 Secret para acessar o modo EXEC Privilegiado
		enable secret 123@senac

		!Criação dos usuários locais utilizando senhas do Tipo-5 ou Tipo-7 e privilégios diferenciados
		username senac secret 123@senac
		username vaamonde password 123@senac
		username admin privilege 15 secret 123@senac
		
		!Configuração do nome de domínio FQDN (Fully Qualified Domain Name)
		ip domain-name senac.br

		!Criação da chave de criptografia e habilitando o serviço do SSH Server local
		crypto key generate rsa general-keys modulus 1024

		!Habilitando a versão 2 do serviço de SSH Server
		ip ssh version 2

		!Habilitando o tempo de inatividade para novas conexões do SSH Server
		ip ssh time-out 60

		!Habilitando o número máximo de tentativas de conexões simultâneas no SSH Server
		ip ssh authentication-retries 2
		
		!Bloqueando tentativas de conexões simultâneas com falha de autenticação no Router
		login block-for 120 attempts 2 within 60

		!Acessando a linha console, porta padrão de acesso Out-of-Band (Fora da Banda)
		line console 0

			!Forçando fazer login local utilizando usuário e senha locais do switch
			login local

			!Habilitando senha de acesso do Tipo-7 Password
			password 123@senac

			!Sincronizando as mensagens de logs na tela
			logging synchronous

			!Habilitando o tempo de inatividade de uso do console
			exec-timeout 5 30
			
			!Saindo da configuração da linha console
			exit

		!Acessando as linhas virtuais de acesso remoto do Router
		line vty 0 4

			!Forçando fazer login local utilizando usuário e senha locais do Router
			login local

			!Habilitando senha de acesso do Tipo-7 Password
			password 123@senac

			!Sincronizando as mensagens de logs na tela
			logging synchronous

			!Habilitando o tempo de inatividade de uso da linha virtual
			exec-timeout 5 30

			!Configuração do tipo de protocolo de transporte de entrada
			transport input ssh

			!Saindo de todos os níveis e voltando para o modo EXEC Privilegiado
			end

!Salvando as configurações da memória RAM para a memória NVRAM
write

!Visualizando as Configurações do Running-Config (RAM)
!OBSERVAÇÃO: ÚNICA LINHA QUE NÃO APARECE NAS CONFIGURAÇÃO É A: crypto key generate rsa
rt-01# show running-config

!Fazendo um Filtro na Visualização do Running-Config somente da Sessão Line Console 0
rt-01# show running-config | section include con 0

!Fazendo um Filtro na Visualização do Running-Config somente da Sessão Line VTY
rt-01# show running-config | section include line vty

!Fazendo um Filtro na Visualização do Running-Config somente do SSH
!OBSERVAÇÃO: ÚNICA LINHA QUE NÃO APARECE NAS CONFIGURAÇÃO É A: crypto key generate rsa
rt-01# show running-config | section include ssh

!Visualizando as configurações do SSH Server e Versão
rt-01# show ip ssh

!Visualizando das chaves públicas RSA do SSH Server
rt-01# show crypto key mypubkey rsa

!Visualizando as conexões ativas do SSH Server.
!OBSERVAÇÃO: ESSA OPÇÃO SÓ VAI FUNCIONAR QUANDO VOCÊ SE CONECTAR REMOTAMENTE NO SWITCH OU ROUTER.
rt-01# show ssh

!Visualizando os Usuários Conectados no Switch
!OBSERVAÇÃO: ESSA OPÇÃO VAI MOSTRAR O USUÁRIO LOGADO NO CONSOLE: con 0 OU NO VTY: vty 0
rt-01# show users
