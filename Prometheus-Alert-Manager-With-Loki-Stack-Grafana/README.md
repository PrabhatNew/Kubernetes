# Prometheus-Alert-Manager-With-Loki-Stack-Grafana


kubectl create ns monitoring

sudo git clone https://github.com/PrabhatNew/Kubernetes.git

cd Kubernetes

cd Prometheus-Alert-Manager-With-Loki-Stack-Grafana/

kubectl apply -f Prometheus-Alert-Manager\ /

helm repo add grafana https://grafana.github.io/helm-charts

helm repo update

helm install loki-stack grafana/loki-stack --set grafana.rbac.pspEnabled=false --values values.yaml -n monitoring

Note: Please edit values.yaml file for loki stack accordingly.

Use 15141 for loki stack dashboard.
Use 315 for graphana dashboard.
## All thanks to my brother https://np.linkedin.com/in/suyeshsingh for his awesome effort on creating this repo.