# Download SGDP to Arvados

## Info

Simons Genome Diversity Project data is primarily hosted on Seven Bridges Cancer Cloud, and because of how the download URLs are constructed, they posed a number of problems with accessing and downloading.

To mediate the downloading, constructing a pipeline that includes `wget -O [filename] [url in single-quotes] && md5sum -b [filename] > [filename].md5sum` required additional scripting to form arrays for scattering over pairs of filenames and URLs.

### How to run

Run on Arvados node:

   ``` bash
   arvados-cwl-runner --api=containers --no-wait --project-uuid su92l-some-projectuuid download-wf.cwl yml/manifest.yml
   ```

## Extras  

for paired fastq's:

   ``` bash
   cwl-runner --local downloadPaired.cwl --bashScript downloadPaired.sh --urlFile 2-paired.txt
   ```

   ``` bash
   cwl-runner --debug downloadPaired.cwl --bashScript downloadPaired.sh --urlFile 2-paired.txt
   ```

for md5sum'ing:

   ``` bash
   cwl-runner --local md5sum.cwl md5sum.yml
   ```
