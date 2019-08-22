$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"
cwlVersion: v1.0
class: CommandLineTool
label: Creates BED file from filtered VCF
requirements:
  DockerRequirement:
    dockerPull: arvados/l7g
  ResourceRequirement:
    ramMin: 12000
  ShellCommandRequirement: {}
inputs:
  filteredvcf:
    type: File
    label: Input VCF file
    # secondaryFiles: [.tbi]
  gqcutoff:
    type: int
    label: Filtering GQ cutoff threshold  
  qualcutoff:
    type: int
    label: Filtering QUAL cutoff threshold
  script:
    type: File
    label: Script to extract BED from VCFs
outputs:
  filteredvcf:
    type: File
    label: Filtered VCF
    outputBinding:
      glob: "*.vcf.gz"
    # secondaryFiles: [.tbi]
  bed:
    type: File
    label: Extracted BED
    outputBinding:
      glob: "*.bed"
baseCommand: [python]
arguments:
  - $(inputs.script)
  - "--min_GQ"
  - $(inputs.gqcutoff)
  - "--min_QUAL"
  - $(inputs.qualcutoff)
  - $(inputs.filteredvcf)
  - shellQuote: false
    valueFrom: ">"
  - $(inputs.filteredvcf.nameroot).bed
