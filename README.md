[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.708-blue.svg)](https://doi.org/10.25663/brainlife.app.708)

# app-tractometry-after-tractseg
This App compute tractometry on the TractSeg output. For each tract available from the segmentation, the App computes the tract profile using 
the values of the tensor, specifically FA, MD, RD, and AD.

### Authors
- Giulia Berto

### Funding Acknowledgement
brainlife.io is publicly funded and for the sustainability of the project it is helpful to Acknowledge the use of the platform. We kindly ask that you acknowledge the funding below in your publications and code reusing this code.

[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Citations
We kindly ask that you cite the following articles when publishing papers and code using this code. 

1. Wasserthal, J., Neher, P., & Maier-Hein, K. H. (2018). TractSeg-Fast and accurate white matter tract segmentation. NeuroImage, 183, 239-253. [https://doi.org/10.1016/j.neuroimage.2018.07.070](https://doi.org/10.1016/j.neuroimage.2018.07.070)

2. Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). [https://doi.org/10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

#### MIT Copyright (c) 2022 brainlife.io The University of Texas at Austin


## Running the App 

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/bl.app.708](https://doi.org/10.25663/bl.app.708) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
    "endings_segmentations": "./input/endings_segmentations",
    "TOM_trackings": "./input/TOM_trackings",
    "fa": "./input/fa.nii.gz",
    "md": "./input/md.nii.gz",
    "rd": "./input/rd.nii.gz",
    "ad": "./input/ad.nii.gz",
}
```

3. Launch the App by executing `main`

```bash
./main
```

## Input

* tractseg output
* tensor folder, containing the following images: fa.nii.gz, md.nii.gz, rd.nii.gz, and ad.nii.gz

## Output

* 4 .csv files with tractometry results, one per each tensor image

### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run.

#### MIT Copyright (c) 2022 brainlife.io The University of Texas at Austin
