# AXIVO Helm Charts

<img align="right" style="padding: 0 50px;" width="350" height="350" src="https://raw.githubusercontent.com/axivo/k3s-applications/main/docs/images/logo-services.svg" alt="AXIVO Kubernetes Applications Logo" />

[![Helm](https://img.shields.io/badge/helm-v3-blue)](https://helm.sh)
[![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=flat&logo=kubernetes&logoColor=white)](https://kubernetes.io)
[![License](https://img.shields.io/github/license/axivo/k3s-applications)](https://github.com/axivo/k3s-applications/blob/main/LICENSE)

This Helm repository contains charts designed for deploying applications in Kubernetes clusters using ArgoCD. The charts follow best practices for Kubernetes deployments and include proper documentation and schema validation.

### Repository Usage

To add this repository to your Helm configuration, run:

```shell
helm repo add axivo https://axivo.github.io/charts
helm repo update
```

### Documentation

For detailed documentation about each chart, visit our [GitHub repository](https://github.com/axivo/k3s-applications).

### Available Charts

| Chart | Version | Description |
|-------|---------|-------------|
| `common` | 1.0.2 | Common library for Helm charts |

### License

This project is licensed under the [BSD 3-Clause License](https://github.com/axivo/k3s-applications/blob/main/LICENSE).
