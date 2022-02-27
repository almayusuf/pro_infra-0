export

project-setup : 
		cd 1.project_setup && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 


cluster-setup : 
		cd 2.cluster_setup && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 















project-setup-cleanup : 
		cd project_setup && rm -rf .terraform* terraform.tfstate*

cluster-setup-cleanup : 
		cd 1.project_setup && rm -rf .terraform* terraform.tfstate*
