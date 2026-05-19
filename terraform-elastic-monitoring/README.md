Ниже пример **README.md** для репозитория **terraform-elastic-monitoring** в GitHub.
Он описывает проект и инструкции запуска в Amazon Web Services с помощью Terraform.

------

# terraform-elastic-monitoring

Infrastructure-as-Code проект для развёртывания **Monitoring Stack** в AWS.

Проект автоматически создаёт инфраструктуру и устанавливает компоненты **Elastic Stack**:

* Elasticsearch – хранение логов
* Kibana – визуализация и поиск
* Logstash – обработка логов
* Filebeat / Elastic Agents – сбор логов

---

# Architecture

Проект создаёт следующую архитектуру в AWS:

```
VPC: Elastic Monitoring

Public Subnet
   EC2 Ubuntu
   Elasticsearch
   Kibana

Private Subnet
   EC2 Ubuntu
   Logstash

Private Subnet
   EC2 Ubuntu
   Filebeat / Elastic Agent

Internet Gateway
NAT Gateway
Route Tables
Security Groups
```

Kibana и Elasticsearch доступны из интернета.

---

# Project structure

```
terraform-elastic-monitoring/

provider.tf
variables.tf

internet_gateway.tf
subnets.tf
nat_gateway.tf
route_tables.tf

security_groups.tf

elastic_stack.tf
logstash_instance.tf
agents_instance.tf

userdata/
   elastic.sh
   logstash.sh
   agents.sh

outputs.tf
```

---

# Requirements

Перед запуском необходимо установить:

* Terraform
* AWS CLI
* аккаунт в Amazon Web Services

---

# Configure AWS credentials

Настройте AWS CLI:

```bash
aws configure
```

Введите:

```
AWS Access Key
AWS Secret Key
Region
```

---

# Create SSH key for EC2

Создайте KeyPair в AWS:

```
EC2 → Key Pairs → Create key pair
```

Например:

```
ubuntu-key
```

Файл:

```
ubuntu-key.pem
```

Сохраните его локально.

---

# Clone repository

Скачать проект из GitHub:

```bash
git clone https://github.com/alexanderri01/terraform-elastic-monitoring.git
```

Перейти в каталог проекта:

```bash
cd terraform-elastic-monitoring
```

---

# Configure variables

Отредактируйте файл:

```
variables.tf
```

Пример:

```hcl
variable "key_name" {
  default = "ubuntu-key"
}
```

---

# Initialize Terraform

```bash
terraform init
```

---

# Preview infrastructure

```bash
terraform plan
```

---

# Deploy infrastructure

```bash
terraform apply
```

Подтвердите:

```
yes
```

Terraform создаст:

* VPC
* Subnets
* Security Groups
* EC2 instances
* Elastic Stack

---

# Access Kibana

После завершения Terraform выведет IP:

```
kibana_url
```

Открыть в браузере:

```
http://EC2_PUBLIC_IP:5601
```

Это интерфейс **Kibana**.

---

# Destroy infrastructure

Чтобы удалить всю инфраструктуру:

```bash
terraform destroy
```

---

# Future improvements

Возможные улучшения проекта:

* добавить Prometheus
* добавить Grafana
* использовать AutoScaling для Agents
* добавить Load Balancer для Kibana
* хранить Terraform state в S3

