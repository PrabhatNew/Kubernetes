To apply your Helm chart to your Kubernetes cluster, you can follow these steps:

Clone your Git repository containing the Helm chart to your local machine:
git clone https://github.com/PrabhatNew/Kubernetes.git

Change your working directory to the helm_charts directory:
cd Kubernetes/helm_charts/

Change the values.yaml file according to your configuration.

Install the Helm chart using the helm install command, specifying a release name and the path to the chart:
helm install my-nfs-release my-nfs-chart-0.1.0.tgz

Replace my-nfs-release with a name of your choice that identifies this release of the Helm chart. You can also specify additional options like --namespace to install the chart in a specific namespace.

Verify that your resources were created successfully by running kubectl get commands for your PersistentVolume, PersistentVolumeClaim, and StorageClass:
kubectl get pv
kubectl get pvc
kubectl get sc

You should see output indicating that the resources were created and are in a Bound state.
Now, you can use the PersistentVolumeClaim in your Kubernetes deployments or pods by referencing its name in the volumes section of your YAML manifest.