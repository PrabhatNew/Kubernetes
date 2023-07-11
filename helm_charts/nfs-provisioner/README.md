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