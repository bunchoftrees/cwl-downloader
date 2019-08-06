$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"
cwlVersion: v1.0
class: CommandLineTool
label: Test file integrity of gzip compressed files
requirements:
  DockerRequirement:
    dockerPull: curii/arvados-download
  ShellCommandRequirement: {}
  StepInputExpressionRequirement: {}
hints:
  arv:RuntimeConstraints:
    keep_cache: 4096
  arv:APIRequirement: {}
inputs:
  zipped:
    type: string
    label: name for downloaded file
  filename:
    type: string
    label: url to download file from
outputs:
  validate:
    type: File
    label: Compressed vcf and index file
    outputBinding:
      glob: "*.vfy"
baseCommand: gzip
arguments:
  - "-tv"
  - $(inputs.zipped)
  - shellQuote: false
    valueFrom: "&>"
  - $(inputs.filename).vfy
