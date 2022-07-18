#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

inputs:
  compress-file-parameter: string
  output-name: string
  dicom-input-folder: Directory


steps:
  run_dicom2nii:
    run: dicom2nii.cwl
    in:
      Compress: compress-file-parameter
      OutputName: output-name
      DicomInput: dicom-input-folder

    out:
     - processedfile


outputs:
 nifti:
  type: File
  outputSource: run_dicom2nii/processedfile
