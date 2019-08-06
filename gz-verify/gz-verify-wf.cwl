$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"
cwlVersion: v1.0
class: Workflow
label: Test file integrity of gzip compressed files
requirements:
  - class: DockerRequirement
    dockerPull: lcurii/arvados-download
  - class: ResourceRequirement
    coresMin: 1
    ramMin: 12000
  - class: ScatterFeatureRequirement
inputs:
  gzip-dir:
    type: Directory
    label: Directory containing compressed VCF, md5sum, and index files for processing
outputs:
  validate:
    type: File[]
    label: Directory containing .vld (validate status) files
    outputSource: gz-validate/validate
steps:
  get-gzip:
    run: get-gzip.cwl
    in:
      gzip-dir: gzip-dir
    out: [gzips, filenames]
  gz-validate:
    run: gz-validate.cwl
    scatter: [zipped, filename]
    scatterMethod: dotproduct
    in:
      zipped: get-gzip/gzips
      filename: get-gzip/filenames
    out: [validate]
