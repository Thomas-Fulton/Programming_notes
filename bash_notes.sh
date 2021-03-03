   #################### Bash and directory notes ######################

Generic form: COMMAND [OPTION] [somethinghaha]

## help commands ##
man command #gives user manual for command
command --help #lists options
    q # to quit file view of man/help page
apropos searchterm #search for a command or term in description of a command

## file navigation ##
df -H --total #shows free disk space. -H for human readable.
ls #list content of directory
ls -lh # list long version of content eg. size, date modified, permissions
ls -1 #forces output to be on one line
ls --ignore=PATTERN # ignores matches with PATTERN
   
cd directorypath #change directory. 
cd ~ or cd # cd to /home/thomas
~ # is home/thomas directory
/ #root directory
* #represents any number of any characters including nothing
? #represents any single character
ls #list folders/files in a directory
ls -lht # -l long: shows permisstions and time of last modification and size, -h human readable, -t sorts by recently modified
mkdir dirname #make directory
rmdir dirname or rm -d #remove empty directory
rm -r #remove directory can contain files
rm filename #delete file
mk filename
mv oldfile.txt newfile.txt # moves/cuts the file and pastes and renames it 
chmod +rwx filename # change permissions: add read write execute permissions to file/directory
chmod -wx filname # remove write and execute permissions
cp file.txt filcopy.txt #copy file newfile
cp -r dir /new/location/dircopy #copy directories

zip -r ARCHIVE_NAME # compress into zip format <- universally used across OS systems
zip ARCHIVE_NAME.zip # extract

tar -zcvf filename.tar.gz # read table of contents (-t) for a archive file. -g tells tar "compressed file" (.gz). -f is --file filename. filename is argument to -f option.
tar -zxvf filename.tar.gz #extract compressed files

file filename.gif #prints file type eg. in this case GIF image data bla bla


touch file1.txt # creates empty file file1.txt

cat file1 #prints file1 in terminal
less file1 #prints some of the file?
head -n5 file1 #prints first five lines of a file. Default is ten lines

cat file1.txt # creates file1. Write text. ctrl + D to save and exit
cat file1 > file2 # copies content of file1 into file2. Overwrites/creates file2
cat file1 >> file2 #appends contents of file1 into file2
wc # word count
wc -l #number of lines

ls -1 | wc -l
ls | head
ls | sort

ls *jpg > imagefiles #lists names of .jpg files into new file imagefiles
ls *gif >> imagefiles #appends names of .gif files to imagefiles (instead of overwriting

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
