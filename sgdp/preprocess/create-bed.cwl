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
inputs:
  vcf:
    type: File
    label: Input VCF file
    # secondaryFiles: [.tbi]
  gqcutoff:
    type: int
    label: Filtering GQ cutoff threshold  
  qualcutoff:
    type: int
    label: Filtering QUAL cutoff threshold
outputs:
  filteredvcf:
    type: File
    label: Filtered VCF
    outputBinding:
      glob: "*vcf.gz"
    secondaryFiles: [.tbi]
baseCommand: [bcftools, view]
arguments:
  - "-Oz"
  - "-e"
  - shellQuote: true
    valueFrom: FMT/GQ<$(inputs.gqcutoff) | QUAL<$(inputs.qualcutoff) | QUAL='.'
  - "-o"
  - $(inputs.vcf.nameroot).gz
  - $(inputs.vcf)
