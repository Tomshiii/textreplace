#SingleInstance Force

; { \\ #Includes
#Include <Classes\ptf>
#Include <Classes\tool>
;The below are not necessary for this script to run
#Include *i vscCompletions.ahk
#Include *i quickHotstring.ahk
; }

TraySetIcon(ptf.Icons "\text.png")

; This script will continue to be a long term work in progress and will move quite slowling in comparison to everything else

#+e::
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
}

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
	ClipWait("2")
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
;{ a
::abboration::aberration
::abbrasive::abrasive
::aboration::aberration
::absolutley::absolutely
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
::arguements::arguments
::asign::assign
::assignement::assignment
::assosiate::associate
::assosiated::associated
::attatch::attach
::axolotil::axolotl
;}

;{ b
::backig::backing
::balistic::ballistic
::barrelling::barreling
::behemouth::behemoth
::blatently::blatantly
::booleen::boolean
::bototm::bottom
::burdon::burden
::buyt::but
;}

;{ c
::catestrophic::catastrophic
::condensor::condenser
::comapre::compare
::committment::commitment
::compisition::composition
::contriversy::controversy
::cooincidence::coincidence
::critisism::criticism
::critisisms::criticism
::culperate::culprit
::curosor::cursor
;}

;{ d
::deminishing::diminishing
::demorilising::demoralising
::deoderant::deodorant
::dependancy::dependency
::dependancies::dependencies
::dependant::dependent
::desparate::desperate
::desparately::desperately
::devistating::devastating
::dichotamy::dichotomy
::disablled::disabled
::disengenious::disingenuous
::dissapointed::disappointed
;}

;{ e
::effeciency::efficiency
::elequent::eloquent
::enitre::entire
::erganomic::ergonomic
::espically::especially
::esspecially::especially
::everthing::everything
::excersise::exercise
::existant::existent
::explaination::explanation
::explanitory::explanatory
::exploaded::exploded
::extrodinaire::extraordinaire
;}

;{ f
::fasinating::fascinating
::flabergasted::flabbergasted
::fore::for
::functino::function
::functuality::functionality
;}

;{ g
::geenie::genie
::guage::gauge
::guantlet::gauntlet
;}

;{ h
::happebn::happen
::happenb::happen
::harrass::harass
::harrassing::harassing
::harrassment::harassment
;}

;{ i
::impatiant::impatient
::inevitibly::inevitably
::inherant::inherent
::inherantly::inherently
::insited::insisted
::instantlly::instantly
::interesed::interested
::interlectual::intellectual
::interperet::interpret
::interupted::interrupted
::invoive::invoice
::invoives::invoices
::irrelevency::irrelevancy
::irrelevent::irrelevant
;}

;{ j
;}

;{ k
;}

;{ l
::literaelly::literally
::literaly::literally
::luxery::luxury
;}

;{ m
::maner::manner
::manor::manner
::manufactored::manufactured
::manufatoring::manufacturing
::matress::mattress
::mispell::misspell
::moseied::moseyed
::moterbike::motorbike
;}

;{ n
::neccesary::necessary
::neccessary::necessary
::notible::notable
::noticably::noticeably
::nuisense::nuisance
::nusense::nuisance
;}

;{ o
::obssesed::obsessed
::obssessed::obsessed
::obssession::obsession
::occassion::occasion
::occassionally::occasionally
::occassions::occasions
::occurance::occurrence
::occurances::occurrences
::occurence::occurrence
::occurences::occurrences
::occured::occurred
::occuring::occurring
::ommit::omit
::ommitted::omitted
::overal::overall
::overide::override
;}

;{ p
::paramater::parameter
::persuing::pursuing
::preffered::preferred
::prefice::preface
::preperation::preparation
::pretyty::pretty
::privilage::privilege
::privilages::privileges
;}

;{ q
;}

;{ r
::realisttically::realistically
::reciepts::receipts
::recieve::receive
::redundent::redundant
::refferal::referral
::rejoyce::rejoice
::repetative::repetitive
::repoduce::reproduce
::resoltion::resolution
;}

;{ s
::scamed::scammed
::scedadle::skedaddle
::seratonin::serotonin
::smouldering::smoldering
::soley::solely
::soly::solely
::structered::structured
::suceed::succeed
::suceeded::succeeded
::sucess::success
::sucessful::successful
::sucessfull::successful
::sudo::pseudo
::superceed::supersede
::superceeded::superseded
::supress::suppress
::supressed::suppressed
::syntatically::syntactically
;}

;{ t
::technicion::technician
::tedius::tedious
::tomorroqw::tomorrow
::transfered::transferred
::transparancy::transparency
::trialing::trialling
::tyope::type
;}

;{ u
::udpates::updates
::unneccesarry::unnecessary
::unneccesary::unnecessary
::unneccessary::unnecessary
;}

;{ v
::vaccum::vacuum
::vandetta::vendetta
::varient::variant
::verticle::vertical
;}

;{ w
::wabble::wobble
::whenver::whenever
::whinning::whining
::withing::within
::worthwile::worthwhile
::writting::writing
;}

;{ x
;}

;{ y
::yoht::yacht
;}

;{ z
;}