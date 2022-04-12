{{/*
Expand the name of the chart.
*/}}
{{- define "base-deployment.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "base-deployment.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Labels for everything
*/}}
{{- define "base-deployment.labels" -}}
helm.sh/chart: {{ include "base-deployment.chart" . }}
app.kubernetes.io/name: {{ include "base-deployment.name" . }}
app: {{ include "base-deployment.name" . }}
{{- end }}

{{/*Pod labels*/}}
{{- define "base-deployment.podLabels" -}}
app: {{ include "base-deployment.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "base-deployment.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "base-deployment.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
