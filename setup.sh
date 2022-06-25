#!/bin/sh
##Variables
namespace="devops"

export HELM_NAMESPACE=$namespace

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


