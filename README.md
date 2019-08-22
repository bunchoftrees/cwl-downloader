# CWLWERX - A tidy collection of CWL Workflows

## Info

This repository is a growing collection of workflows written in [Common Workflow Language](https://www.commonwl.org/), various command-line tools, and Dockerfiles for use specifically on [Arvados](https://arvados.org). The purpose of this collection is to dually highlight one style of writing CWL, but also to showcase many of the various tasks CWL can help bioinformaticians to accomplish. In the future, a README will be included in every workflow directory. 

## Contents

* sgdp - CWL specific to the [Simons Genome Diversity Project](https://www.simonsfoundation.org/simons-genome-diversity-project/)
* dockerconts - Dockerfiles for various workflows
* experimental - Experimental scripts, workflows, and tool development

## Developer Notes

This repository also will include helpful scripts and command-line tools to complete filtering tasks. These tools are largely experimental and should be used with caution. This repository will change structure frequently.

Go applications are written with go1.11 unless otherwise specified.

Additionally, much of the Python included in this repository is reliant on Python 3.5 or above, unless specified in the README within the subdirectory. Most Python scripts include the following libraries:

* [pandas](https://pandas.pydata.org/)
* [arvados](https://arvados.org/)

Care is being given to atribute other's work to their creators, though this effort is currently not complete.
