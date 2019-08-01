#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
label: Downloads files from URL(s)

$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
  - class: DockerRequirement
    dockerPull: curii/arvados-download
  - class: ScatterFeatureRequirement

hints:
  arv:RuntimeConstraints:
    outputDirType: keep_output_dir
  arv:ReuseRequirement:
    enableReuse: false
  arv:IntermediateOutput:
    outputTTL: 86400

inputs:
  fn_list:
    type: string[]
  url_list:
    type: string[]

outputs:
  out1:
    type: Directory
    label: container with downloaded files
    outputBinding:
      glob: "*"
    outputSource: download-urls/out1

steps:
  #get-inputs:
    #run: get-inputs.cwl
    #in:
      #url_list: url_list
      #fn_list: fn_list

    #out: [urls, filenames]

  download-urls:
    run: download-urls.cwl
    scatter: [url, filename]
    scatterMethod: dotproduct
    in:
      url: url_list
      filename: fn_list
    out: [out1]
