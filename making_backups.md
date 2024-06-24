###############################################################################
# For making backups of ITG data, including info about SSDs, encryption, etc.
###############################################################################

> TODO:
> - md5 validation (and/verses sha sum)

########## New project data recieved from Globus ##############
1. Make backup IMMEDIATELY: See below (rsync into ssd)
2. Make sure checksums are the same
3. Log where files are in "~/projects/IGF\_list.ods"




########## rsync ##############
> See "ssh\_notes.sh" in ~/Programming\_notes/

rsync -avzP /path/to/local/file.txt yourUsername@remote.computer.address:/path/on/remote/computer  
 - "-a" archive: (see https://serverfault.com/questions/141773/what-is-archive-mode-in-rsync)




