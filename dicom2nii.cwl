#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

requirements:
  ResourceRequirement:
    ramMin: 4096

inputs:
  Compress:
   type: string
   inputBinding:
      position: 1
      prefix: -z
  OutputName:
   type: string
   inputBinding:
      position: 2
      prefix: -f
  DicomInput:
   type: Directory
   inputBinding:
      position: 4
baseCommand: [ dcm2niix ]

arguments:
  - valueFrom: $(runtime.outdir)
    prefix: -o

outputs:
 processedfile:
  type: File
  outputBinding:
   glob: processed.nii.gz
