{{- define "finagent-insights-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finagent-insights-service.fullname" -}}
{{- default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finagent-insights-service.labels" -}}
app.kubernetes.io/name: {{ include "finagent-insights-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: insights
app.kubernetes.io/part-of: finagent
{{- end -}}

{{- define "finagent-insights-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "finagent-insights-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
