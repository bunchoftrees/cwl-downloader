$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"
cwlVersion: v1.0
class: CommandLineTool
label: Creates BED file from filtered VCF (bedtools merge)
requirements:
  DockerRequirement:
    dockerPull: arvados/l7g/sgdp
  ResourceRequirement:
    ramMin: 12000
    tmpdirMin: 500000
  ShellCommandRequirement: {}
inputs:
  filteredvcf:
    type: File
    label: Input VCF file
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
  bed:
    type: File
    label: Extracted BED
    outputBinding:
      glob: "*.bed"
baseCommand: [gunzip]
arguments:
  - "-c"
  - $(inputs.filteredvcf)
  - shellQuote: false
    valueFrom: "|"
  - "bedtools"
  - "merge"
  - shellQuote: false
    valueFrom: ">"
  - $(inputs.filteredvcf.nameroot).bed
