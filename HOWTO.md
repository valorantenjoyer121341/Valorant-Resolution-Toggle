Valorant Resolution Toggle Script

A PowerShell script to instantly toggle between 1280x960 and 1920x1080 while keeping 240Hz refresh rate. Ideal for Valorant players who use AMD Custom Resolutions.

I you would like to use a different resolution, just chaange the script to reflect your resolution.

Features

Toggles between 1280x960 ↔ 1920x1080 @ 240Hz

Works with AMD Custom Resolutions

Preserves refresh rate (doesn't drop to 60Hz)

Logs all changes in ResolutionChange.log

Supports hotkey bindings (F8, or any key)

Requirements

Before running the script, ensure you have:

QRes (for resolution switching)

PowerShell (Run as Administrator)

AutoHotkey (Optional, for hotkey binding)

How to Install and Use the Script

Step 1: Install QRes

QRes is a lightweight command-line tool for changing screen resolutions.

Download QRes from:https://sourceforge.net/projects/qres/

Extract QRes.exe to:C:\ProgramData\ResolutionToggle\

Ensure QRes.exe is in the same folder as ToggleResolution.ps1.

Step 2: Run the Script

Open PowerShell as Administrator.

Navigate to your script folder:

cd "C:\ProgramData\ResolutionToggle\"

Run the script:

.\ToggleResolution.ps1

The script will:

Detect your current resolution.

Toggle to the opposite resolution (1280x960 ↔ 1920x1080).

Keep 240Hz refresh rate.

Log all changes in ResolutionChange.log.

Step 3: Assign to a Keyboard Hotkey

Option 1: AutoHotkey (AHK)

To toggle resolution without leaving Valorant, use AutoHotkey (AHK).

Install AutoHotkey from:https://www.autohotkey.com/

Create a new file: ToggleResolution.ahk

Paste this:

F8:: (or any button you would like the hotkey to be)
Run, powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "C:\ProgramData\ResolutionToggle\ToggleResolution.ps1"
return

Save and double-click ToggleResolution.ahk to run.

Press F8 anytime to toggle resolution instantly.

Alternatively, you can include the AHK script inside your GitHub repository as ToggleResolution.ahk for easy access.

Option 2: Gaming Keyboard Software

If you have a Logitech, Razer, or Corsair keyboard, you can bind the script to a macro key:

Logitech G Hub: Assign a "Run Program" action to ToggleResolution.bat

Razer Synapse: Use "Launch Program" with ToggleResolution.bat

Corsair iCUE: Create a macro to run PowerShell with the script.

Troubleshooting

Script Doesn’t Work?

Ensure QRes.exe is in the correct folder (C:\ProgramData\ResolutionToggle\).

Run PowerShell as Administrator.

If resolution drops to 60Hz, enable AMD Custom Resolutions.

F8 Hotkey Doesn't Work?

Check if F8 is already in use:

Press F8 and see if it triggers another function.

Try Fn + F8 if on a laptop.

Use a different key in AutoHotkey (e.g., F9:: instead of F8::).
