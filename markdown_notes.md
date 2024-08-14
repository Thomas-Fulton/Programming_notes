# Git Markdown Notes
> SEE helpful examples:
>  - [helpful cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
>  - [Ludwig repo README.md](https://github.com/Thomas-Fulton/Ludwig_2019/README.md)

## To save formatted github (and many other) markdown files as a pdf: open .md file in Chrome with the "Markdown Viewer" Extension. Edit theme to Github, then go to chrome options and "print", then tick "background graphics" option, and save as pdf.
To see changes as you make them in a worse but updatable rending, run the following then ctr+click on the link to local server.
```
~/.local/bin/grip ~/Documents/Programming_notes/making_backups.md
```


> From: https://superuser.com/questions/689056/how-can-i-convert-github-flavored-markdown-to-a-pdf/1591372#1591372

# \# Main title
## \#\# Subtitle
### \#\#\# Smaller etc...

For \`code\` in a sentence
For code block (with copy button). Optional to add language:
```bash
the code`
```
For bulleted list:
 - " \- 1st level"
   - "   - 2nd level"
     - ...
For links: "\[words to be clicked on](https:theactuallink.co.uk)"
eg. [Ludwig _et al._ (2019)](https://doi.org/10.1016/j.cell.2019.01.022) 
&nbsp;  

For images: "\<img src="relative/path/to/image.png" align="left" width="300" />"
<img align="left" src="images/logo-newcastle-university.png" width="300" /> <img align="right" src="images/logo-wellcome-centre-mitcondrial-research.png" width="300" />  
&nbsp;  

For return/newline (\n or \r) character: 
 - At the end of a regular string (not in a bulleted list for example), two spaces are needed for a newline: eg. the sentence" \ "
 - "&nbsp\;". A newline in the .md won't translate to a newline in the formated markdown document. 
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;  
For NOTE: "\> The sentences in the highlighted note"
> NOTE: This inserts a highlighted, indented block as a note
