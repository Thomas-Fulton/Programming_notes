 #!/bin/bash
 
 # ADD ssh general protocol/instructions
    #### Set up ssh tunnel #### 


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



