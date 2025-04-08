# ubuntu

![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)  ![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square)  ![AppVersion: 24.04](https://img.shields.io/badge/AppVersion-24.04-informational?style=flat-square)

ArgoCD application for Ubuntu Server-based troubleshooting pod, deployed into AXIVO [K3s Cluster](https://github.com/axivo/k3s-cluster). Review the cluster [documentation](https://axivo.com/k3s-cluster/), for additional details. The application deployment is also compatible with a generic Kubernetes cluster.

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
| affinity | map | {} | Affinity rules for pod assignment |
| fullnameOverride | string | "" | Override the full name of the chart |
| image.pullPolicy | string | IfNotPresent | Image pull policy |
| image.repository | string | "ubuntu" | Image repository |
| image.tag | string | "" | Image tag, defaults to Chart.AppVersion if not set |
| imagePullSecrets | list | [] | Image pull secrets |
| livenessProbe.command | list | ["pidof", "sleep"] | Command to execute for liveness check |
| livenessProbe.enabled | bool | false | Enable liveness probe |
| livenessProbe.failureThreshold | int | 3 | Minimum consecutive failures for the probe to be considered failed after having succeeded |
| livenessProbe.initialDelaySeconds | int | 30 | Delay before liveness probe is initiated |
| livenessProbe.periodSeconds | int | 10 | How often to perform the probe |
| livenessProbe.successThreshold | int | 1 | Minimum consecutive successes for the probe to be considered successful after having failed |
| livenessProbe.timeoutSeconds | int | 5 | When the probe times out |
| nameOverride | string | "" | Override the chart name |
| nodeSelector | map | {} | Node selector for pod assignment |
| podAnnotations | map | {} | Annotations to add to the pod |
| podLabels | map | {} | Labels to add to the pod |
| podSecurityContext | map | {} | Pod security context |
| replicaCount | int | 1 | Number of replicas |
| resources.limits | map | `{"memory":"128Mi"}` | Resource limits for the container |
| resources.limits.memory | string | 128Mi | Memory limit |
| resources.requests | map | `{"cpu":"10m","memory":"128Mi"}` | Resource requests for the container |
| resources.requests.cpu | string | 10m | CPU request |
| resources.requests.memory | string | 128Mi | Memory request |
| securityContext | map | {} | Container security context |
| serviceAccount.annotations | map | {} | Annotations to add to the service account |
| serviceAccount.create | bool | false | Specifies whether a service account should be created |
| serviceAccount.name | string | "" | The name of the service account to use |
| tolerations | list | [] | Tolerations for pod assignment |
| volumeMounts | list | [] | Additional volume mounts for the container |
| volumes | list | [] | Additional volumes for the pod |
