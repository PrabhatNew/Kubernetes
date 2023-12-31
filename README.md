# Kubernetes Cluster Setup with HAProxy and Rancher

This repository contains Ansible playbooks and Bash scripts to set up a Kubernetes cluster with HAProxy and Rancher on Ubuntu 22.04. The playbook automates the installation process and allows users to quickly set up a Kubernetes cluster.

## Table of Contents
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Requirements
- Ubuntu 22.04
- Ansible 2.9+
- The ansible control node (where you'll run the Ansible commands) must be able to SSH to all the nodes without a password. This can be done by generating SSH keys and copying the public key to all the nodes.

## Installation
1. Clone the repository to your Ansible controller (local machine) and to all the nodes in the cluster using the following command:
   `````sh
   sudo git clone https://github.com/PrabhatNew/Kubernetes.git
   

2. Navigate to the repository directory:
   ````sh 
   cd Kubernetes
   

3. Make the Bash scripts executable using the following command:
   ````sh
   sudo chmod +x -R bash_files
   ````
   ````sh
   cd bash_files
   ````

4. Run the `on_all_nodes.sh` script on all the nodes in your cluster to gather information about each individual node:
   ````sh
   bash on_all_nodes.sh
   

5. Execute the `hosts.ini.sh` script on your Ansible control node and enter the data gathered from the `on_all_nodes.sh` command to create the `hosts.ini` file:
   ````sh
   sudo bash hosts.ini.sh
   

6. Verify that the `hosts.ini` file was created and contains the correct information:
   ````sh
   cat /Kubernetes/ansible/hosts.ini
   

7. Copy the SSH public key from the Ansible control node to all other nodes in the cluster using the `ssh-copy-id` command:
   ````sh
   ssh-copy-id desk@192.168.101.109
   ssh-copy-id desk@192.168.101.110
   ssh-copy-id desk@192.168.101.111
   
   Alternatively, you can use the `ssh-copy-id_automated.sh` script to automate this process:
  
   cd Kubernetes/bash_files
   bash ssh-copy-id_automated.sh
   

## Usage
To use the scripts in this repository, follow these steps:

1. Test the Ansible connection to all hosts using the following command:
   ````sh
   cd /Kubernetes/ansible
   ansible all -m ping -i hosts.ini 
   

   **Note:** Do not run the `mainplaybook.yml` if the connection to all hosts has not passed. Instead, run the playbooks individually.

2. To execute all playbooks at once, run the following command:
   ````sh
   ansible-playbook -i hosts.ini mainplaybook.yml 
   

3. To execute playbooks individually, run the following commands:
   - To install Keepalived and HAProxy:
     ```sh
     ansible-playbook -i hosts.ini playbooks/install_haproxy_keepalived.yml
     ```
   - To configure Keepalived:
     ```sh
     ansible-playbook -i hosts.ini playbooks/configure_keepalived.yml
     ```
   - To configure HAproxy:
     ```sh
     ansible-playbook -i hosts.ini playbooks/configure_haproxy.yml
     ```
   - To install Kubernetes:
     ```sh
     ansible-playbook -i hosts.ini playbooks/install_kubernetes.yml 
     ```
   - To initialize Kubernetes on the first master host:
     ```sh
     ansible-playbook -i hosts.ini playbooks/init_kubernetes.yml
     ```
   - To join the worker nodes to the Kubernetes cluster:
     ```sh
     ansible-playbook -i hosts.ini playbooks/join_worker.yml 
     ```
   - To join the master nodes to the Kubernetes cluster:
     ```sh
     ansible-playbook -i hosts.ini playbooks/join_master.yml 
     ```
   - To install Rancher:
     ```sh
     ansible-playbook -i hosts.ini playbooks/rancher_setup.yml 
     ```

## Examples
Here are some examples of how to use the playbook for different scenarios:

- **Setting up a Kubernetes cluster with three nodes:** Assume you have three nodes with the following IP addresses: `192.168.101.109`, `192.168.101.110`, and `192.168.101.111`. Run the following commands to set up the cluster:

  ````sh
  sudo git clone https://github.com/PrabhatNew/Kubernetes.git
  cd Kubernetes
  sudo chmod +x -R bash_files
  cd bash_files
  bash on_all_nodes.sh
  sudo bash hosts.ini.sh
  cat /Kubernetes/ansible/hosts.ini
  ssh-copy-id desk@192.168.101.109
  ssh-copy-id desk@192.168.101.110
  ssh-copy-id desk@192.168.101.111
  cd /Kubernetes/ansible
  ansible all -m ping -i hosts.ini 
  ansible-playbook -i hosts.ini mainplaybook.yml 
  

- **Joining additional worker nodes to an existing Kubernetes cluster:** Assume you have an existing Kubernetes cluster, and you want to add two more worker nodes with the following IP addresses: `192.168.101.112` and `192.168.101.113`. Run the following commands to add the worker nodes:

  ````sh
  cd /Kubernetes/ansible
  ansible-playbook -i hosts.ini playbooks/join_worker.yml --extra-vars "node_ips=192.168.101.112,192.168.101.113"
  

## Troubleshooting
If you encounter any issues when using the playbook, try the following steps:

- Verify that the `hosts.ini` file contains the correct information.
- Check that the SSH connection to all hosts is successful using the `ansible all -m ping -i hosts.ini` command.
- Check the status of the Kubernetes cluster using the `kubectl get nodes` command.
- Read the error messages and search for solutions online.

If you are unable to resolve the issue, please contact the project owner for assistance.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.