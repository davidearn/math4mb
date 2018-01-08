# Using XPPAUT on a Mac

XPPAUT requires [X11](http://en.wikipedia.org/wiki/X11), the unix graphical window system, in order to run.  If you are running OS X 10.5 (Leopard) or newer, then X11 is already installed and will start up automatically when you run XPPAUT.  

That said, I suggest that one install the latest version of X11 from the [XQuartz](http://xquartz.macosforge.org/trac/wiki) project.  The XQuartz version of X11 is an updated and improved version of the stock X11 (itself a port of x11.org, a standard unix X11).

If you are running an earlier version of OS X, then you will need to install X11 from the OS X DVD which came with your computer. In order to run XPPAUT, you will first need to start X11, for which there will be an icon in `Applications -> Utilities`.

--Ken Moyle

## Installing

### Pre-compiled Executables
Ready-to-use, pre-compiled XPPAUT packages are available on the [XPPAUT home page](http://www.math.pitt.edu/~bard/xpp/xpp.html) under `Download -> Assorted binaries`.  There is no naming scheme and it may not be clear which one you want.  

If you have an Intel Mac, then you almost certainly want one with latest date and with "osx" and "intel" in the name.  Download the file, double-click on it to unzip/unpack it, then look for installation instructions.  

If you have a PowerPC Mac (see [Does my Mac have an Intel or PowerPC processor?](http://support.apple.com/kb/ht1531)) then you will need to download the precompiled DMG for XPPAUT 5.99 (the latest version for which there is a PPC binary, as of January, 2012).

__Note:__ The pre-compiled versions do not allow you to link your XPPAUT calculations to ''dynamic link libraries'' (DLLs).  This is a major limitation for analysis of periodically forced ODEs.  If you want to be able to link to DLLs (e.g., to make use of C code that computes a stroboscopic map) then you need to follow the instructions below for compiling from source.

### Compiling from Source Code
Alternatively, you can download and install the latest source code and compile it as shown below.  

The only caveat is that you need to install the Apple XCode tools; XCode is free from Apple but you must explicitly install it.   In OS X 10.7 (Lion), XCode is a free app which can be downloaded from the App Store.   Prior to OS X 10.7, XCode was an optional install available on the OS X installation DVD.  If you don't have the OS X DVD then follow the instructions for [[downloading XCode tools from McMaster]].   

Once you've installed XCode and run Software Update, you can compile XPPAUT like so:
* open Terminal (`Applications -> Utilities`)
* first, enter the following to download and unzip the source-code files
```
 cd 
 cd Desktop
 mkdir xppaut
 cd xppaut
 curl -O http://www.math.pitt.edu/~bard/bardware/xppaut_latest.tar.gz
 tar -xzf xppaut_latest.tar.gz
```
* now compile the code
```
 make
 sudo make install
```
* you can remove the source files once you have installed the compiled binaries
```
 cd
 cd Desktop
 \rm -r xppaut
```

To run XPPAUT, enter this command from the Terminal
```
 xppaut
```

## Creating a Icon in Applications
If you'd like to have an icon in Applications for XPPAUT, run the following commands in a Terminal window
```
 cd /Applications
 sudo ln -s `which xppaut` XPPAUT
```
It's not pretty, but it works.


_Back to_ [Software](software.md)
