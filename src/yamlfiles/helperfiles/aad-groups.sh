#!/bin/bash

AKS_ID=/subscriptions/39d07b0f-88c5-40cc-b714-ffff1bca236f/resourcegroups/teamResources/providers/Microsoft.ContainerService/managedClusters/securecluster

## Web Dev
WEBDEV_GROUP_ID=$(az ad group create \
    --display-name Web-dev \
    --mail-nickname webdev \
    --query objectId -o tsv)

az role assignment create \
    --assignee $WEBDEV_GROUP_ID \
    --role "Azure Kubernetes Service Cluster User Role" \
    --scope $AKS_ID

## Api Dev
APIDEV_GROUP_ID=$(az ad group create \
    --display-name Api-dev \
    --mail-nickname apidev \
    --query objectId -o tsv)

az role assignment create \
    --assignee $APIDEV_GROUP_ID \
    --role "Azure Kubernetes Service Cluster User Role" \
    --scope $AKS_ID
