# Infra

# Dependencias

- [Terraform / OpenTofu](https://opentofu.org/docs/intro/install/)
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)
- [Infracost](https://github.com/infracost/infracost)

# Autenticacao
Pode-se usar variaveis de ambiente para autenticar com a AWS.

```
echo | tee .env <<EOF
AWS_ACCESS_KEY_ID='chave'
AWS_SECRET_ACCESS_KEY='chave'
AWS_REGION=sa-east-1
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

