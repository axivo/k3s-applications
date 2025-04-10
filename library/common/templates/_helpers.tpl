{{/*
Common helper functions for Helm charts
*/}}

{{/* 
Return the domain name
*/}}
{{- define "common.domain" -}}
{{- .Values.global.domain | default "noty.cc" -}}
{{- end -}}

{{/* 
Return cert-manager cluster issuer name
*/}}
{{- define "common.certManager.clusterIssuer" -}}
{{- .Values.global.certManager.clusterIssuer | default "cloudflare-cluster-issuer" -}}
{{- end -}}

{{/* 
Return external-dns provider
*/}}
{{- define "common.externalDns.provider" -}}
{{- .Values.global.externalDns.provider | default "cloudflare" -}}
{{- end -}}

{{/* 
Return ACME server environment
*/}}
{{- define "common.externalDns.acmeServer" -}}
{{- .Values.global.externalDns.acmeServer | default "production" -}}
{{- end -}}
