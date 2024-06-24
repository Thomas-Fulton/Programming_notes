# For making backups of ITG data, including info about SSDs, encryption, etc. 
-------------------------------------------------------------------------------


> TODO:
> - md5 validation (and/verses sha sum)

# New project data recieved from Globus
Make backup IMMEDIATELY and LOG where all files are:
1. Create manifest of files
2. Make sure checksums are the same as globus, then use steps below to make checksums for internal comparisons. 
3. Log where files are in "~/projects/IGF\_list.ods"


# rsync
> See "ssh\_notes.sh" in ~/Programming\_notes/

`rsync -avzP /path/to/local/file.txt yourUsername@remote.computer.address:/path/on/remote/computer`
 - "-a" archive: (see https://serverfault.com/questions/141773/what-is-archive-mode-in-rsync)


# Creating Manifest and MD5 checksums 
> see: https://www.baeldung.com/linux/directory-md5-checksum
> see: https://www.bioinformatics.unibe.ch/unibe/portal/fak_naturwis/d_dbio/inst_bioinf/content/e218076/e1107953/e1108079/e1108085/files1108092/How_to_get_MD5_checksum_eng.pdf

## Manifest
 1. Move to directory _above_ directory of interest, and set name of directory of interest:  
`mydir=Aero`  
 2. Create manifest.tsv of all files in ${mydir}:  
`find "${mydir}" -type f | LC_ALL=C sort > ${mydir}_manifest.tsv`

## MD5 Checksums
### For only contents and file paths:
 - Checksums are only done on FILES not DIRECTORIES: therefore do on all files:
 - Save .md5 files outside of dir as saving inside with change the results! - code below will save two files (one with checksums of all files in dir, one with checksum of checksums)

 1. move to directory _above_ directory of interest, and set name of directory of interest
`mydir=Aero`
 2. Calculate checksums for each file in "$mydir":  
`find "${mydir}" -type f -exec md5sum {} + | LC_ALL=C sort > ./"${mydir}"_files_checksums.md5`
 3. THEN for the directory, calcluate checksum on on file containing sorted file checksums:  
`md5sum "${mydir}"_files_checksums.md5 > "${mydir}"_dir_checksum.md5`  
\# (old) `find ${mydir} -type f -exec md5sum {} + | LC_ALL=C sort | md5sum > ${mydir}_checksum.md5`

To check:  
`md5sum -c --quiet "${mydir}"_files_checksums.md5`  \# --quiet will only show mismatched checksums
(Just use individual files checksums but if needed:) To check on directory: 
 - "${mydir}"\_files\_checksums.md5 must be re-calculated FIRST  
`md5sum -c "${mydir}"_dir_checksum.md5`
\# (old): `find "${mydir}" -type f -exec md5sum {} + | LC_ALL=C sort | md5sum` 
### For contents, file paths, AND attributes/permissions etc.:
> rsync must be done with `-a` aka archive mode to have preserved file attributes and permissions for the checksums to match

Create function and exports:  
`summary (){
    echo "$(stat -c '%y' "$1") $(md5sum "$1")"
}
export -f summary`
`find . -type f -exec bash -c 'summary "$0"' {} \; | LC_ALL=C sort | md5sum`




