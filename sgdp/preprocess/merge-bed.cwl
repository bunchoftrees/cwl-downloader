$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"
cwlVersion: v1.0
class: CommandLineTool
label: Merge spanning features
requirements:
  DockerRequirement:
    dockerPull: arvados/l7g/sgdp
  ResourceRequirement:
    ramMin: 12000
    tmpdirMin: 500000
  ShellCommandRequirement: {}
inputs:
  bed:
    type: File
    label: Input bed file
    # secondaryFiles: [.tbi]
  #gqcutoff:
    #type: int
    #label: Filtering GQ cutoff threshold  
  #qualcutoff:
    #type: int
    #label: Filtering QUAL cutoff threshold
  #script:
    #type: File
    #label: Script to extract BED from VCFs
outputs:
  # vcf:
    # type: File
    # label: Filtered VCF
    # outputBinding:
      # glob: "*.vcf.gz"
    # secondaryFiles: [.tbi]
  mergedbed:
    type: File
    label: Extracted BED
    outputBinding:
      glob: "*.bed"
baseCommand: [bedtools]
arguments:
  - "merge"
  - "-i"
  - $(inputs.bed)
  - shellQuote: false
    valueFrom: ">"
  - $(inputs.bed.nameroot)merged.bed

  
