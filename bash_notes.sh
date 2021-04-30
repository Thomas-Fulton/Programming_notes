!# /bin/bash
   #################### Bash and directory notes ######################

Generic form: COMMAND [OPTION] [somethinghaha]

## help commands ##
man command #gives user manual for command
command --help #lists options
    q # to quit file view of man/help page
apropos searchterm #search for a command or term in description of a command


    #### regular expressions and operators ####

^  # beginning of string
$  # end of string
+  # more of the same, any number of such characters
# eg: ^[A-Z]+$  would be any string containing only capital characters eg. "ADHEHCDE", but not "ADCFHEfDGE"

# opertators return 0 for a match between left and right of the operator and a 1 for a mismatch 
# difference between == and =~  ?



    #### file navigation ####
    
df -H --total #shows free disk space. -H for human readable.
ls #list content of directory
ls -lh # list long version of content eg. size, date modified, permissions
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
~  # is home/thomas directory
/  #root directory
*  #represents any number of any characters including nothing
?  #represents any single character
ls  #list folders/files in a directory
ls -lht  # -l long: shows permisstions and time of last modification and size, -h human readable, -t sorts by recently modified
mkdir dirname  #make directory
rmdir dirname or rm -d  #remove empty directory
rm -r  #remove directory can contain files
rm filename  #delete file
touch filename  # makes empty file
mv oldfile.txt newfile.txt  # moves/cuts the file and pastes and renames it 
chmod +rwx filename  # change permissions: add read write execute permissions to file/directory
chmod -wx filname  # remove write and execute permissions
cp file.txt filcopy.txt  #copy file newfile
cp -r dir /new/location/dircopy  #copy directories

zip -r ARCHIVE_NAME  # compress into zip format <- universally used across OS systems
zip ARCHIVE_NAME.zip  # extract

tar -zcvf filename.tar.gz  # read table of contents (-t) for a archive file. 
    -c  # compress
    -x  # extract 
    -z  # tell tar .gzip file
    -f  # is `--file filename`  # needs filename.
    -v  # --verbose
tar -zxvf filename.tar.gz  #extract compressed files


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

grep [OPTION] searchterm [FILE]  # searches line by line for term. Puts into standard output.
grep -v  # inverts output ie. lines without search term into standard output 
grep '*>' file  # allows to search for characters that might be interpreted by bash as something else - see Scripting section.
grep -e ^I file  #extracts lines that start with I

tr -s " " #Translate. Replaces multiple spaces with one space (--sqeeze-repeats)
tr -d " " #deletes spaces
tr # SEE man tr it's really cool

cut -d " " -f 2 #cuts the second field of each line, with fields defined using the delimiter " ".

expr 38-26 #allows sums

sed s/string/replacement filename.txt  # s = substitution. / is the delimiter. Default behaviour is to replace first occurence in a line 
sed s/string/replacement/g filename.txt  # /g is global - replaces all occurences


touch file1.txt # creates empty file file1.txt

cat file1 #prints file1 in terminal
less file1 #prints some of the file?
head -n5 file1 #prints first five lines of a file. Default is ten lines

cat file1.txt # creates file1. Write text. ctrl + D to save and exit
cat file1 > file2 # copies content of file1 into file2. Overwrites/creates file2
cat file1 >> file2 #appends contents of file1 into file2
wc # word count
wc -l #number of lines

    #### Scripting ####
    
#!/bin/bash  ## universally at the start of a BASH script - indicates it's a BASH script
#command;
#command;
#command;
done



# to run a BASH script:  (NOTE: The script must be executable `chmod +x script_name`)
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
$PS1  # The command prompt in the shell eg. thomas@wolf: ~$

# POSITIONAL variables cannot be assigned by user and correspond to the arguments passed when running the script eg. `
./my_script --parameter  parameter2 # --parameter is $1, parameter2 is $2

$#  # Stores the number of command-line arguments that were passed to the shell program.
$?  # Stores the exit value of the last command that was executed.
$0  # Stores the first word of the entered command (the name of the shell program).
$*  # Stores all the arguments that were entered on the command line ($1 $2 ...).
"$@"  # Stores all the arguments that were entered on the command line, individually quoted ("$1" "$2" ...). 



# A whole script runs multiple commands. A semicolon `;` is used after each command to run the next one eg.
echo "This is a scipt"; 
echo "with more than one command"

# The && operator is used as a boolian and a continuation command ie. if the command on the left is a non-zero exit code(??-true?), then the next command will be ran.

  ## hiding special characters ##

greeting="Hello There"  # only hides whitespace from the shell
greeting="Hello there $username"  # only whitespace is hidden - variable $username would be substituted 
greeting='Hello There $username'  # "$" would be hidden: all special characters in the string are hidden. echo $greeting would print Hello There $username
greeting=Hello\ There\ $username  # "\" hides the single character after it.

files=`ls`  # back quotes set the variable as the output of the command

sort file1.txt # sorts file1 alphebetically. CAPITALS before lowercase. prints in terminal

grep [OPTION] searchterm [FILE] # searches line by line for term. Puts into standard output.
grep -v # inverts output ie. lines without search term into standard output 
grep '*>' file # allows to search for characters that might be interpreted by bash as something else
grep -e ^I file #extracts lines that start with I

tr -s " " #Translate. Replaces multiple spaces with one space (--sqeeze-repeats)
tr -d " " #deletes spaces
tr # SEE man tr it's really cool

cut -d " " -f 2 #cuts the second field of each line, with fields defined using the delimiter " ".

expr 38-26 #allows sums

sed s/string/replacement filename.txt  # s = substitution. / is the delimiter. Default behaviour is to replace first occurence in a line 
sed s/string/replacement/g filename.txt  # /g is global - replaces all occurences
