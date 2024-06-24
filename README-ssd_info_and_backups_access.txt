#############################################################################################
    Property of the Immunomodulation and Tolerance Group (ITG) at Imperial College London    
#############################################################################################

If found, please contact Prof. Mohammed Shamji (m.shamji99@imperial.ac.uk), Dr Janice Layhadi and Thomas Fulton (thomas@fultondesigns.co.uk): this drive contains de-personalised backup data for research projects that legally required to store: it is vital that it is returned if found by anyone outisde of the ITG. 

data located in the file `backups`). This file is an encrypted container that requires specific software (veracrypt) to decrypt and read/write.

######################  Data  ######################

- BOPI


#####################  Access  ######################

To access `backups` container: 

1. Install veracrypt (either use the installers on drive itself / or download from "https://www.veracrypt.fr/en/Downloads.html") for whichever platform on your computer. 
2. Open veracrypt and select an unused volume (eg. A: B: C: ... on Windows, or 1 2 3 ... on linux)
3. Click "Select File..." and select the SSD in the file manager, then open the "backups" file. 
4. Select "Mount" and enter the password (which can be obtained from Prof Shamji, Dr Lyhadi or Thomas Fulton).


###########  Encrypted Backup Creation #############

To create an encypted container like "backups" on another drive, follow the instructions below.

(Veracrypt was chosen to encrypt the files as it is secure, cross-platform - Windows and linux distributions - free and open-source. It has a history of staying up-to-date, and widely-used with good community support.)

1. Plug SSD drive into computer
2. Launch veracrypt (install via files on SSD or from "https://www.veracrypt.fr/en/Downloads.html")
3. Click "Create Volume"
4. Follow the instructions that pop up:
   - Select "Create an encrypted file container"
   - Select "Standard ..."
   - Select the SSD in the file picker, and pick a name for the file that will contain the container eg. "backups"
   - Select encryption algorithm: AES and SHA-256 / SHA-512 are currently strong (2023), and have remained secure for a number of years.
   - Select size of partition: leave some space for a file like this, and a copy of veracrypt/installers if you like
   - Set a strong password: only worth encrypting if the password is strong eg. 20< letters, special characters etc. Tick PIM and select a number eg. 485 is default. This is the number of time the password will be re-hashed (I think), and makes the password much more difficult to brute force.
   - Click yes to large files.
   - Select NTFS as the filesystem format: compatible with linux and window, and allows large file sizes unlike FAT based.
   - Click format to create


