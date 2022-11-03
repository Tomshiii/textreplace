#Hotstring
#SingleInstance Force
TraySetIcon(A_ScriptDir "\icon\text.ico")

; This script will continue to be a long term work in progress and will move quite slowling in comparison to everything else

#+e::
{
	if WinExist("ahk_exe Code.exe")
		Run("C:\Program Files\Microsoft VS Code\Code.exe " A_ScriptFullPath)
	else ;if you don't open vscode first, it will open the script in a blank workspace which is incredibly annoying
		{
			Run("C:\Program Files\Microsoft VS Code\Code.exe") ;if vscode isn't open we want to open it first and wait for it to open, otherwise it'll open a new, clean instance of VSCode and your previous workspace will be gone
			ToolTip("waiting for vscode to open")
			WinWait("ahk_exe Code.exe")
			ToolTip("")
			sleep 1000
			;Edit()
			Run("C:\Program Files\Microsoft VS Code\Code.exe " A_ScriptFullPath)
		}
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

;alphabetise stuff
/* F1::
{
	orig := ClipboardAll()
	A_Clipboard := ""
	SendInput("^c")
	ClipWait("2")
	newval := sort(A_Clipboard, "C0")
	A_Clipboard := newval
	SendInput("{BackSpace}")
	SendInput("{ctrl down}v{ctrl up}")
	SetTimer(() => A_Clipboard := orig, -1000)
} */

;these are to help type stuff in vscode
:o:toolc::
{
	Send("{Raw}tool.Cust(`"`")")
	SendInput("{Left 2}")
}
:o:toolf::
{
	Send("{Raw}tool.Cust(`"`",, 1)")
	SendInput("{Left 6}")
}
:o:toolw::tool.Wait()

:o:coords::coord.s()
:o:coordw::coord.w()
:o:coordc::coord.c()

:o:blockon::block.On()
:o:blockoff::block.Off()

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
;a
::abboration::aberration
::aboration::aberration
::accelorate::accelerate
::acceloration::acceleration
::accessability::accessibility
::accessable::accessible
::accidently::accidentally
::accomidate::accommodate
::accomodate::accommodate
::adament::adamant
::agressive::aggressive
::amazin::amazing
::aquantences::acquaintances
::arguement::argument
::asign::assign
::assignement::assignment
::assosiate::associate
::assosiated::associated

;b
::backig::backing
::balistic::ballistic
::barrelling::barreling
::behemouth::behemoth
::blatently::blatantly
::bototm::bottom
::burdon::burden

;c
::catestrophic::catastrophic
::compisition::composition
::comapre::compare
::contriversy::controversy
::cooincidence::coincidence
::critisism::criticism
::critisisms::criticism
::culperate::culprit

;d
::deminishing::diminishing
::demorilising::demoralising
::deoderant::deodorant
::dependant::dependent
::desparate::desperate
::desparately::desperately
::devistating::devastating
::dichotamy::dichotomy
::disengenious::disingenuous
::dissapointed::disappointed

;e
::effeciency::efficiency
::elequent::eloquent
::enitre::entire
::erganomic::ergonomic
::everthing::everything
::excersise::exercise
::existant::existent
::explaination::explanation
::explanitory::explanatory
::exploaded::exploded
::extrodinaire::extraordinaire

;f
::flabergasted::flabbergasted
::fore::for
::functino::function
::functuality::functionality

;g
::geenie::genie
::guage::gauge
::guantlet::gauntlet

;h
::happebn::happen
::happenb::happen
::harrass::harass
::harrassing::harassing
::harrassment::harassment

;i
::impatiant::impatient
::inevitibly::inevitably
::inherant::inherent
::inherantly::inherently
::insited::insisted
::interesed::interested
::interlectual::intellectual
::interperet::interpret
::interupted::interrupted
::irrelevency::irrelevancy
::irrelevent::irrelevant

;j

;k

;l
::literaelly::literally
::literaly::literally
::luxery::luxury

;m
::maner::manner
::manor::manner
::manufactored::manufactured
::manufatoring::manufacturing
::matress::mattress

;n
::neccesary::necessary
::neccessary::necessary
::notible::notable
::nuisense::nuisance
::nusense::nuisance

;o
::obssesed::obsessed
::obssessed::obsessed
::obssession::obsession
::occassion::occasion
::occassionally::occasionally
::occassions::occasions
::occurance::occurrence
::occured::occurred
::ommit::omit
::ommitted::omitted
::overal::overall
::overide::override

;p
::paramater::parameter
::persuing::pursuing
::preffered::preferred
::preperation::preparation
::pretyty::pretty
::privilage::privilege
::privilages::privileges

;q

;r
::realisttically::realistically
::reciepts::receipts
::recieve::receive
::redundent::redundant
::refferal::referral
::rejoyce::rejoice
::repetative::repetitive
::resoltion::resolution

;s
::scamed::scammed
::seratonin::serotonin
::smouldering::smoldering
::soley::solely
::soly::solely
::structered::structured
::sucess::success
::sucessful::successful
::sudo::pseudo
::supress::suppress
::supressed::suppressed

;t
::tedius::tedious
::tomorroqw::tomorrow
::transfered::transferred
::transparancy::transparency
::tyope::type

;u
::udpates::updates
::unneccesary::unnecessary
::unneccessary::unnecessary

;v
::vaccum::vacuum
::varient::variant
::verticle::vertical

;w
::wabble::wobble
::withing::within
::writting::writing

;x

;y
::yoht::yacht

;z
