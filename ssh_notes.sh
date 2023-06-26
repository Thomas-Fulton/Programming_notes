 #!/bin/bash
 
 # ADD ssh general protocol/instructions

    #### Set up ssh tunnel #### 
    # 1) Generate password protected ed 25519 pair of keys
    # 2) Add ssh key to ssh agent so you don't have to type password every time
# 1: Generate ssh key: (set a password)
ssh-keygen -t ed25519  # leave blank when asked for location of key to generate in default location ~/.ssh/

# 2: start ssh agent:
eval "$(ssh-agent -s)"
# add private key to ssh agent
ssh-add ~/.ssh/id_ed25519


    ## ncl rocket access ##
ssh c0078068@unix.ncl.ac.uk
# login
ssh rocket.ncl
# login

    #### sftp ####
# start up like ssh
# navigate to folder on remote machine eg. ls, cd etc
pwd
ls
cd

l*  # l before navigation commands changes local directories eg. ls, cd etc
lpwd 
lls
lcd

get filename
put filename

get -r directoryname  # get whole directory


    #### rsync ####
rsync -avzP /path/to/local/file.txt yourUsername@remote.computer.address:/path/on/remote/computer  
  # The a (archive) option preserves file timestamps and permissions and is needed to transfer folders (recursive); 
  # the v (verbose) option gives verbose output to help monitor the transfer; 
  # the z (compression) option compresses the file during transit to reduce size and transfer time; 
  # the P (partial/progress) option preserves partially transferred files in case of an interruption and also displays the progress of the transfer.
rsync -avzP yourUsername@remote.computer.address:/path/on/remote/computer/file.txt /path/to/local/
  # to download a file switch the source and destination



