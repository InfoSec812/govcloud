#!/usr/bin/env bash

printf "This script will prompt for required settings which are not already set via environment variables.\n\n"

while [ "${OCP_UNIQUE_ENV_ID}X" == "X" ]; do
    printf "Enter the environment ID to be used for provisioning OCP: "
    read OCP_UNIQUE_ENV_ID
    printf "\n\n"
done

while [ "${AWS_AMI}X" == "X" ]; do
    printf "Enter the AWS AMI base image to be used: "
    read AWS_AMI
    printf "\n\n"
done

printf "Enter number of master nodes to provision (default 3, 3 or more required for HA): "
read AWS_MASTER_NODE_INSTANCE_COUNT
printf "\n\n"

printf "Enter number of infrastructure nodes to provision (default 3, 3 or more required for HA): "
read AWS_INFRA_NODE_INSTANCE_COUNT
printf "\n\n"

printf "Enter number of application nodes to provision (default 4): "
read AWS_APP_NODE_INSTANCE_COUNT
printf "\n\n"

printf "Enter number of cloud native storage nodes to provision (default 0, 3 or more required for resilience): "
read AWS_CNS_NODE_INSTANCE_COUNT
printf "\n\n"

while [ "${AWS_ROUTE53_DOMAIN_NAME}X" == "X" ]; do
    printf "AWS ROUTE53 Domain Name for cluster: "
    read AWS_ROUTE53_DOMAIN_NAME
    printf "\n\n"
done

while [ "${AWS_REGION}X" == "X" ]; do
    printf "Enter AWS Region where the cluster is to be deployed (default: us-east-1a): "
    read AWS_REGION
    printf "\n\n"
done

while [ "${AWS_VPC_ID}X" == "X" ]; do
    printf "Enter AWS VPC ID: "
    read AWS_VPC_ID
    printf "\n\n"
done

while [ "${AWS_VPC_SUBNET_ID}X" == "X" ]; do
    printf "Enter AWS Subnet ID: "
    read AWS_VPC_SUBNET_ID
    printf "\n\n"
done

while [ "${RHSM_USERNAME}X" == "X" ]; do
    printf "Enter Red Hat Satellite Username: "
    read RHSM_USERNAME
    printf "\n\n"
done

while [ "${RHSM_PASSWORD}X" == "X" ]; do
    printf "Enter Red Hat Satellite Password: "
    read RHSM_PASSWORD
    printf "\n\n"
done

