{{- define "finagent-frontend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finagent-frontend.fullname" -}}
{{- default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finagent-frontend.labels" -}}
app.kubernetes.io/name: {{ include "finagent-frontend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: frontend
app.kubernetes.io/part-of: finagent
{{- end -}}

{{- define "finagent-frontend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "finagent-frontend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
