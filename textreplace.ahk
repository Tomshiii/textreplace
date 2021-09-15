#Hotstring
#SingleInstance Force
TraySetIcon("C:\Program Files\ahk\textreplace\icon\text.ico")

; This script will continue to be a long term work in progress and will move quite slowling in comparison to everything else

#+e:: ;win + a opens notepad to edit this script
{
	if WinExist("ahk_exe notepad.exe") ;if vscode exists it'll simply activate it, if it doesn't, it'll open it
			WinActivate
	else
		Run 'notepad.exe  "C:\Program Files\ahk\textreplace\textreplace.ahk"' ;opens in vscode (how I edit it)
}
#+r:: ;win + r reloads this script
{
	Reload
	Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	;MsgBox "The script could not be reloaded. Would you like to open it for editing?",, 4
	Result := MsgBox("The script could not be reloaded. Would you like to open it for editing?",, 4)
		if Result = "Yes"
			{
				if WinExist("ahk_exe Code.exe")
						WinActivate
				else
					Run "C:\Users\Tom\AppData\Local\Programs\Microsoft VS Code\Code.exe"
			}
}
;========================================
; HOTSTRINGS
;========================================
;----------------------------------------
; TWITCH EMOTES
;----------------------------------------
/*
::omega::omegalul
::oemg::omegalul
::pepela::pepeLaugh
::pogg::poggies
*/


;----------------------------------------
; TEXT CORRECTIONS
;----------------------------------------
::couldnt::couldn't
::wouldnt::wouldn't
::shouldnt::shouldn't
::youre::you're
::wont::won't


;----------------------------------------
; AUTOCORRECT
;----------------------------------------
;a
::arguement::argument
::assignement::assignment
::accelorate::accelerate
::acceloration::acceleration
::accidently::accidentally

;b
::balistic::ballistic

;c

;d
::dependant::dependent
::devistating::devastating

;e
::everthing::everything

;f
::fore::for

;g

;h
::happebn::happen
::happenb::happen
::harrassing::harassing
::harrass::harass

;i
::insited::insisted

;j

;k

;l

;m

;n

;o

;p
::privilages::privileges
::privilage::privilege

;q

;r

;s
::structered::structured

;t
::tyope::type
::tomorroqw::tomorrow

;u
::unneccessary::unnecessary
::unneccesary::unnecessary
::udpates::updates

;v

;w
::withing::within

;x

;y

;z
