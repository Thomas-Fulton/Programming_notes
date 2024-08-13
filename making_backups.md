# For making backups of ITG data, including info about SSDs, encryption, etc. 
-------------------------------------------------------------------------------


> TODO:
> - md5 validation (and/verses sha sum)

# New project data recieved from Globus
Make backup IMMEDIATELY and LOG where all files are:
1. Create manifest of files
2. Make sure checksums are the same as globus, then use steps below to make checksums for internal comparisons. 
3. Log where files are in "~/projects/IGF\_list.ods"

# Using a new hard disk (SSD)
### Fix Samsung T7 file deleting...
 1. Samsung includes software on hard disk for set up on Macs and Windows. This software (or the disconnection and recconection of the ssd from a faulty USB-C connecting cable), caused files to be deleted to a new ".Trash\*" folder. To stop this:
 - Make sure to delete all Samsung installation files and directories
 - Check cable (and laptop port?) using tester disk.  
 2. Set up veracrypt: see "README-ssd_info_and_backups_access.txt" in Programing notes or on previously set up hard disks
# Reformatting hard disks
> See https://dev.to/thekalderon/formatting-external-drives-on-linux-using-gparted-5goa
 1. make sure disk is unmounted.
 2. Open gparted, select disk (dev/sda1). make sure it is correct and not the system ssd (dev/nme...)
 3. Partition -> Format to -> ext4
 4. Click apply all operations
 5. Right click and re-label to T2(4) for example.  
 6. Change group and group permissions: Move to dir above ssd (/media/wfulton/)  
  - `sudo chgrp -R emailonly T7-5/` 
  - `sudo chmod -R g+rw T7-5/`
# Creating Manifest and MD5 checksums 
> see: https://www.baeldung.com/linux/directory-md5-checksum  
> see: https://www.bioinformatics.unibe.ch/unibe/portal/fak_naturwis/d_dbio/inst_bioinf/content/e218076/e1107953/e1108079/e1108085/files1108092/How_to_get_MD5_checksum_eng.pdf

## 1. Set up  
```  
projdir=honey
ssdname="T7-5"
```  

### Example:
Moving a folder of raw sequencing data (downloaded from globus) from a project "Aero" in "~/globus_ITG_data/Aero/" to ssd "/media/wfulton/T7". Moving folder "AvikData" (not all of Aero).  
 1. Make sure duplicate _project_ directory exists in destination (eg. ssd) and in "records-of-ITG-projects/"

```
mkdir /media/wfulton/${ssdname}/${projdir}
mkdir ~/projects/records-of-ITG-projects/${projdir}
```
  \# (Without encrytion) TODO: same using veracrypt?

## 2. Manifest
 1. Move to directory _above_ directory of interest (i.e. "~/globus_ITG_data/Aero/"), and set name of directory of interest (i.e. "./AvikData"):  

```
cd ~/globus_ITG_data/${projdir}
mydir=AvikData
```
  
 2. Create manifest.tsv of all files in ${mydir}:  

```
find "${mydir}" -type f | LC_ALL=C sort > ${mydir}_manifest.tsv
```
  

```
cat ${mydir}_manifest.tsv
```


## 3. MD5 Checksums
### For only contents and file paths:
 - Checksums are only done on FILES not DIRECTORIES: therefore do on all files:
 - Save .md5 files outside of dir as saving inside with change the results! - code below will save two files (one with checksums of all files in dir, one with checksum of checksums)

 1. move to directory _above_ directory of interest ("~/globus_ITG_data/Aero/"), and set name of directory of interest ("./AvikData")

```
mydir=AvikData
```

 2. Calculate checksums for each file in "$mydir":  

```
find "${mydir}" -type f -exec md5sum {} + | LC_ALL=C sort > ./"${mydir}"_files_checksums.md5
```
  

```
cat "${mydir}"_files_checksums.md5
```
  
 3. THEN for the directory, calcluate checksum on on file containing sorted file checksums:  

```
md5sum "${mydir}"_files_checksums.md5 > "${mydir}"_dir_checksum.md5
```
  

```
cat "${mydir}"_dir_checksum.md5
```

\# (old) 
```
find ${mydir} -type f -exec md5sum {} + | LC_ALL=C sort | md5sum > ${mydir}_checksum.md5
```


## 4. Copy directory of interest to ssd
1. Copy folder

```
rsync -avzP "${mydir}" /media/wfulton/${ssdname}/${projdir}/
```

2. Move checksums to ssd, AND to "records-of-ITG-projects"

```
rsync -avzP "${mydir}"_* /media/wfulton/${ssdname}/${projdir}/
rsync -avzP "${mydir}"_* ~/projects/records-of-ITG-projects/${projdir}/
# Move anything else that is needed, eg. demult_reports, md5_manifest_globus.tsv
rsync -avzP "md5_manifest_globus.tsv" /media/wfulton/${ssdname}/${projdir}/

```


## 5. Check MD5 checksums
 1. Make sure ${mydir} is set (if using different terminal window)  

```
cd /media/wfulton/${ssdname}/${projdir}/
```


```
md5sum -c --quiet "${mydir}"_files_checksums.md5
```
  \# --quiet will only show mismatched checksums  
#### (Just use individual files checksums but if needed:) To check on directory: 
 > "${mydir}"\_files\_checksums.md5 must be re-calculated FIRST  

```
md5sum -c "${mydir}"_dir_checksum.md5
```

\# (old): 
```
find "${mydir}" -type f -exec md5sum {} + | LC_ALL=C sort | md5sum
```
 


# rsync
> See "ssh\_notes.sh" in ~/Programming\_notes/


```
rsync -avzP /path/to/local/file.txt yourUsername@remote.computer.address:/path/on/remote/computer
```

 - "-a" archive: (see https://serverfault.com/questions/141773/what-is-archive-mode-in-rsync)
### For contents, file paths, AND attributes/permissions etc.:
> rsync must be done with 
```
-a
```
 aka archive mode to have preserved file attributes and permissions for the checksums to match

Create function and exports:  

```
summary (){
    echo "$(stat -c '%y' "$1") $(md5sum "$1")"
}
export -f summary
```


```
find . -type f -exec bash -c 'summary "$0"' {} \; | LC_ALL=C sort | md5sum
```





