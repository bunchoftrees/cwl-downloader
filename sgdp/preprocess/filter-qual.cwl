$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"
cwlVersion: v1.0
class: CommandLineTool
label: Filters SGDP VCFs by a specified quality cutoff
requirements:
  DockerRequirement:
    dockerPull: arvados/l7g
  ResourceRequirement:
    coresMin: 2
    ramMin: 13000
  ShellCommandRequirement: {}
inputs:
  vcf:
    type: File
    label: Input gVCF file
    secondaryFiles: [.tbi]?
  qualcutoff:
    type: int?
    label: Filtering cutoff threshold
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
  - "-i"
  - shellQuote: false
    valueFrom: "QUAL>"$(inputs.qualcutoff)
  - $(inputs.vcf)
  - shellQuote: false
    valueFrom: ">"
  - $(inputs.vcf.nameroot).gz
