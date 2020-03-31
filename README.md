# Hypershift Installer

## Overview
The hypershift installer is a program for running OpenShift 4.x in a hyperscale manner with many control planes hosted on a central management cluster. 

## Getting Started

### Build and run the installer

* Install an Openshift 4.x cluster on AWS using the traditional installer
* Run `make` on this repository
* Setup your KUBECONFIG to point to the admin kubeconfig of your current AWS cluster
  (ie. `export KUBECONFIG=${INSTALL_DIR}/auth/kubeconfig`)
* Run `./bin/hypershift-installer install NAME` to install a new Hypershift cluster on your
  existing AWS cluster. The `NAME` parameter will be used to create a namespace
  on your existing cluster and place all control plane components in it. Infrastructure
  will be created on AWS to support your new cluster instance, including:
  - Network Load Balancers for API, Router, VPN
  - DNS entries for API, Router, VPN
  - Worker machine instances for your new cluster

### Uninstalling on AWS
* Setup your KUBECONFIG to point to the management cluster
* Run `./bin/hypershift-installer uninstall NAME` where NAME is the name you gave your
  cluster when installing.

