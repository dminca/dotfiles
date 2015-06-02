Using better_errors on Ubuntu with SublimeText 2
================================================
source: [Better Errors Tutorial!](https://cristiandonosoc.wordpress.com/2013/06/20/better-errors-ubuntu-with-sublime-text-2-or-any-editor-for-that-matter/)

After I installed the fantastic [better_errors gem](https://github.com/charliesome/better_errors), I was disappointed to notice that linking to your text editor doesn't work correctly on Ubuntu (at least, it didn't for me). Here's how I fixed it.

First, create a new desktop entry:

```
# /usr/share/applications/subl-urlhandler.desktop

[Desktop Entry]
Version=1.0
Name=Sublime Text 2
Name[en_PH]=Sublime Text 2
Exec=/usr/bin/subl-urlhandler %u
Icon=/opt/subl/Icon/48x48/sublime_text.png
Terminal=false
Type=Application
Categories=Development;
StartupNotify=true
MimeType=x-scheme-handler/subl;
```

Next, let's create the script we're linking to.

```shell
#!/bin/bash
# /usr/bin/subl-urlhandler

request=${1:23}               # Delete the first 23 characters
request=${request//%2F//}     # Replace %2F with /
request=${request/&line=/:}   # Replace &line= with :
request=${request/&column=/:} # Replace &column= with :

# Launch sublime
subl $request       # Launch ST2
```

Make the url handler executable: `sudo chmod +x /usr/bin/subl-urlhandler`.

Finally, reload your desktop files by running: `sudo update-desktop-database`.

Now you should be good to go! I hope this helped!
