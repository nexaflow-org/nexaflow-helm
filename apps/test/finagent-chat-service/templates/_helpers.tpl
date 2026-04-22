{{- define "finagent-chat-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finagent-chat-service.fullname" -}}
{{- default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finagent-chat-service.labels" -}}
app.kubernetes.io/name: {{ include "finagent-chat-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: chat
app.kubernetes.io/part-of: finagent
{{- end -}}

{{- define "finagent-chat-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "finagent-chat-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
