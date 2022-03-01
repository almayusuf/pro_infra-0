export
# Below lines help you build the infrastructure
project-setup :
		cd 1.project_setup && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 


cluster-setup : project-setup 
		cd 2.cluster_setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 


namespace-setup : cluster-setup
		cd 3.namespace_setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 


ingress-controller-setup : namespace-setup
		cd 4.ingress-controller-setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 


domain-setup : ingress-controller-setup
		cd 6.domain_setup.tf && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve  -var-file envs/dev.tf

