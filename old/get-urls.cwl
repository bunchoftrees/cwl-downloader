#/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: Downloads files from URL(s)

$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
  - class: DockerRequirement
    dockerPull: cure/arvados-download
  - class: ShellCommandRequirement: {}

inputs:
  script:
    type: File
    label: script to get urls and arrays from list
  url_listing:
    type: File
    label: List of URLs from Cancer Cloud

outputs:
  urls:
    type: string[]
    label: URLs wrapped in double quotes
  filenames:
    type: string[]
    label: extracted filenames from URLs

baseCommand: python3
arguments:
  - $(inputs.script)
  - shellQuote: false
    valueFrom: "<"
  - $(inputs.url_listing)