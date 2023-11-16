#!/bin/bash

# quick hints: https://devhints.io/bash
# full manual: https://www.gnu.org/software/bash/manual/bash.html#Command-Substitution
# bash terminal shortcuts: https://www.makeuseof.com/linux-bash-terminal-shortcuts/

   #################### Customising bash environment #################
# Which file to edit (.bashprofile or bashrc?) see links:
# https://www.maths.cam.ac.uk/computing/linux/bash/adding
# https://unix.stackexchange.com/questions/38175/difference-between-login-shell-and-non-login-shell

### Set prompt ###
# https://www.unix.com/hp-ux/173508-unable-set-prompt-current-working-dir.html
# https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
# https://bash.cyberciti.biz/guide/.bash_profile
export $PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$' 
export PS1='[\u@\h:\w]$ '  # hpc

   #################### Bash and directory notes ######################

Generic form: COMMAND [OPTION] [somethinghaha]

## help commands ##
man command #gives user manual for command
# press h in man page to see commands to move around man page
command --help #lists options
    q # to quit file view of man/help page
apropos searchterm #search for a command or term in description of a command


    #### regular expressions (REGEX) and operators ####

^  # beginning of string
$  # end of string
+  # more of the same, any number of such characters
# eg: ^[A-Z]+$  would be any string containing only capital characters eg. "ADHEHCDE", but not "ADCFHEfDGE"

# opertators return 0 for a match between left and right of the operator and a 1 for a mismatch 
# difference between == and =~  ?

<  # stin
>  # stout
2>  # sterr  (standard error
&>  # stout and sterr


    #### system and file navigation ####
    
cat /etc/os-release  # shows linux version info.

df -H --total  #shows free disk space. -H for human readable.
top  # see CPU usage

ls #list content of directory
ls -lha # list long version of content eg. size, date modified, permissions, human readable
ls -1 #forces output to be on one line
ls --ignore=PATTERN # ignores matches with PATTERN
ls -1 | wc -l 
ls | head
ls | sort 
ls -lh | sort -k 5nr  # sorts -k is key (column) 5 (in this case file size), by number, in reverse order 

ls *jpg > imagefiles #lists names of .jpg files into new file imagefiles
ls *gif >> imagefiles #appends names of .gif files to imagefiles (instead of overwriting

   
cd directorypath #change directory. 
cd ~ or cd # cd to /home/thomas
~  # is home/thomas (user?) directory
/  #root directory
*  #represents any number of any characters including nothing
?  #represents any single character
ls  #list folders/files in a directory
ls -lht  # -l long: shows permisstions and time of last modification and size, -h human readable, -t sorts by recently modified
du -ch  # see total space inside directory. -c total -h human readable
mkdir dirname  #make directory
mkdir -p parentdir/parent2dir/dirname/  # make parent directories as well (if no errors)
rmdir dirname or rm -d  #remove empty directory
rm -r  #remove directory can contain files
rm filename  #delete file
touch filename  # makes empty file
mv oldfile.txt newfile.txt  # moves/cuts the file and pastes and renames it 
mv /path/to/source/dir/{file1,file2,*.ext1,*.ext2} /path/to/destination/
mv file1 file2 file3 -t DESTINATION
# Find command 
# (https://unix.stackexchange.com/questions/493808/commands-differences-using-quotations-find)
# (https://www.cyberciti.biz/faq/find-command-exclude-ignore-files/)
find ~ -name "filename.txt"  # find file in ~ (home) dir
find ~ -name "filename.txt" -delete  # find file in ~ (home) dir
find . -wholename "*somedirna*.html"  # use multiple globs to look through directories
find . -wholename './SRR*.fastq' | parallel -jobs 8 "gzip -r {}"  # if no glob at beginning: ./
find ~/ -perm 777  #find <Directory> ~perm <Permissions>

# Parallel
# Don't need to specify no. jobs - parallel detects automatically ncores*nthreads I think
# use `top` to see _id (percent cpu idle), and increase or decrease njobs if needed
cat samplelist.txt | parallel somecommand {}

# Permissions
chmod +rwx filename  # change permissions: add read write execute permissions to file/directory
chmod -wx filname  # remove write and execute permissions
groups  # see groups you are a member of
getent group developers  # get members of a group
# http://www.yolinux.com/TUTORIALS/LinuxTutorialManagingGroups.html <- group permissions etc
chmod -R +r dirname  # recursively change permissions in directory
chmod -R g=u  dirname  # recurively set the permission of the group for a dir to those of the user
   +s  # setuid: a bit that makes an executable run with the privileges of the owner of the file.
cp file.txt filcopy.txt  #copy file newfile
cp -r dir /new/location/dircopy  #copy directories

## Extracting and compressing files: (see https://www.nexcess.net/help/how-to-decompress-files-in-gzip/)
# .zip
zip -r ARCHIVE_NAME  # compress into zip format <- universally used across OS systems
zip ARCHIVE_NAME.zip  # extract
# .tar.gz
tar -zcvf filename.tar.gz directory
        # read table of contents (-t) for a archive file. 
    -c  # compress
    -x  # extract 
    -z  # tell tar .gzip file
    -f  # is `--file filename`  # needs filename.
    -v  # --verbose
tar -zxvf filename.tar.gz # extract compressed dir 
tar -zxvf filename.tar.gz -C tmp/ # to tmp/dir/files* 
# .gz
gzip  
gunzip

file filename.gif  #prints file type eg. in this case GIF image data bla bla


touch file1.txt  # creates empty file file1.txt

cat file1  #prints file1 in terminal
less file1  #prints some of the file?
head -n5 file1  #prints first five lines of a file. Default is ten lines

cat file1.txt  # creates file1. Write text. ctrl + D to save and exit
cat file1 > file2  # copies content of file1 into file2. Overwrites/creates file2
cat file1 >> file2  #appends contents of file1 into file2
wc  # word count
wc -l  # number of lines


sort file1.txt  # sorts file1 alphebetically. CAPITALS before lowercase. prints in terminal


  ## Manipulating files and strings ##

# See https://stackoverflow.com/questions/19482123/extract-part-of-a-string-using-bash-cut-split !!!
grep [OPTION] searchterm [FILE]  # searches line by line for term. Puts into standard output.
grep -v  # inverts output ie. lines without search term into standard output 
grep '*>' file  # allows to search for characters that might be interpreted by bash as something else - see Scripting section.
grep -e ^I file  #extracts lines that start with I. ^ beginning of line, $ end of line

tr -s " " #Translate. Replaces multiple spaces with one space (--sqeeze-repeats)
tr -d " " #deletes spaces
tr # SEE man tr it's really cool

cut -d " " -f 2 #cuts the second field of each line, with fields defined using the delimiter " ".
cut -d, -f-4,6-10,12-  # cut fields 5 and 11 with "," delim - alternate phrasing(mutliple certain fields at once)

expr 38-26 #allows sums

sed 's/string/replacement' filename.txt  # s = substitution. / is the delimiter. Default behaviour is to replace first occurence in a line 
sed 's/string/replacement/g' filename.txt  # /g is global - replaces all occurences
sed -i 's!string!replacement!g' filename.txt  # edit file in place
# sed will NOT match end of line \n

awk  # https://www.geeksforgeeks.org/awk-command-unixlinux-examples/


echo -e  # enable interpretation of backslashes
echo -n  # don't show trailing newline


wget <url>  # download from link
curl <url>  # curl is more powerful, -l 


    #### Scripting ####
    
#!/bin/bash  ## universally at the start of a BASH script - indicates it's a BASH script
#command;
#command;
#command;
done



# to run a BASH script:  (NOTE: The file does not have to be executable when calling bash interpreter `chmod +x script_name`)
bash script_name
# or 
./script_name
# or 
.script_name  # tells bash to execute commands in file


  ## Shell variables ##
  
# Like variables in other programs, except doesn't discriminate between strings and numbers etc.
variable1=1
variable2=two
#  ^ both are valid
# IMPORTANT: variables must be assigned WITHOUT SPACES

# Access variables with the dollar sign. eg: (for some inbuilt shell variables)
$PATH  
# Add dir to path temporarily (edit ~/.bashrc to make permanent for user)
export PATH="$HOME/bin/cellranger-7.1.0:$PATH"

$PS1  # The command prompt in the shell eg. thomas@wolf: ~$

# POSITIONAL variables cannot be assigned by user and correspond to the arguments passed when running the script eg. `
./my_script --parameter  parameter2 # --parameter is $1, parameter2 is $2

$#  # Stores the number of command-line arguments that were passed to the shell program.
$?  # Stores the exit value of the last command that was executed.
$0  # Stores the first word of the entered command (the name of the shell program).
$*  # Stores all the arguments that were entered on the command line ($1 $2 ...).
"$@"  # Stores all the arguments that were entered on the command line, individually quoted ("$1" "$2" ...). 

# put positional variables/arguments into an array using brackets.
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]}
echo $@

readarray myarray < list.txt
for i in "${myarray[@]}"
do
echo "$i"
# or do whatever with individual element of the array
done

# user input
read word word2 # script prompts user for input, which is put into variable word
echo word word2  # spaces define the end of the first word

# read command now stores a reply into the default build-in variable $REPLY
read
echo "You said $REPLY"

# read -a puts responses into an array
read -a array
echo ${array[0]} ${array[1]}


# A whole script runs multiple commands. A semicolon `;` is used after each command to run the next one if it is on the same line eg.
echo "This is a scipt"; echo "with more than one command on the same line"
echo "semi-colons aren't needed if newline"

# The && operator is used as a boolian and a continuation command ie. if the command on the left is a non-zero exit code(??-true?), then the next command will be ran.

  ## hiding special characters ##

greeting="Hello There"  # only hides whitespace from the shell
greeting="Hello there $username"  # only whitespace is hidden - variable $username would be substituted 
greeting='Hello There $username'  # "$" would be hidden: all special characters in the string are hidden. echo $greeting would print Hello There $username
greeting=Hello\ There\ $username  # "\" hides the single character after it.

  ## conditionals
if test -f "./example_file.txt"; then
echo "example_file.txt exists"
elif [[$(wc -l example_file.txt) -eq 0]]; then


# command substitution
files=$(ls) 
files=`ls`  # back quotes set the variable as the output of the command

# parameter expansion with curly braces:
uservariable=$user
username2=${user}\ is\ the\ name  # strings which are not part of the variable name follow the variable so curly braces are necessary



## EXAMPLE ##
#!/bin/bash

# This bash script is used to backup a user's home directory to /tmp/.

user=$(whoami)
input=/home/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

tar -czf $output $input
echo "Backup of $input completed! Details about the output backup file:"
ls -l $output


############  Install packages  ##################

# download .deb file
sudo apt install package.deb


   #### Virtual environments ####

##### Conda / MAMBA #####

### MAMBA INSTEAD WHERE POSSIBLE ### 
# Installation and useful commands: https://mamba.readthedocs.io/en/latest/user_guide/mamba.html
# Update conda while using mamba:
conda update --prefix /home/wfulton/mambaforge anaconda
# Mamba specific commands:
mamba repoquery search "xtensor>=0.18" # 


# Create envionment IN A SPECIFIC DIRECTORY (like venv)
conda create --prefix /full/path/to/conda_env_name  # " conda config --set env_prompt '({name}) ' " alters .condarc so only env name not full path is displayed when activated.
# use ./conda_env_name when creating or activating

# (Create environment normally - saved into conda envs dir I think) - make sure base is activated first
conda create --name py35 python=3.5  # specifies python version

# Activate environment
source activate py35
# Deactivate 
source deactivate

# create environment file to make it easier to recreate a conda environment (like a venv requirements.txt)
conda env export --file environment.yml

# List environments
conda info --envs
# List packages and version
conda list
# List changes to packages and version
conda list --revisions
# Save environment to text file
conda list --explicit > conda_env.txt

## Channels ##
# The Anaconda default channels are incompatible with conda-forge??
conda install -c conda-forge PACKAGENAME=version --freeze-installed # specify channel eg. bioconda, conda-forge etc. Freeze prevents currently installed from being updated but allows an additional version to be installed so dependencies aren't broken
conda install r-dplyr r-seurat bioconductor-PACKAGENAME  # search conda website for conda compatible version of R packages. Use conda packages where possible

conda config --get channels  # get channels. See .condarc.  Channel priority: strict to speed up, flexible to avoid dependancy clashes


conda clean   # remove unused pacakages and cache



##### Venv #####
cd ~/GitRepos/practical_1
python3 -m venv env  # create new environment "env"
source ./env/bin/activate  # activate environment
pip install matplotlib  # installs matplotlib into virtual environment
pip install numpy
pip freeze > requirements.txt  # put only additional packages and their dependencies installed within the virtual environment into the requirements.txt file in the right format, because the virtual environment is activated
deactivate  # exit environment



#################### Terminal #######################
alt+arrow keys skip words
7 on num pad to move to beginning of line
1 to move to the end
Ctrl + W  # delete previous word

Ctrl + Shift + F  # Find
Alt + B  # Move one word backward
Alt + F  # Move one word forward
Ctrl + B  # Move one letter forward
Ctrl + F  # Move one letter back
Ctrl + K  # Delete the word/line AFTER the cursor
Ctrl + U  # Delete line/word BEFORE cursor

Ctrl + P  # Previous command (like up arrow)
Ctrl + N  # Next command (like down arrow)


##### Killing a process in linux #####
# Explore processes
top
# get Process id
pidof rsession
# Kill (allowing process to end gracefully)
kill -15 THE_PID_OF_PROCESS1 THE_PID_OF_PROCESS2 ...
# Kill (Brute force - try -15 first)
kill -9 THE_PID_OF_PROCESS1 THE_PID_OF_PROCESS2 ...

