@echo off

:shiftMenu {

    ::Print out the menu 
    echo Drop Shift -
    echo 1. Reset Shift
    echo 2. Upload new firmware
    echo 3. Exit script
    set /p choice="Your choice: "
    echo.

    ::Go to appropriate part of code if conditional is correct
    if %choice% == 1 ( goto shiftReset )
    if %choice% == 2 ( goto shiftFirmware )
    if %choice% == 3 ( goto scriptExit)

    ::Defacto else
    echo Invalid choice, please enter a valid option.
    echo.
    goto shiftMenu
}

:shiftReset
call :shiftInstructions
mdloader.exe --first --download shift/shift_default.bin --restart
echo.
goto shiftMenu

:shiftFirmware
echo Available files:
dir shift\*.bin /b
echo.
set /p file_id="Please enter the file name you are trying to flash: "
echo.
call :shiftInstructions
mdloader.exe --first --download shift/%file_id% --restart
echo.
goto shiftMenu

:shiftInstructions
echo Hold FN+B for three seconds...
echo.
goto :eof

:scriptExit
echo Exiting script...
goto :eof