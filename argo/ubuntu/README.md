# ubuntu

Ubuntu Server troubleshooting pod for ArgoCD.

## Application Manifest

Example of ArgoCD application manifest, with pod created into `default` namespace:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: ubuntu
spec:
  destination:
    name: ''
    namespace: default
    server: 'https://kubernetes.default.svc'
  source:
    path: argo/ubuntu
    repoURL: 'https://github.com/axivo/k3s-applications.git'
    targetRevision: ubuntu/v1.0.0
    helm:
      valueFiles:
        - values.yaml
  sources: []
  project: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

Example of pod shell login:

```shell
kubectl exec -itn default ubuntu-6589cf5fb4-w5gjx -- bash
```
