@echo off
cls
echo "*******************************************************************"
echo "*                                                                 *"
echo "* | |_| |__   ___    /\  /\__ _ _ ____   _____  ___| |_ ___ _ __  *"
echo "* | __| '_ \ / _ \  / /_/ / _` | '__\ \ / / _ \/ __| __/ _ \ '__| *"
echo "* | |_| | | |  __/ / __  / (_| | |   \ V /  __/\__ \ ||  __/ |    *"
echo "*  \__|_| |_|\___| \/ /_/ \__,_|_|    \_/ \___||___/\__\___|_|    *"
echo "*                                                                 *"
echo "* LAUNCHER by David Garcia                                        *"
echo "*******************************************************************"
echo 
echo * List: if empty, by default 500
echo * Sources: if empty, by default ALL 
echo * (google, googleCSE, google-profiles, bing, bingapi, dogpile, pgp, linkedin,
echo * vhost, twitter, googleplus, yahoo, baidu)
:Itarget
SET /P target= Search:  
IF "%target%"=="" (GOTO Itarget)
:Ilist
SET /P list= List: 
if "%list%"=="" (set list=500)
:Isource
SET /P sources= Sources:
if "%sources%"=="" (set sources=all)
if "%sources%"=="full" (
set full=true
set sources=all
)

:Ishodan
SET /P shodan= Shodan y/n:
if "%shodan%"=="y" (set shodan=-h) else (set shodan=)

set title=%target: =%
set datetimef=%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%

md %~dp0theHarvester\results\%title%_%datetimef%

echo "C:\Python27\python %~dp0theHarvester\theharvester.py -d "%target%" -l %list% -b %sources% -f %~dp0theHarvester\results\%title%_%datetimef%\%title% %shodan% > %~dp0theHarvester\results\%title%_%datetimef%\%title%.txt"
pause
echo Searching ...

C:\Python27\python %~dp0theHarvester\theharvester.py -d "%target%" -l %list% -b %sources% -f %~dp0theHarvester\results\%title%_%datetimef%\%title% %shodan% > %~dp0theHarvester\results\%title%_%datetimef%\%title%.txt

if "%full%"=="true" (
C:\Python27\python %~dp0theHarvester\theharvester.py -d "%target%" -l %list% -b twitter > %~dp0theHarvester\results\%title%_%datetimef%\%title%_twitter.txt
C:\Python27\python %~dp0theHarvester\theharvester.py -d "%target%" -l %list% -b linkedin > %~dp0theHarvester\results\%title%_%datetimef%\%title%_linkedin.txt
C:\Python27\python %~dp0theHarvester\theharvester.py -d "%target%" -l %list% -b googleplus > %~dp0theHarvester\results\%title%_%datetimef%\%title%_googleplus.txt
C:\Python27\python %~dp0theHarvester\theharvester.py -d "%target%" -l %list% -b google-profiles > %~dp0theHarvester\results\%title%_%datetimef%\%title%_google-profiles.txt
C:\Python27\python %~dp0theHarvester\theharvester.py -d "%target%" -l %list% -b baidu > %~dp0theHarvester\results\%title%_%datetimef%\%title%_baidu.txt
C:\Python27\python %~dp0theHarvester\theharvester.py -d "%target%" -l %list% -b yahoo > %~dp0theHarvester\results\%title%_%datetimef%\%title%_yahoo.txt
C:\Python27\python %~dp0theHarvester\theharvester.py -d "%target%" -l %list% -b dogpile > %~dp0theHarvester\results\%title%_%datetimef%\%title%_dogpile.txt
)
