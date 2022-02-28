export
# Below lines help you build the infrastructure
project-setup :
		cd 1.project_setup && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 

