$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"
cwlVersion: v1.0
class: Workflow
label: (workflow) Test file integrity of gzip compressed files
requirements:
  - class: DockerRequirement
    dockerPull: arvados/l7g
  - class: ResourceRequirement
    coresMin: 1
    ramMin: 12000
  - class: ScatterFeatureRequirement
inputs:
  dir:
    type: Directory
    label: Directory containing Simons Genomic Diversity Poject files for processing
outputs:
  result:
    type: File[]
    label: Directory containing .vld (validate status) files
    outputSource: gz-validate/validated
steps:
  get-vcfs:
    run: get-vcfs.cwl
    in:
      dir: dir
    out: [vcfs, tbis]
  filter-vcf:
    run: fliter-vcf.cwl
    scatter: [vcf, tbi]
    scatterMethod: dotproduct
    in:
      vcf: get-vcfs/vcfs
      tbi: get-vcfs/tbis
    out: [fliteredvcf]
  create-bed-index:
    run: create-bed-index.cwl
    scatter: [fliteredvcf]
