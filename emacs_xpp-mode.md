If you are an Emacs user, then you will benefit from the [emacs lisp mode file for XPPAUT](http://www.ini.uzh.ch/~henning/xpp-mode.php).  On unix systems, this is normally found here:
```
 /usr/local/src/xpp/xpp.el
```
You will probably want to add this line to your `.emacs` file in your home directory:
```
 (load-file "/usr/local/src/xpp/xpp.el")
```
When editing an XPPAUT ode file, if Emacs does not automatically recognize the file content then turn on xpp-mode with the command:
```
 M-x xpp-mode
```

_Back to_ [Software](software.md)
