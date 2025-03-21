# ubuntu

![AppVersion: 24.04](https://img.shields.io/badge/AppVersion-24.04-informational?style=flat-square)

ArgoCD application for Ubuntu Server-based troubleshooting pod, deployed into AXIVO [K3s cluster](https://github.com/axivo/k3s-cluster). Review the cluster [documentation](https://axivo.com/k3s-cluster/), for additional details. The application deployment is also compatible with a generic Kubernetes cluster.

## Application Deployment

> [!IMPORTANT]
> Prior application deployment, adjust the [`values.yaml`](./values.yaml) chart configurable parameters.

The application can be deployed from ArgoCD UI, or terminal:

```shell
kubectl apply -f apps/ubuntu/application.yaml
```

### Chart Values

See the chart values, listed below.

> [!TIP]
> Use [Robusta KRR](https://axivo.com/k3s-cluster/tutorials/handbook/tools/#robusta-krr), to optimize the cluster resources allocation.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ubuntu"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"10m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| securityContext | object | `{}` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |
