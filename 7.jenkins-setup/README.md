### This repo is used to deploy namespaces


# Usage: 

#### 1. Configure backend
```
bash setenv.sh
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