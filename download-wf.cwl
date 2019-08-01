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
    type: File
    label: script handling curl and md5
  
  url_list:
    type: File
    label: list of URLs to download from

outputs:
  urls:
    type: string[]
  filenames:
    type: string[]
steps:
  get-inputs:
    run: get-inputs.cwl
    in:
      url_list: url_list
      fn_list: fn_list

    out: [urls, filenames]

  #downloadUrl:
    #run: download-urls.cwl
    #scatter: [url]
    #scatterMethod: dotproduct
    #in:
      #bashScript: bashScript
      #url: get-urls/urls
    #out: [out1]
