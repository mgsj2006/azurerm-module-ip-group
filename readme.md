
# Modulo - IP Groups
[![Avanade](https://img.shields.io/badge/create%20by-Avanade-orange)](https://www.avanade.com/pt-br/about-avanade) [![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Modulo desenvolvido para facilitar a criação de IP Groups

## Compatibilidade de Versão

| Versão do Modulo | Versão Terraform | Versão AzureRM |
|----------------|-------------------| --------------- |
| >= 1.x.x       | 0.14.x            | >= 2.46         |

## Especificando versão

Para evitar que seu código receba atualizações automáticas do modulo, é preciso informar na chave `source` do bloco do module a versão desejada, utilizando o parametro `?ref=***` no final da url. conforme pode ser visto no exemplo abaixo.

## Exemplo de uso


```hcl
module "ip-groups" {
  source    = "git::https://timbrasil@dev.azure.com/timbrasil/Projeto_IaC/_git/modulo-ip-group.git?ref=v1.0.0"
  ip_groups = {
    "grupo-1" = ["10.10.10.0/24", "10.10.20.0/24"]
    "grupo-2" = ["10.10.30.0/24", "10.10.40.0/24"]
  }
  location  = data.azurerm_resource_group.rg.location
  rg_name   = data.azurerm_resource_group.rg.name
  tags      = {
    area      = "infraestrutura"
  }
}
output "ids" {
  value = module.ip_groups.ids
}
```

## Entrada de Valores

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ip_groups | tabela informando os nomes dos grupos de ip e seus respectivos cirds | `map(list(string))` | n/a | yes |
| rg_name | nome do resource group onde os recursos serão alocados | `string` | n/a | yes |
| tags | Tags adicionais | `map(string)` | `{}` | No |
| location | Região do Azure | `string` | n/a | yes |


## Saída de Valores

| Name | Description |
|------|-------------|
| ids | IDs gerada após provisionamento do recurso para cada um dos grupos de IP informados no `ip_goups` |

## Documentação de Referência

Terraform Application Security Group: [https://www.terraform.io/providers/azurerm/latest/docs/resources/ip_group](https://www.terraform.io/providers/azurerm/latest/docs/resources/ip_group)
