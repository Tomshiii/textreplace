#SingleInstance Force
#Requires AutoHotkey v2.0

; { \\ #Includes
#Include *i vscCompletions.ahk
#Include *i quickHotstring.ahk
#Include *i personalHotstrings.ahk
;The above are not necessary for this script to run

#Include '%A_Appdata%\tomshi\lib'
#Include Classes\ptf.ahk
#Include Classes\tool.ahk
#Include Functions\trayShortcut.ahk
; }

TraySetIcon(ptf.Icons "\text.png")
startupTray()

; This script will continue to be a long term work in progress and will move quite slowling in comparison to everything else

/* #+e::
{
	if !WinExist("ahk_exe Code.exe") ;if you don't open vscode first, it will open the script in a blank workspace which is incredibly annoying
		{
			Run(ptf.ProgFi "\Microsoft VS Code\Code.exe") ;if vscode isn't open we want to open it first and wait for it to open, otherwise it'll open a new, clean instance of VSCode and your previous workspace will be gone
			ToolTip("waiting for vscode to open")
			WinWait("ahk_exe Code.exe")
			ToolTip("")
			sleep 1000
			;Edit()
			tool.Cust("opening " A_ScriptName)
			Run(ptf.ProgFi "\Microsoft VS Code\Code.exe " ptf["textreplace"])
			return
		}
	if InStr(WinGetTitle("A"), "textreplace.ahk") && WinGetProcessName("A") = "Code.exe"
		tool.Cust(A_ScriptName " already open!")
	else
		tool.Cust("opening " A_ScriptName)
	Run(ptf.ProgFi "\Microsoft VS Code\Code.exe " ptf["textreplace"])
} */

/* ;gets reloaded in the main script
#+r:: ;win + r reloads this script
{
	Reload
	sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	;MsgBox "The script could not be reloaded. Would you like to open it for editing?",, 4
	Result := MsgBox("The script could not be reloaded. Would you like to open it for editing?",, 4)
	if Result = "Yes"
		{
			if WinExist("ahk_exe Code.exe")
				{
					if InStr(WinGetTitle("A"), "textreplace.ahk") && WinGetProcessName("A") = "Code.exe"
						tool.Cust(A_ScriptName " already open!")
					else
						tool.Cust("opening " A_ScriptName)
					Run(ptf.ProgFi "\Microsoft VS Code\Code.exe " ptf["textreplace"])
				}
			else
				{
					Run(ptf.ProgFi "\Microsoft VS Code\Code.exe") ;if vscode isn't open we want to open it first and wait for it to open, otherwise it'll open a new, clean instance of VSCode and your previous workspace will be gone
					ToolTip("waiting for vscode to open")
					WinWait("ahk_exe Code.exe")
					ToolTip("")
					sleep 1000
					;Edit()
					tool.Cust("opening " A_ScriptName)
					Run(ptf.ProgFi "\Microsoft VS Code\Code.exe " ptf["textreplace"])
					return
				}
		}
} */

;alphabetise stuff
/* F1::
{
	orig := ClipboardAll()
	A_Clipboard := ""
	SendInput("^c")
	ClipWait(2)
	newval := sort(A_Clipboard, "C0")
	A_Clipboard := newval
	SendInput("{BackSpace}")
	SendInput("{ctrl down}v{ctrl up}")
	SetTimer(() => A_Clipboard := orig, -1000)
} */

;----------------------------------------
; TEXT CORRECTIONS
;----------------------------------------
::couldnt::couldn't
::didnt::didn't
::isnt::isn't
::shouldnt::shouldn't
::wont::won't
::wouldnt::wouldn't
::youre::you're


;----------------------------------------
; AUTOCORRECT
;----------------------------------------
correctionsINI := A_ScriptDir "\autocorrections.ini"
sections       := IniRead(correctionsINI)
secArr         := StrSplit(sections, ["`n", "`r"])

for section in secArr {
	values    := IniRead(correctionsINI, section)
	valuesArr := StrSplit(values, ["=", "`n", "`r"])
	for k, value in valuesArr {
		if Mod(k, 2) = 0
			continue
		if k+1 > valuesArr.Length
			break
		Hotstring("::" value, valuesArr[k+1])
	}
}