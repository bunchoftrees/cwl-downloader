# Download to Arvados

## Info

Bash script can be depricated by updating the CWL step to use command line args

### How to run

Run on Arvados node:

   ``` bash
   arvados-cwl-runner --api=containers --no-wait --project-uuid su92l-j7d0g-564z7zxkttp3vih download-wf.cwl yml/source.yml
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
