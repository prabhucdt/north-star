#!/bin/bash
echo -e "Initiating....."
sleep 3

echo -e "\e[1;32m"
echo -e "*****************************************************************************"
echo -e "#  _   _                                       __                           #  "
echo -e "# | \ | |                   _     _          / __)    _                     # "
echo -e "# |  \| |   ___    _  _   _| |_  | |_       ( (_    _| |_    ___      _  _  # "
echo -e "# |     |  / _ \  | |/ / |_   _| | '_ \      \__ \ |_   _|  / _ \    | |/ / #   "
echo -e "# | |\  | | (_) | | |_/    | |_  | | | |      __) )  | |_  | (_) '\  | |_/  #   "
echo -e "# |_| \_|  \___/  |_|      |___| |_| |_|     (__ /   |___|  \___/\_\ |_|    #   "
echo -e "#                                                                           # "
echo -e "*****************************************************************************"
echo -e "\e[0m"

sleep 3

##Variables
namespace="devops"

export HELM_NAMESPACE=$namespace

##Stage 1 - Kubernetes cluster provisioning using terraform
echo -e "\e[1;31m"
echo -e "Stage 1"
sleep 1
echo -e "Kubernetes cluster provisioning using terraform"
echo -e "\e[0m"
sleep 1

#echo -e "Skipping for now............."

terraform -chdir="./terraform/aws" init
terraform -chdir="./terraform/aws" plan
terraform -chdir="./terraform/aws" validate
terraform -chdir="./terraform/aws" apply -auto-approve
cd ../..

##Stage 2 - Jenkins provisioning using Helm
echo -e "\e[1;31m"
echo -e "Stage 2"
sleep 1
echo -e "Jenkins provisioning using helm"
echo -e "\e[0m"
sleep 1

##Add helm repo
helm repo add jenkins https://charts.jenkins.io
helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo add sonatype https://sonatype.github.io/helm3-charts/

helm repo update

##Install Jenkins
helm upgrade --install jenkins --namespace $namespace -f helm/jenkins/values.yaml jenkins/jenkins --create-namespace --wait

##Install Sonarqube
helm upgrade --install sonarqube --namespace $namespace -f helm/sonarqube/values.yaml sonarqube/sonarqube --create-namespace --wait

##Install Nexus-iq-server
#helm upgrade --install nexus-iq --namespace $namespace -f helm/nexus-iq/values.yaml sonatype/nexus-iq-server --create-namespace --wait


