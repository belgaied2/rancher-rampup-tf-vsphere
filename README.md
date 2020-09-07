# Terraform deploying vSphere and Rancher2 K8S on vSphere

## Introduction

This repository aims at providing some basic terraform code to deploy a VM on vSphere, and to build a Kubernetes Cluster on vSphere, using Rancher2 terraform provider.

## Pre-requisites

- [Terraform](https://terraform.io/) with minimum version 0.12 
- [vSphere provider for terraform]()
- [Rancher2 provider for terraform]()
- [Ansible](https://www.ansible.com/), this was tested with version 2.9.6
- [Packer](https://packer.io/), this was tested with version 1.5.5