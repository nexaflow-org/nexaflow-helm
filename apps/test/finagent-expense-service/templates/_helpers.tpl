{{- define "finagent-expense-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finagent-expense-service.fullname" -}}
{{- default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finagent-expense-service.labels" -}}
app.kubernetes.io/name: {{ include "finagent-expense-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: expense
app.kubernetes.io/part-of: finagent
{{- end -}}

{{- define "finagent-expense-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "finagent-expense-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
