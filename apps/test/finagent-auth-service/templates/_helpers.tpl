{{- define "finagent-auth-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finagent-auth-service.fullname" -}}
{{- default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finagent-auth-service.labels" -}}
app.kubernetes.io/name: {{ include "finagent-auth-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: auth
app.kubernetes.io/part-of: finagent
{{- end -}}

{{- define "finagent-auth-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "finagent-auth-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
