# Infraestrutura Azure - Aprova AI

Este projeto Terraform cria uma infraestrutura completa na Azure com 3 VMs Linux equivalentes aos tamanhos EC2 especificados, incluindo rede virtual, segurança e monitoramento.

## 🏗️ Arquitetura

### Mapeamento de Tamanhos EC2 → Azure
- **t4g.large** → **Standard_B4ms** (4 vCPUs, 16 GB RAM) → `vm-aprova-ai-1`
- **t4g.xlarge** → **Standard_B4ms** (4 vCPUs, 16 GB RAM) → `vm-aprova-ai-2`
- **t4g.micro** → **Standard_B1s** (1 vCPU, 1 GB RAM) → `vm-aprova-ai-3`
- **Ansible Control Node** → **Standard_B1s** (1 vCPU, 1 GB RAM) → `vm-aprova-ai-4`
- **VM Monitoramento** → **Standard_D2s_v5** (2 vCPUs, 8 GB RAM) → `vm-aprova-ai-monitoring`

### Componentes da Infraestrutura
- **Resource Group**: Agrupamento de recursos
- **Virtual Network**: Rede virtual `10.10.0.0/24` (East US)
- **Network Security Groups**: Regras específicas para cada VM
  - **VM Aprova AI 1**: TCP (22, 80, 443, 5432, 27072)
  - **VM Aprova AI 2**: TCP (21, 22, 443, 27072, 5432)
  - **VM Aprova AI 3**: TCP (22, 80, 443), UDP (10447)
  - **VM Aprova AI 4 (Ansible)**: TCP (22)
  - **VM Aprova AI Monitoring**: TCP (22, 80, 443)
- **5 VMs Linux**: 4 VMs Debian 12 + 1 VM Ubuntu 22.04 LTS para monitoramento
- **Public IPs**: IPs públicos estáticos para cada VM


## 🚀 Pré-requisitos

1. **GitHub Actions** configurado com Service Principal
2. **Terraform** >= 1.0 (executado via CI/CD)
3. **SSH Key Pair** gerado (para as VMs)
4. **Infracost GitHub App** instalado na organização

## 📋 Configuração

### 1. Clone o repositório
```bash
git clone <repository-url>
cd infra-aprova-ai
```

### 2. Configure as variáveis
```bash
# Copie o arquivo de exemplo
cp terraform.tfvars.example terraform.tfvars

# Edite o arquivo com suas configurações
nano terraform.tfvars
```

### 3. Configure o SSH Key
```bash
# Gere uma nova chave SSH (se necessário)
ssh-keygen -t rsa -b 4096 -f ~/.ssh/azure_key

# Copie a chave pública para o arquivo terraform.tfvars
cat ~/.ssh/azure_key.pub
```

### 4. Configure o Backend (Opcional)
Para usar estado remoto do Terraform:

```bash
# Crie um storage account para o backend
az group create --name rg-terraform-backend --location "East US"
az storage account create --name stterraformbackend --resource-group rg-terraform-backend --location "East US" --sku Standard_LRS
az storage container create --name tfstate --account-name stterraformbackend
```

## 🔧 Uso

### Fluxo de Trabalho (CI/CD)

1. **Criar Pull Request**:
   - O GitHub Actions executa `terraform plan`
   - O Infracost GitHub App analisa os custos
   - Ambos aparecem como comentários na PR

2. **Aprovar e Fazer Merge**:
   - O GitHub Actions executa `terraform apply`
   - A infraestrutura é provisionada na Azure

### Desenvolvimento Local (Opcional)
```bash
# Inicializar Terraform
terraform init

# Verificar plano
terraform plan

# Aplicar (apenas para testes locais)
terraform apply
```

### Análise de Custos com Infracost
```bash
# Instalar Infracost (se não estiver instalado)
# Windows: choco install infracost
# macOS: brew install infracost
# Linux: curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh

# Análise de custos
infracost breakdown --path .

# Comparar com mudanças
infracost diff --path .

# Com configuração personalizada
infracost breakdown --config-file infracost.yml
```

### 🔄 Integração com Pipeline CI/CD

#### Autenticação Azure:
- ✅ **Service Principal**: Configurado via `AZURE_CREDENTIALS` secret
- ✅ **Provider**: Configurado vazio (autenticação via GitHub Actions)
- ✅ **Workflow**: `.github/workflows/terraform.yml`

#### Análise de Custos (Infracost):
- ✅ **GitHub App**: Instalado na organização
- ✅ **Comentários automáticos**: Aparecem diretamente na PR
- ✅ **API Key**: Configurada como `INFRACOST_API_KEY` secret

#### Fluxo de Trabalho:
1. **Pull Request**: Executa `terraform plan` + análise de custos
2. **Merge na main**: Executa `terraform apply`
3. **Infracost**: Analisa automaticamente via GitHub App

### Destruir a infraestrutura
```bash
terraform destroy
```

## 🔐 Segurança

### Configurações Implementadas
- ✅ Autenticação SSH por chave pública
- ✅ Desabilitação de autenticação por senha
- ✅ Network Security Group com regras restritivas
- ✅ Subnet isolada para VMs
- ✅ Tags para organização e governança

### Recomendações de Segurança
1. **Restrinja IPs SSH**: Configure `allowed_ssh_ips` apenas com IPs necessários
2. **Use Azure Key Vault**: Para armazenar secrets e chaves
3. **Habilite Azure Security Center**: Para monitoramento de segurança
4. **Configure Backup**: Implemente backup das VMs
5. **Use Managed Identity**: Para autenticação entre recursos

## 📊 Monitoramento



## 💰 Estimativa de Custos

### Custos Mensais Estimados (US East)
- **VM Aprova AI 1 (Standard_B4ms)**: ~$146/month
- **VM Aprova AI 2 (Standard_B4ms)**: ~$146/month  
- **VM Aprova AI 3 (Standard_B1s)**: ~$18/month
- **VM Aprova AI 4 - Ansible (Standard_B1s)**: ~$18/month
- **VM Aprova AI Monitoring (Standard_D2s_v3)**: ~$73/month
- **Total VMs**: ~$401/month
- **Networking**: ~$50-100/month
- **Total Estimado**: ~$451-501/month

> ⚠️ **Nota**: Use `infracost breakdown --path .` para análise detalhada de custos.

## 📁 Estrutura do Projeto

```
infra-aprova-ai/
├── main.tf              # Recursos principais da infraestrutura
├── variables.tf         # Definição de variáveis
├── outputs.tf          # Outputs da infraestrutura
├── terraform.tfvars.example  # Exemplo de configuração
├── README.md           # Este arquivo
└── .gitignore         # Arquivos ignorados pelo Git
```

## 🔄 Workflow Recomendado

1. **Desenvolvimento**: Use `environment = "dev"`
2. **Staging**: Use `environment = "staging"`
3. **Produção**: Use `environment = "prod"`

### Para diferentes ambientes:
```bash
# Desenvolvimento
terraform plan -var="environment=dev" -var="resource_group_name=rg-aprova-ai-dev"

# Staging
terraform plan -var="environment=staging" -var="resource_group_name=rg-aprova-ai-staging"

# Produção
terraform plan -var="environment=prod" -var="resource_group_name=rg-aprova-ai-prod"
```

## 🛠️ Troubleshooting

### Problemas Comuns

1. **Erro de autenticação Azure**:
   ```bash
   az login
   az account set --subscription <subscription-id>
   ```

2. **Erro de SSH Key**:
   - Verifique se a chave pública está no formato correto
   - Certifique-se de que não há quebras de linha extras

3. **Erro de quota**:
   - Verifique os limites da sua subscription
   - Solicite aumento de quota se necessário

## 📞 Suporte

Para dúvidas ou problemas:
1. Verifique os logs do Terraform
2. Consulte a documentação da Azure
3. Abra uma issue no repositório

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---
*Última atualização: Teste de infraestrutura Azure com 3 VMs*
