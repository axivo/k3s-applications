# sealed-secrets

![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)  ![Version: 1.1.2](https://img.shields.io/badge/Version-1.1.2-informational?style=flat-square)  ![AppVersion: 2.17.3](https://img.shields.io/badge/AppVersion-2.17.3-informational?style=flat-square)

ArgoCD application for `sealed-secrets` [chart](https://github.com/bitnami-labs/sealed-secrets/blob/helm-v2.17.3/helm/sealed-secrets), deployed into AXIVO [K3s Cluster](https://github.com/axivo/k3s-cluster). Review the cluster [documentation](https://axivo.com/k3s-cluster/), for additional details. The application deployment is also compatible with a generic Kubernetes cluster.

## Application Deployment

> [!IMPORTANT]
> Prior application deployment, adjust the [`values.yaml`](./values.yaml) chart configurable parameters.

The application can be deployed from ArgoCD UI, or terminal:

```shell
$ kubectl apply -f apps/sealed-secrets/application.yaml
```

### Chart Values

See the chart values, listed below.

> [!TIP]
> Use [Robusta KRR](https://axivo.com/k3s-cluster/tutorials/handbook/tools/#robusta-krr), to optimize the cluster resources allocation.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| sealed-secrets.fullnameOverride | string | "sealed-secrets-controller" | Fully overrides the controller fullname |
| sealed-secrets.keyrenewperiod | string | "" | Specifies key renewal period, e.g., 720h0m (30 days) |
| sealed-secrets.metrics.dashboards.annotations | map | {} | Annotations added to Grafana dashboard ConfigMap |
| sealed-secrets.metrics.dashboards.create | bool | true | Specifies whether a Grafana dashboard ConfigMap is created |
| sealed-secrets.metrics.dashboards.labels | map | {} | Labels added to Grafana dashboard ConfigMap |
| sealed-secrets.metrics.dashboards.namespace | string | "kube-system" | Namespace where Grafana dashboard ConfigMap is deployed |
| sealed-secrets.metrics.serviceMonitor.enabled | bool | true | Specifies if a ServiceMonitor is deployed |
| sealed-secrets.metrics.serviceMonitor.honorLabels | bool | true | Specifies if ServiceMonitor endpoints honor labels |
| sealed-secrets.metrics.serviceMonitor.interval | string | "30s" | How frequently to scrape metrics |
| sealed-secrets.metrics.serviceMonitor.metricRelabelings | list | [] | Specifies additional relabeling rules for metrics |
| sealed-secrets.metrics.serviceMonitor.namespace | string | "kube-system" | Namespace where Prometheus Operator is running |
| sealed-secrets.metrics.serviceMonitor.relabelings | list | [] | Specifies general relabeling rules for metrics |
| sealed-secrets.metrics.serviceMonitor.scrapeTimeout | string | "15s" | Timeout after which scrape is ended |
| sealed-secrets.pdb.create | bool | true | Specifies whether a PodDisruptionBudget is created |
| sealed-secrets.pdb.maxUnavailable | int/string | 1 | Maximum number of unavailable pods, mutually exclusive with minAvailable |
| sealed-secrets.pdb.minAvailable | int/string | "" | Minimum number of available pods, mutually exclusive with maxUnavailable |
| sealed-secrets.resources.limits | map | `{"memory":"128Mi"}` | Resource limits for the container |
| sealed-secrets.resources.limits.memory | string | "128Mi" | Memory limit |
| sealed-secrets.resources.requests | map | `{"cpu":"10m","memory":"128Mi"}` | Resource requests for the container |
| sealed-secrets.resources.requests.cpu | string | "10m" | CPU request |
| sealed-secrets.resources.requests.memory | string | "128Mi" | Memory request |

## Command-Line Interface

To encrypt sensitive information prior storing it into a Git repository, install the CLI tool:

```shell
$ brew install kubeseal
```

### Usage

Create a `Secret` resource, locally:

```shell
$ cat > secret.yaml <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
  namespace: my-namespace
type: Opaque
stringData:
  username: admin
  password: mySuperPassword
EOF
```

Encrypt the secret with the CLI tool:

```shell
$ kubeseal -o yaml -f secret.yaml -w sealed-secret.yaml
```

### Sealed Secret

See below the encrypted information, present into generated `SealedSecret` resource.

> [!NOTE]
> The `creationTimestamp` field is updated when the resource is created into cluster. The `null` value is a standard way to indicate that this is a new resource, not yet applied to the Kubernetes cluster.

```yaml
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: my-secret
  namespace: my-namespace
spec:
  encryptedData:
    password: AgB1XhBVwPEfg0NYZ1RJDGLtvHoJ4dtya9ZnsG2+9HwqIOo+aHryoC4PdD9maFrrV6D+CjzrPAlHSIQQEHZcMH5L1ZROHb7WklF5ISb5ne4o0lrYWzjicr72iswj+FcjBrB6tthD0ViFabslDXD+ItcyelfjSnxaSljqJK2BAJvvT+9byFvc8OGXDxueGCSvGnX1m6lPtd/QUN9NGLnwcbsk9Zgx7xTasYVLqaC3qdvLGcEA2g8tfotQuhndzyREec061uTZftXgNfrghlfgjgsgZ7E3tvp3Z+5NS8a+HbA9gJF4ynJd8C0HpLlcy0oKupkMNbqtSJ6n0CyBKn9LCwheKCWcyVCrSifymYuQAQYSSuD8xzqshWM4PIztWskEoOWzdf9nIP5LFLk22WqqSgb6bM5LI/xQM42yVOuYWUkAxMxBXt86WyT3Gv1kgFXU4vLhR6247yhFjADpzbOK6FrkXgGlEAHv1nm4jDvsz4YAWGHlqZ+8feZJAicVoNf3ADLgsR1ja+Cx2IbOqmky8GqSFuGdslvABeST+vQtNFdWwAUZ5j3/J2Y742bKqZQg1Heo1fjqFT+UWbRAEVj94FE+bps8a1A9j9DZ6vyjbDzaQjKH8kQqmPX6DFJCK/zP8dKm/ctgv07d/1PdzMSH0zEKin4vY/FWI+eY51cTrNxrx4HZIvWvpwKzzFYbXye7AwtZiwYLm38GL/kJMJ6p
    username: AgCE68YSC4toy753yT7GEgLZ+GZmxMUJI6Fu9NQTPBijhUyoIi55Bi4hnL3GMoLdM6ydBgYZFXCDQyrenFKT34LfPHLs3GbnAmO6XUgYT+8heBmgecrhlWcEZM/5M8om2EmbCa+GDKQMvF8Exg1wjLZkCftiJBwtQNRgUSduteiyRmv1YDqxKASvKqaHKgPgXnqb9OQ1h60tm4e4w3CXv1XCVcFSiH94WALscds0HobRDto2Y4qMvJujSD2mzVP3tuElBY4ZasF+Sexf0BffgkG7sQ+MOvSmU83kOZof2/B4fh7NhJx1olOCI+ZS8PNV/QSjAfpISX8kWJJ6RwmlWyoInbIbv0Mz+TI2W8V7z4cLNPLcJdnatmqjx4tqbVG518su5HFzZvCbu1rhuxro1WZDgrE/PMJGzB+MjxdapKHGE+99PGFiPjPCnddCAuzXe5+pFDwtho1rbw6tlposmLxKzla6k7GulWiJ7VjFVKjXY/3OpthsocJHwyKqZX1d2+BPuEitbGdeHke8ySevIagJ8oE6t2HBvtrj/CT7qrI43Rqg/j8FAmEgNaiEKIwwc5tRFgAm6YmDxWNgLWmtbnecZLwk+iegEtOPKJCFoeJuBFkorpSvWy+1Nj78ynhlkLESkUIG6DurWzx+BvDTSjquKDv/fvmw+DX/2+MiI8u3A3jBVwpsqN2Y3FIMuVPs73k+UO3MLA==
  template:
    metadata:
      creationTimestamp: null
      name: my-secret
      namespace: my-namespace
    type: Opaque
```
