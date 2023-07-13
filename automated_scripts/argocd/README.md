# Argo CD Installation Script

This script installs Argo CD using Helm and patches the Argo CD server service to be of type NodePort. It also retrieves the initial admin password for Argo CD.

## Getting Started

To use this script, follow the steps below:

### Prerequisites

- `kubectl` should be installed and configured to connect to your Kubernetes cluster.
- `Helm` should be installed on your machine.

### Running the Script

1. Clone this repository using the following command:

   ````
   git clone https://github.com/PrabhatNew/Kubernetes.git
   ````

2. Change directory to the cloned repository:

   ````
   cd Kubernetes/automated_scripts/argocd
   ````

3. Make the script executable:

   ````
   chmod +x argo_install.sh
   ````

4. Run the script using the following command:

   ````
   ./argo_install.sh
   ````

   This will execute all the commands in the script and display the output after each command.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

- The Argo CD community for maintaining the Helm charts and providing detailed documentation.