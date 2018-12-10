# Cygwin Config

Packages to install:
* vim
* chere
* procps-ng

To right click and open bash prompt from anywhere, run:
`chere -i -t mintty`

To get colours in mintty, right click the top bar of the window and go to
`Options -> Terminal -> Type -> xterm-256color`

Copy this line to the end of `../bash/.bashrc`:
`alias start='/cygdrive/c/Windows/explorer.exe /e, `cygpath -w $PWD`'`

To use Windows Python through Cygwin, install Python to Windows
Assign the Python root dir to an environment variable
`PYTHONHOME=C:\Python27`
Add the following to the path:
`;%PYTHONHOME%;%PYTHONHOME%\Scripts\`
Finally, add this line to the end of `../bash/.bashrc`:
`export PYTHONUNBUFFERED=1`
