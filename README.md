# Learn Terraform in 2022

I am learning Terraform from different books, website, and video courses.

```terraform
terraform init
terraform init -upgrade
terraform validate
terraform plan
terraform apply -auto-approve
terraform show
terraform destroy
```

```AzureCLI
az login
az account list
az account list-locations -o table
```

```
mkdir C:\terraform
cd C:\terraform

Invoke-WebRequest -Uri https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_windows_amd64.zip -outfile terraform_0.13.4_windows_amd64.zip

Expand-Archive -Path .\terraform_0.13.4_windows_amd64.zip -DestinationPath .\
rm .\terraform_0.13.4_windows_amd64.zip -Force

setx PATH "$env:path;C:\terraform" -m

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

terraform version
```

```
cd ~/

wget https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip

unzip terraform_0.13.4_linux_amd64.zip

sudo mv terraform /usr/local/bin

terraform version
```
