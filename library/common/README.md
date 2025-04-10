# common

![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square)  ![Version: 1.0.3](https://img.shields.io/badge/Version-1.0.3-informational?style=flat-square)

Common library used for ArgoCD applications, deployed into AXIVO [K3s Cluster](https://github.com/axivo/k3s-cluster). Review the cluster [documentation](https://axivo.com/k3s-cluster/), for additional details. The library deployment is also compatible with a generic Kubernetes cluster.

### Chart Values

See the chart values, listed below.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.certManager.clusterIssuer | string | "cloudflare-cluster-issuer" | Default cert-manager cluster issuer |
| global.domain | string | "noty.cc" | Primary domain used across applications |
| global.externalDns.acmeServer | string | "production" | ACME server environment, `production` or `staging` |
| global.externalDns.provider | string | "cloudflare" | DNS provider for external-dns |
