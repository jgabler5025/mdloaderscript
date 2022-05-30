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

:shiftReset {

    ::Prints out DFU instructions
    call :shiftInstructions

    ::Calls mdloader.exe with appropriate flags
    mdloader.exe --first --download shift\shift_default.bin --restart
    echo.

    ::Returns to menu
    goto shiftMenu
}

:shiftFirmware {

    ::Prints out .bin files in keyboard folder
    echo Available files:
    dir shift\*.bin /b
    echo.

    ::Asks for file name
    set /p file_id="Please enter the file name you are trying to flash: "
    echo.

    ::Prints out DFU instructions
    call :shiftInstructions
    
    ::Calls mdloader.exe with user input file and appropriate flags
    mdloader.exe --first --download shift\%file_id% --restart
    echo.

    ::Returns to menu
    goto shiftMenu
}

::Prints out Shift DFU instructions
:shiftInstructions {
    echo Hold FN+B for three seconds...
    echo.
    goto :eof
}

::Exits menu script
:scriptExit {
    echo Exiting script...
    goto :eof
}
