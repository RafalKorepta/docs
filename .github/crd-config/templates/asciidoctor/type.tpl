{{- define "type" -}}
{{- $type := . -}}
{{- if asciidocShouldRenderType $type -}}

[id="{{ asciidocTypeID $type | asciidocRenderAnchorID }}"]
==== {{ $type.Name  }} {{ if $type.IsAlias }}({{ asciidocRenderTypeLink $type.UnderlyingType  }}) {{ end }}

{{ $type.Doc }}

{{ if eq $type.Name "RedpandaClusterSpec" }}
These fields are used to configure the Redpanda Helm chart. For descriptions and default values, see xref:redpanda-helm-spec.adoc[].
{{ end }}

{{ if $type.References -}}
.Appears In:
****
{{- range $type.SortedReferences }}
- {{ asciidocRenderTypeLink . }}
{{- end }}
****
{{- end }}

{{ if $type.Members -}}
[cols="25a,75a", options="header"]
|===
| Field | Description
{{ if $type.GVK -}}
| *`apiVersion`* __string__ | `{{ $type.GVK.Group }}/{{ $type.GVK.Version }}`
| *`kind`* __string__ | `{{ $type.GVK.Kind }}`
{{ end -}}

{{ range $type.Members -}}
| *`{{ .Name  }}`* __{{ asciidocRenderType .Type }}__ | {{ template "type_members" . }}
{{ end -}}
|===
{{ end -}}

{{- end -}}
{{- end -}}
