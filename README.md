# mdloaderscript
A command line shell to provide ease of use on Windows for Drop's (formerly Massdrop) QMK firmware loader.
Currently supports the Drop Shift and Drop Ctrl.

# Instructions:
- Download a copy of the repository.
- Download a copy of [mdloader](https://github.com/Massdrop/mdloader/releases) from the Massdrop repository.
- Place the unzipped files and mdloader.exe in the same folder
- Download default config files from the [Drop Configurator](https://drop.com/mechanical-keyboards/configurator) and place them in the defaults folder with the following file names:
    - Drop Shift:
        - Original: shift_default_original.bin
        - Modern: shift_default_modern.bin
    - Drop Ctrl:
        - Original: ctrl_default_original.bin
        - Modern: ctrl_default_modern.bin
    - Drop Alt:
        - Original: alt_default_original.bin
        - Modern: alt_default_modern.bin
- Place any Drop Configurator bin files in the appropriate folder for their keyboard
- Run mdloader.bat to be given a menu style prompt
