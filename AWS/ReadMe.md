# Creating AWS Resources using Terraform

## Install Terraform

```bash
wget https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_amd64.zip
sudo unzip terraform_1.0.1_linux_amd64.zip -d /usr/local/bin/
rm terraform_1.0.1_linux_amd64.zip
terraform version
```

## Few Terraform Commands
```
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

## Few AWS CLI Commands

```AWS CLI
aws ec2 describe-vpcs --region us-west-2 --filter "Name=tag:Name,Values=VPC for Web"
aws ec2 describe-vpc-attribute --region us-west-2 --attribute enableDnsHostnames --vpc-id <VPC_ID> vpc-040d4bcdbe1a1f037
```