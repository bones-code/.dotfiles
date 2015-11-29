#!/usr/bin/env bash

# OSX
if get_os 'osx'; then
  #google-chrome
  open https://www.google.com/chrome
  #vimium
  open https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb
  #vimperator
  open https://addons.mozilla.org/en-us/firefox/addon/vimfx/ 
  #wifi-signal
  open https://itunes.apple.com/us/app/wifi-signal/id525912054?mt=12
  #Paragon
  #open https://www.paragon-software.com/home/ntfs-mac/
  #VB box
  #open https://www.virtualbox.org/wiki/Downloads
  #xPRA
  #open https://www.xpra.org/

  if [[ $LOCAL ]]; then
    #tunnelblick
    open https://tunnelblick.net/downloads.html

    e_header "Enable Filevault"
    sudo fdesetup enable

    e_header "Enable tty_tickets for sudo"
    su -m -c "echo 'Defaults tty_tickets' >> /etc/sudoers"
    
    # https://github.com/drduh/OS-X-Security-and-Privacy-Guide#firmware-password
    e_header "Setup a firmware password"
    echo "1. Shutdown the Mac.
2. Start up your Mac again and immediately hold the Command and R keys
   after you hear the startup sound to start from OS X Recovery.
3. When the Recovery window appears, choose Firmware Password Utility from
   the Utilities menu.
4. In the Firmware Utility window that appears, select Turn On Firmware Password.
5. Enter a new password, then enter the same password in the Verify field.
6. Select Set Password.
7. Select Quit Firmware Utility to close the Firmware Password Utility.
8. Select the Apple menu and choose Restart or Shutdown."

    # Disable "Spotlight Suggestions" for both Spotlight and Safari
    # https://fix-macosx.com/ 
    e_header "Disabling 'Spotlight Suggestions' for both Spotlight and Safari"
    python $DOTFILES_HOME/bin/fix-macosx.py
  fi

# Ubuntu.
elif get_os 'ubuntu'; then
	e_header "TODO!! "
fi
