@echo off
@color 0A

echo Installer created by Boew Grigory (ProgrammerForever)"
echo "     ______  ___                __  _ ____        ";
echo " __ / / __/ / _ )___ ___ ___ __/ /_(_) _(_)__ ____";
echo "/ // /\ \  / _  / -_) _ \`/ // / __/ / _/ / -_) __/";
echo "\___/___/ /____/\__/\_,_/\_,_/\__/_/_//_/\__/_/   ";
echo "                                                  ";

if exist "%ProgramFiles(x86)%" (
	set pluginPath="%ProgramFiles(x86)%\Notepad++\plugins\jN\includes\"
) else (
	set pluginPath="%PROGRAMFILES%\Notepad++\plugins\jN\includes\"
)

echo install js plugin to %pluginPath%
mkdir %pluginPath%
copy *.js /B /Y %pluginPath%
goto answer1

:answer1
	echo "Restart Notepad++?"
	set /P answer="y/n >"
	if %answer%==n goto EOF
	if %answer%==N goto EOF
	if %answer%==y goto restartNpp
	if %answer%==Y goto restartNpp
	goto answer1

:restartNpp
	taskkill /f /im notepad++.exe
	if exist "%ProgramFiles(x86)%\Notepad++\notepad++.exe%" (
		"%ProgramFiles(x86)%\Notepad++\notepad++.exe%"
		goto EOF
	)
	if exist "%ProgramFiles%\Notepad++\notepad++.exe%" (
		"%ProgramFiles%\Notepad++\notepad++.exe%"
		goto EOF
	)

:EOF
	echo install done!
	pause
