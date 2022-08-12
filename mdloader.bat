@echo off

:mainMenu {

    ::Print out the main menu
    echo Main Menu -
    echo 1. Drop Ctrl
    echo 2. Drop Shift
    set /p choice="Your choice (q to cancel): "
    echo.

    ::Go to appropriate part of code given correct choice
    if %choice% == 1 (
        goto ctrlMenu 
    )
    if %choice% == 2 (
        goto shiftMenu
    )
    if %choice% == q (
        goto scriptExit
    )

    ::Else loop menu
    echo Invalid choice, please enter a valid option
    echo.
    goto mainMenu
}

:shiftMenu {

    ::Print out the menu 
    echo Drop Shift -
    echo 1. Reset Shift
    echo 2. Upload new firmware
    set /p choice="Your choice (q to cancel): "
    echo.

    ::Go to appropriate part of code if conditional is correct
    if %choice% == 1 (
        goto shiftReset
    )
    if %choice% == 2 (
        goto shiftFirmware
    )
    if %choice% == q (
        goto mainMenu
    )

    ::Defacto else
    echo Invalid choice, please enter a valid option.
    echo.
    goto shiftMenu
}

:shiftReset {

    ::Prints reset options
    echo Drop Shift Reset Options:
    echo 1. Original firmware
    echo 2. Modern firmware
    set /p choice="Your choice (q to cancel): "
    echo.

    ::Backs out of reset menu
    if %choice% == q (
        goto shiftMenu
    )

    ::Original firmware reset
    if %choice% == 1 (

        ::Checks if reset firmware is in defaults folder
        if not exist "defaults\shift_default_original.bin" (
            echo Please restore the Shift original default firmware to the defaults folder under the filename Shift_default_original.bin.
            echo.
            goto shiftMenu
        )

        ::Prints out DFU instructions
        call :dfuInstructions

        ::Calls mdloader.exe with appropriate flags
        mdloader.exe --first --download defaults\shift_default_original.bin --restart
        echo.

        ::Returns to menu
        goto shiftMenu

    )

    ::Modern firmware reset
    if %choice% == 2 (
        
        ::Checks if reset firmware is in defaults folder
        if not exist "defaults\shift_default_modern.bin" (
            echo Please restore the Shift modern default firmware to the defaults folder under the filename shift_default_modern.bin.
            echo.
            goto shiftMenu
        )

        ::Prints out DFU instructions
        call :dfuInstructions

        ::Calls mdloader.exe with appropriate flags
        mdloader.exe --first --download defaults\shift_default_modern.bin --restart
        echo.

        ::Returns to menu
        goto ctrlMenu

    )

    ::Defacto else, catches invalid inputs
    echo Invalid choice, please enter a valid option.
    echo.
    goto shiftReset
}

:shiftFirmware {

    ::Prints out .bin files in keyboard folder
    echo Available files:
    dir shift\*.bin /b
    echo.

    ::Asks for file name
    set /p file_id="Please enter the file name you are trying to flash (q to cancel, r to refresh file list): "
    echo.

    ::Returns to menu if user cancels
    if %file_id% == q (
        goto shiftMenu
    )

    ::Loops back to refresh file list
    if %file_id% == r (
        goto shiftFirmware
    )

    ::Loops back if an invalid file name is entered
    if not exist "shift\"%file_id% (
        echo Invalid file name. Please try again.
        echo.
        goto shiftFirmware
    )

    ::Prints out DFU instructions
    call :dfuInstructions
    
    ::Calls mdloader.exe with user input file and appropriate flags
    mdloader.exe --first --download shift\%file_id% --restart
    echo.

    ::Returns to menu
    goto shiftMenu
}

:ctrlMenu {

    ::Print out the menu 
    echo Drop Ctrl -
    echo 1. Reset Ctrl
    echo 2. Upload new firmware
    set /p choice="Your choice (q to cancel): "
    echo.

    ::Go to appropriate part of code if conditional is correct
    if %choice% == 1 (
        goto ctrlReset
    )
    if %choice% == 2 (
        goto ctrlFirmware
    )
    if %choice% == q (
        goto mainMenu
    )

    ::Defacto else
    echo Invalid choice, please enter a valid option.
    echo.
    goto ctrlMenu
}

:ctrlReset {

    ::Prints reset options
    echo Drop Ctrl Reset Options:
    echo 1. Original firmware
    echo 2. Modern firmware
    set /p choice="Your choice (q to cancel): "
    echo.

    ::Backs out of reset menu
    if %choice% == q (
        goto ctrlMenu
    )

    ::Original firmware reset
    if %choice% == 1 (

        ::Checks if reset firmware is in defaults folder
        if not exist "defaults\ctrl_default_original.bin" (
            echo Please restore the Ctrl original default firmware to the defaults folder under the filename ctrl_default_original.bin.
            echo.
            goto ctrlMenu
        )

        ::Prints out DFU instructions
        call :dfuInstructions

        ::Calls mdloader.exe with appropriate flags
        mdloader.exe --first --download defaults\ctrl_default_original.bin --restart
        echo.

        ::Returns to menu
        goto ctrlMenu

    )

    ::Modern firmware reset
    if %choice% == 2 (
        
        ::Checks if reset firmware is in defaults folder
        if not exist "defaults\ctrl_default_modern.bin" (
            echo Please restore the Ctrl modern default firmware to the defaults folder under the filename ctrl_default_modern.bin.
            echo.
            goto ctrlMenu
        )

        ::Prints out DFU instructions
        call :dfuInstructions

        ::Calls mdloader.exe with appropriate flags
        mdloader.exe --first --download defaults\ctrl_default_modern.bin --restart
        echo.

        ::Returns to menu
        goto ctrlMenu

    )

    ::Defacto else, catches invalid inputs
    echo Invalid choice, please enter a valid option.
    echo.
    goto ctrlReset
}

:ctrlFirmware {

    ::Prints out .bin files in keyboard folder
    echo Available files:
    dir ctrl\*.bin /b
    echo.

    ::Asks for file name
    set /p file_id="Please enter the file name you are trying to flash (q to cancel, r to refresh file list): "
    echo.

    ::Returns to menu if user cancels
    if %file_id% == q (
        goto ctrlMenu
    )

    ::Loops back to refresh file list
    if %file_id% == r (
        goto ctrlFirmware
    )

    ::Loops back if an invalid file name is entered
    if not exist "ctrl\"%file_id% (
        echo Invalid file name. Please try again.
        echo.
        goto ctrlFirmware
    )

    ::Prints out DFU instructions
    call :dfuInstructions
    
    ::Calls mdloader.exe with user input file and appropriate flags
    mdloader.exe --first --download ctrl\%file_id% --restart
    echo.

    ::Returns to menu
    goto ctrlMenu
}

::Prints out DFU instructions
:dfuInstructions {
    echo Hold FN+B for three seconds...
    echo.
    goto :eof
}

::Exits menu script
:scriptExit {
    echo Exiting script...
    goto :eof
}