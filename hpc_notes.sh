###################  HPC notes  #####################

  ###########  Imperial  ###########
ssh wfulton@login.hpc.imperial.ac.uk
# login Quickstart
export PS1='[\u@\h:\w]$ '
module load anaconda3/personal
source ~/anaconda3/etc/profile.d/conda.sh
conda activate R413-scRNAseq



    ### File system ###
## .../user/home/
/rds/general/user/wfulton/home  
# 930GB (and up to 10 million files)
# $HOME
# install programs and files you want to keep
# accessible on HPC interactive systems and within batch jobs

## .../user/epheremal/
/rds/general/user/wfulton/ephemeral
# Ephemeral space (same as tmpdir?? at least on login node)
# very large amount of working research data: INTERMEDIARY files that can be deleted
# automatically deleted after 30 days: see TMPDIR below
# accessible on HPC interactive systems and within batch jobs

## TMPDIR
# location changes depending on which node? eg. on login node it is the same as ephemeral?
# best used for jobs that create lots of intermediate files or do random access to files, and so need very fast storage.  There is typically between 10-100GB of space available in TMPDIR.


    ### Modules ###
module list  # currently loaded modules
module avail  # list available modules
module avail python  # search for available modules
module load python/3.5.4  # load specified module, best practice to name version as defaults may change


    ### Conda to manage environment ###
module load anaconda3/personal
# Loads user's conda environments (`anaconda-setup` must be run when loading for the first time)

# see link for channels for package installation:
# https://astrobiomike.github.io/unix/conda-intro#a-note-on-channels
# https://wiki.imperial.ac.uk/display/HPC/R

conda env list
conda create -n py39 python=3.9
source activate ENV_NAME
conda deactivate
conda list  # List all packages and versions installed in active environment
conda search PACKAGENAME
conda install -c conda-forge PACKAGENAME=version --freeze-installed # specify channel eg. bioconda, conda-forge etc., prevents currently installed from being updated but allows an additional version to be installed so dependencies aren't broken
conda clean   # remove unused pacakages and cache
conda config --get channels # see added channels and priority order
conda config --add channels bioconda  # last channel added has highest priority
conda config --add channels defaults  
conda config --add channels conda-forge

# Installing R packages in conda:
# best not to use install_packages() (but check .libpaths to same location as conda env?)
# Additional R packages may be installed from conda-forge; these packages will be prefixed with 'r-'.
conda create r413-scRNAseq r-base=4.1.3 -c conda-forge
conda search "r-*"
conda install r-png -c conda-forge  # for the png R package

    ### Submitting jobs via PBS ###
# Best practices: https://wiki.imperial.ac.uk/display/HPC/General+best+practices

qsub -l walltime=30:25:05 myjob.pbs 

## myjob.pbs


# OPTIONS:
#PBS -l select=N:ncpus=X:mem=Ygb -l walltime=HH:HH:HH
# N is the number of nodes, and 
# X and Y are the number of cpus and amount of memory per node. 
# HH is the expected runtime of the job in hours.


#PBS -l walltime=02:00:00
#PBS -l select=1:ncpus=1:mem=1gb
#PBS -o /rds/general/user/slacalle/home/project1/logs_project1/
#PBS -e /rds/general/user/slacalle/home/project1/logs_project1/

# writabletmp True/False  # look up format - writable to $TMPDIR

# MEDIUM JOB:
Queue	Use cases	No. nodes per job	No. cores per job (ncpus)(gb)	Memory	Walltime (hrs)
medium72	Single-node jobs	1	9 - 256	1 - 920	9 - 72*

# For single cell seq: 4 CPUs, 50gb ? <- from Tiak's 0_initialize.R script 
