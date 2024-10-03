#!/bin/bash
#### This recipe is to install deepMD package, lammps and plumed including libtorch for the use of deepCVs
# Soaked with the tears of Enrico Trizio - IIT


# this requires some compilations here aand there, if you are on a cluster try to get an interactive job to do that!!!


# create a new conda env
conda create -n deepmd_plumed_libtorch
conda activate deepmd_plumed_libtorch

# Install DeepMD stuff
conda install deepmd-kit=2.1.5=*gpu libdeepmd=2.1.5=*gpu lammps cudatoolkit=11.6 horovod -c https://conda.deepmodeling.com -c defaults

# Install conda-build
# It may be that the python version if you switch the order, this way should be OK
conda install conda-build

# Build the package
conda build . -c deepmodeling &> log &
# to see the output of the conda-build in real time
tail -f log

# Update the plumed package
conda update /path/to/conda-built/package
# The path to the package can be found at the end of the log file!
# LOOK FOR SOMETHING LIKE:
	# To have conda build upload to anaconda.org automatically, use
	# anaconda upload \
		# /path/to/miniconda3/envs/deepmd_plumed_libtorch/conda-bld/linux-64/plumed-2.9.0-h4ecb923_1.tar.bz2		<--- THIS IS THE PACKAGE !


##### BASIC TESTS
# try 
plumed -h 
plumed config has libtorch --> exp: libtorch on
plumed config module pytorch  --> exp: pytorch on


# hope for the best :))

# SHOULD BE SOLVED BUT...
# in case some libs are missing you can copy them by hand from the build folders
# they are /path/to/conda/env/conda-bld/plumed-something/_h_temp_placeholder_placeholder_pla.../lib
