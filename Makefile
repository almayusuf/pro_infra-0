export
# Below lines help you build the infrastructure
project-setup : 
		cd 1.project_setup && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 


cluster-setup : project-setup 
		cd 2.cluster_setup && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 


namespace-setup : cluster-setup
		cd 3.namespace_setup && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 









# Warning !!!!       Below lines w

ill destroy the infrastructure
project-setup-destroy : 
		cd 1.project_setup && terraform destroy -auto-approve

cluster-setup-destroy : 
		cd 2.cluster_setup && terraform destroy -auto-approve

namespace-setup-destroy : 
		cd 3.namespace_setup && terraform destroy -auto-approve




# Warning !!!       Below lines will remove/clean the insfrastructure
project-setup-cleanup : 
		cd project_setup && rm -rf .terraform* terraform.tfstate*

cluster-setup-cleanup : 
		cd 1.project_setup && rm -rf .terraform* terraform.tfstate*

namespace-setup-cleanup : 
		cd 1.project_setup && rm -rf .terraform* terraform.tfstate*
