##################################
# TODO 
- etckeeper package to monitor changes in etc: can track history of changes to /etc and who made them. IE - were they distribution changes, or changes that you made?
- chez-moi for dotfiles
- conda / mamba requirements.txt
- R environment
  - ~/.config/rstudio
  - .Rprofile, .Rhistory, .Renviron, .R/rstudio/ , .R/snippets, .rstudio-desktop/ 
> # Run this in R
> `installed_pkgs <- installed.packages()["Package"]`
> `save(installed_pkgs, file = "installed_packages.Rdata")`
> # To reinstall:
> `load("installed_packages.Rdata")`
> `install.packages(installed_pkgs)`


# Key folders
- /etc
- /home
- /var
- /var/lib/dpkg
- /boot
- /root
- /usr/local
- /usr/share
