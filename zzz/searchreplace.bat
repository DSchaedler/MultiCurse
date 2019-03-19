@echo off &setlocal
set "search=%1"
set "replace=%2"
set "dir=%3"
set "textfile=%4"
set "newfile=repTemp.txt"
(for /f "delims=" %%i in (%dir%%textfile%) do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:%search%=%replace%!"
    echo(!line!
    endlocal
))>"%dir%%newfile%"
del %dir%%textfile%
rename %dir%%newfile%  %textfile%