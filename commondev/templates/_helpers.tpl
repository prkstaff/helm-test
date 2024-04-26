{{- define "commondev.getTagURLforNotificationChannel" -}}
  {{- $tag := .tag -}}
  {{- $url := .url -}}
  {{- $undesiredPrefix := "ci" -}}
  {{- $toTrimOff := "/tag/" -}}
	{{- $releasePage := $url | replace $toTrimOff "" -}}
  {{- if hasPrefix $undesiredPrefix $tag -}}
    {{- printf "%s" $releasePage -}}
  {{- else if regexMatch "^v[0-9].*" $tag -}}
    {{- printf "%s%s" $url $tag -}}
  {{- else -}}
    {{- printf "unexpected tag %s, see releases page %s"  $tag $releasePage -}}
  {{- end -}}
{{- end -}}
