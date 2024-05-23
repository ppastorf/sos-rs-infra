# Infra

# Dependencias

- [Terraform / OpenTofu](https://opentofu.org/docs/intro/install/)
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)
- [Infracost](https://github.com/infracost/infracost)

# Autenticacao
Pode-se usar variaveis de ambiente para autenticar com a Digital Ocean (as variaveis da AWS sao tem os mesmos valores que as `SPACES_`, usadas para autenticar com o Spaces, que eh um fork do S3).

```
echo | tee .env <<EOF
DIGITALOCEAN_TOKEN=''
SPACES_ACCESS_KEY_ID=''
SPACES_SECRET_ACCESS_KEY=''
AWS_ACCESS_KEY_ID=''
AWS_SECRET_ACCESS_KEY=''
EOF

export `cat .env | xargs`
```

# Deploy
1. Validar plan
```
make plan caminho/do/modulo
```

2. Aplicar
```
make apply caminho/do/modulo
```

O makefile tem outras diretivas uteis.

# Workflow de Contribuicao
Abra um PR com as mudancas propostas, colocar o output do plan no PR.
Somente de apply apos o PR ser aprovado.

# Modulos AWS
https://registry.terraform.io/search/modules?namespace=terraform-aws-modules

