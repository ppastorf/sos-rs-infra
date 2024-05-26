# Backend

## Servidor
Para configurar o servidor do backend com Ansible (exemplo para dev):

1. Suba o modulo de Terraform da VM

2. Configure o arquivo de inventario com as variaveis necessarias

2.1. Para pegar os ips: `make output live/do/dev/projects/backend/droplet`

3. Rode o playbook:
```
ansible-playbook --sprivate-key=~/.ssh/chave-sos-rs-dev -i live/do/dev/projects/backend/dev_backend_server.yml ansible/backend/setup-server.yml
```
