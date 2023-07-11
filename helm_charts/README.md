<<<<<<< HEAD
# NFS Client Provisioner Helm Chart

This Helm chart deploys an NFS client provisioner to your Kubernetes cluster. The provisioner is responsible for dynamically provisioning NFS volumes for your applications.

## Prerequisites

Before you can run this Helm chart, you need to have the following prerequisites installed:

- Kubernetes cluster with version 1.18 or later
- Helm 3

## Installing the Chart

To install the chart, follow these steps:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/PrabhatNew/Kubernetes.git
```

2. Change into the chart's directory:

```bash
cd Kubernetes/helm_charts/nfs-provisioner
```

3. Install the chart using the `helm install` command:

```bash
helm install <release-name> . --set server=<NFS Server IP>,path=/srv/nfs/kubedata
```

Replace `<release-name>` with a name for your release, `<NFS Server IP>` with the IP address of your NFS server and `path` with the path of volume mount.

## Configuration

The following table lists the configurable parameters of the chart and their default values:

| Parameter                  | Description                                       | Default                     |
| --------------------------| ------------------------------------------------- | ---------------------------|
| `storageClass.name`        | Name of the storage class to create               | `managed-nfs-storage`       |
| `storageClass.provisioner` | Name of the NFS provisioner to use                 | `example.com/nfs`           |
| `storageClass.archiveOnDelete` | Whether to archive on delete or not           | `false`                 |
| `deployment.image`        | Docker image for the NFS client provisioner       | `quay.io/external_storage/nfs-client-provisioner:latest` |
| `deployment.provisionerName` | Name of the NFS provisioner to use             | `example.com/nfs`       |
| `server`                   | IP address of the NFS server                      | `""`                        |
| `path`                     | Path to the NFS share on the server                | `""`                        |

You can override these values using the `--set` flag when running the `helm install` command.

## Uninstalling the Chart

To uninstall the chart, use the `helm uninstall` command:

```bash
helm uninstall <release-name>
```

Replace `<release-name>` with the name of the release that you want to uninstall.

## Conclusion

Congratulations! You have successfully installed an NFS client provisioner to your Kubernetes cluster using Helm. You can now use the provisioner to dynamically provision NFS volumes for your applications.
=======
To apply your Helm chart to your Kubernetes cluster, you can follow these steps:

Clone your Git repository containing the Helm chart to your local machine:
git clone https://github.com/PrabhatNew/Kubernetes.git

Change your working directory to the helm_charts directory:
cd Kubernetes/helm_charts/

Extract the contents of the chart tarball to a directory on your local machine:
tar -xzf my-nfs-chart-0.1.0.tgz

Edit the values.yaml file according to your configuration.

Package the modified chart directory back into a tarball:
tar -czf my-nfs-chart-0.1.0-modified.tgz my-nfs-chart-0.1.0/

Install the Helm chart using the helm install command, specifying a release name and the path to the chart:
helm install my-nfs-release -f values.yaml my-nfs-chart-0.1.0-modified.tgz

Replace my-nfs-release with a name of your choice that identifies this release of the Helm chart. You can also specify additional options like --namespace to install the chart in a specific namespace.

Verify that your resources were created successfully by running kubectl get commands for your PersistentVolume, PersistentVolumeClaim, and StorageClass:
kubectl get pv
kubectl get pvc
kubectl get sc

You should see output indicating that the resources were created and are in a Bound state.
Now, you can use the PersistentVolumeClaim in your Kubernetes deployments or pods by referencing its name in the volumes section of your YAML manifest.

Note that the nfs-encrypted provisioner relies on the dm-crypt kernel module to provide encryption. You should ensure that this module is loaded on all nodes in your kubernetes cluster before using the nfs-encrypted provisioner.
>>>>>>> f31d06efa10b524570ccc67acb25ca593b098880
