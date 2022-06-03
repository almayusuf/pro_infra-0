### This repo is used to deploy namespaces


# Usage: 

#### 1. Configure backend
```
bash setenv.sh  envs/dev/tfvars
```

#### 2. Initialize terraform 
```
terraform  init 
```
#### 3. Create 
```
terraform apply    -var-file envs/dev.tfvars      
```


# Upgading jenkins 
1. cd 7.jenkins-setup
2. bash setenv.sh  envs/dev.tfvars 
2.1 Update Image tag in values.yaml file
3. terraform state list 
4. terraform taint module.jenkins-terraform-helm.helm_release.helm_deployment
5. terraform apply -var-file envs/dev.tfvars 

### Verify:
1. kubectl get pods -n jenkins 
2. kubectl get pods -n ingress 
3. kubectl get events -n jenkins 



# Installing new plugins and Upgrading existing plugins
1. cd 7.jenkins-setup
2. bash setenv.sh  envs/dev.tfvars 
2.1 Update Plugin  in values.yaml file
3. terraform state list 
4. terraform taint module.jenkins-terraform-helm.helm_release.helm_deployment
5. terraform apply -var-file envs/dev.tfvars 

### Verify:
1. kubectl get pods -n jenkins 
2. kubectl get pods -n ingress 
3. kubectl get events -n jenkins 



# Resizing jenkins
1. cd 7.jenkins-setup
2. bash setenv.sh  envs/dev.tfvars 
2.1 Update Plugin  in values.yaml file
3. terraform state list 
4. terraform taint module.jenkins-terraform-helm.helm_release.helm_deployment
5. terraform apply -var-file envs/dev.tfvars 

### Verify:
1. kubectl get pods -n jenkins 
2. kubectl get pods -n ingress 
3. kubectl get events -n jenkins 












#### Instructions Steps for Engineers 
Process for Upgrading Jenkins
	1. Schedule a downtime with a team. Send out a notification to everyone, either email, or slack
	2. Reserve 1-4 hours maintenance window for a night. Usually 12:00 am to 4:00 am 
	3. At maintenance window perform the following.
		a. Take a backup or snapshot if possible 
		
		Go to charts  >> values.yaml >> tag >> add_new_image_tag
		
		Steps: 
		terraform taint module.jenkins-terraform-helm.helm_release.helm_deployment
		terraform apply -var-file envs/dev.tfvars
		
		
		Verify from Console
                     Jenkins version from console 

		
Send out a notification to everyone, either email, or slack about the completion of the task

Hello, 

Jenkins has been upgraded successfully, please let us know if you experience any issue 

Thanks


Maintaining Jenkins plugins




Process for Resizing Jenkins
Schedule a downtime with a team. Send out a notification to everyone, either email, or slack
Reserve 1-4 hours maintenance window for a night. Usually 12:00 am to 4:00 am
At maintenance window perform the following.
Take a backup or snapshot if possible
 

Go to charts  >> values.yaml >> resources

 

resources:

requests:

cpu: "50m"

memory: "256Mi"

limits:

cpu: "2000m"         4000

memory: "4096Mi  >>  8000

 

Steps:

terraform taint module.jenkins-terraform-helm.helm_release.helm_deployment

terraform apply -var-file envs/dev.tfvars

 

 

Verify from Console

Manage Jenkins >> Manage Plugins >> Installed

 

Send out a notification to everyone, either email, or slack about the completion of the task





















