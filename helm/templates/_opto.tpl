{{/*
Define the IAM role name we'll use
*/}}
{{- define "opto.role-name" -}}
{{- printf "%s-%s" .Values.opto.scope .Chart.Name -}}
{{- end }}
{{/*
Calculate the role ARN 
*/}}
{{- define "opto.role-arn" -}}
{{- include "opto.role-name" . | printf "arn:aws:iam::%s:role/%s" .Values.aws.account_id -}}
{{- end }}
