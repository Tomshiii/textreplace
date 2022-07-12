#Hotstring
#SingleInstance Force
TraySetIcon(A_ScriptDir "\icon\text.ico")

; This script will continue to be a long term work in progress and will move quite slowling in comparison to everything else

#+e:: ;win + a opens notepad to edit this script
{
	if WinExist("ahk_exe notepad.exe") ;if vscode exists it'll simply activate it, if it doesn't, it'll open it
			WinActivate
	else
		Run 'notepad.exe ' A_ScriptDir "\textreplace.ahk"
}
/* ;gets reloaded in the main script
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
} */
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
::didnt::didn't
::isnt::isn't
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
::accessability::accessibility
::aquantences::acquaintances
::assosiate::associate
::aboration::aberration
::accomidate::accommodate

;b
::balistic::ballistic

;c
::compisition::composition
::catestrophic::catastrophic

;d
::dependant::dependent
::devistating::devastating
::dissapointed::disappointed
::disengenious::disingenuous
::desparately::desperately
::desparate::desperate

;e
::everthing::everything
::existant::existent
::effeciency::efficiency
::extrodinaire::extraordinaire
::elequent::eloquent
::exploaded::exploded
::explaination::explanation
::explanitory::explanatory
::erganomic::ergonomic

;f
::fore::for
::flabergasted::flabbergasted
;g

;h
::happebn::happen
::happenb::happen
::harrassing::harassing
::harrass::harass

;i
::insited::insisted
::impatiant::impatient
::inherantly::inherently
::inherant::inherent
::interlectual::intellectual

;j

;k

;l
::literaelly::literally
::luxery::luxury

;m
::manufactored::manufactured
::manufatoring::manufacturing
::matress::mattress

;n
::neccessary::necessary
::nusense::nuisance

;o
::occassions::occasions
::occurance::occurrence
::occured::occurred
::obssessed::obsessed
::obssesed::obsessed
::obssession::obsession
::overide::override
::overal::overall

;p
::privilages::privileges
::privilage::privilege
::preffered::preferred
::preperation::preparation

;q

;r
::resoltion::resolution
::recieve::receive
::rejoyce::rejoice

;s
::structered::structured
::supress::suppress
::supressed::suppressed
::scamed::scammed

;t
::tyope::type
::tomorroqw::tomorrow
::tedius::tedious

;u
::unneccessary::unnecessary
::unneccesary::unnecessary
::udpates::updates

;v
::varient::variant
::vaccum::vacuum

;w
::withing::within
::writting::writing

;x

;y
::yoht::yacht

;z
