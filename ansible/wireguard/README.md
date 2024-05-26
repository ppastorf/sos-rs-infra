# VPN Wireguard
Este playbook de ansible sobe uma VPN com Wireguard para acessarmos os recursos da VPC privada remotamente.

Eh preciso subir uma VM para ser usada de servidor da VPN, e que funcionara como 'bounce server', redirecionando trafego entre as duas subnets por meio de NAT.

Para a configuracao inicial, a porta de SSH deve estar aberta publicamente. Apos executar o playbook e configurar a VPN, so precisamos que a porta da VPN fique aberta.

## Servidor
Para configurar o servidor da VPN com Ansible:

1. Suba o modulo de Terraform da VM
1.1. A porta de SSH (22/tcp) do firewall deve estar aberta para realizar a primeira configuracao pelo ip publico.

2. Configure o arquivo de inventario com as variaveis necessarias
2.1. Para pegar os ips: `make output live/do/dev/common/vpn-access/droplet`

3. Rode o playbook para configurar o servidor (exemplo com os valores de dev):
```
ansible-playbook setup-server.yml -i ../../live/do/dev/common/vpn-access/dev_vpn.yml --private-key=~/.ssh/chave-sos-rs-dev
```

4. Feche a porta de SSH pois agora o servidor pode ser acessado pela VPN (inclusive para SSH), assim como todos os ips privados da VPC.

5. Adicione a chave publica do servidor ao arquivo `vars.yml` no diretorio do modulo.

## Cliente
Em sua maquina local, execute os passos a seguir para se conectar com a VPN.

1. Instalar o Wireguard:
https://www.wireguard.com/install/ 

2. Gere suas chaves:
```
mkdir -p /etc/wireguard

# chave privada
sudo wg genkey > /etc/wireguard/privatekey

# chave publica
cat /etc/wireguard/privatekey | wg pubkey > /etc/wireguard/publickey
```

3. Configure as variaveis no playbook e o execute `generate-client-config.yml` com sudo para gerar sua configuracao de cliente. Voce deve configurar o seu IP na VPN, que deve ser unico entre os clientes. Confira nos peers da rede.
```
sudo ansible-playbook generate-client-config.yml 
```

4. Coloque o arquivo gerado `client.out_file` em `/etc/wireguard/wg0.conf`

5. Adicionar seu peer na configuracao do servidor:
Use a variavel `server.peers` do playbook, adicione sua chave e ip e execute atualize as configs do servidor:
```
ansible-playbook setup-server.yml -i ../../live/do/dev/common/vpn-access/dev_vpn.yml --private-key=~/.ssh/chave-sos-rs-dev
```

6. Conectar:
Para ativar a VPN
```
sudo wg-quick up wg0
```

Para desativar
```
sudo wg-quick down wg0
```

Mais informacoes:
https://github.com/pirate/wireguard-docs?tab=readme-ov-file#some-unofficial-wireguard-documentation
