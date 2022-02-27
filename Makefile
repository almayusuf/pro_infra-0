export

project-setup : 
		cd project_setup && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 

project-setup-destroy : 
		cd project_setup && rm -rf .terraform* terraform.tfstate*
