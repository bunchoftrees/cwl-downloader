#/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: Downloads files from URL(s)

$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
  DockerRequirement:
    dockerPull: cure/arvados-download
  ShellCommandRequirement: {}

hints:
  arv:RuntimeConstraints:
    outputDirType: keep_output_dir
    keep_cache: 4096
  arv:APIRequirement: {}

inputs:
  filename:
    type: string
    label: name for downloaded file

  url:
    type: string
    label: url to download file from

outputs:
  out1:
    type: File
    label: files generated from download and md5sum
    outputBinding:
      glob: "*"

baseCommand: wget
arguments:
  - "-O"
  - $(inputs.filename)
  - $(inputs.url)
  - shellQuote: false
    valueFrom: "&&"
  - "md5sum"
  - "-b"
  - $(inputs.filename)
  - shellQuote: false
    valueFrom: ">"
  - $(inputs.filename.basename).md5sum
