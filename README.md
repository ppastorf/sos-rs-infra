# Infra

# Dependencias

- [Terraform / OpenTofu](https://opentofu.org/docs/intro/install/)
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)
- [Infracost](https://github.com/infracost/infracost)

# Autenticacao
Pode-se usar variaveis de ambiente para autenticar com a AWS.

# Deploy
1. Autenticar
```
echo | tee .env <<EOF
AWS_ACCESS_KEY_ID=''
AWS_SECRET_ACCESS_KEY=''
AWS_REGION=sa-east-1
EOF

export `cat .env | xargs`
```

2. Validar plan
```
make plan caminho/do/modulo
```

3. Aplicar
```
make apply caminho/do/modulo
```

# Workflow de Contribuicao
Abra um PR com as mudancas propostas, colocar o output do plan no PR.
Somente de apply apos o PR ser aprovado.

# Modulos AWS
https://registry.terraform.io/search/modules?namespace=terraform-aws-modules

