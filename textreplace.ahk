#SingleInstance Force
#Requires AutoHotkey v2.0

; { \\ #Includes
#Include <Classes\ptf>
#Include <Classes\tool>
#Include <Functions\trayShortcut>
;The below are not necessary for this script to run
#Include *i vscCompletions.ahk
#Include *i quickHotstring.ahk
#Include *i personalHotstrings.ahk
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
;{ a
::abboration::aberration
::abbrasive::abrasive
::abhorent::abhorrent
::aboration::aberration
::absolutley::absolutely
::acceloratated::accelerated
::accelorate::accelerate
::acceloration::acceleration
::accessability::accessibility
::accessable::accessible
::accidently::accidentally
::accomidate::accommodate
::accomodate::accommodate
::adament::adamant
::admittidely::admittedly
::agressive::aggressive
::amazin::amazing
::antena::antenna
::aparent::apparent
::apparant::apparent
::applicible::applicable
::aprehensive::apprehensive
::aqcuiring::acquiring
::aquantences::acquaintances
::aquired::acquired
::arguement::argument
::arguements::arguments
::asign::assign
::assesment::assessment
::assignement::assignment
::assosiate::associate
::assosiated::associated
::attatch::attach
::attatched::attached
::axolotil::axolotl
;}

;{ b
::backig::backing
::balistic::ballistic
::barrelling::barreling
::becuase::because
::beggining::beginning
::begining::beginning
::behemouth::behemoth
::behing::behind
::blatently::blatantly
::booleen::boolean
::bototm::bottom
::burdon::burden
::buyt::but
;}

;{ c
::calibur::caliber
::catestrophic::catastrophic
::caviate::caveat
::comapre::compare
::committment::commitment
::compisition::composition
::concensus::consensus
::condensor::condenser
::contriversy::controversy
::cooincidence::coincidence
::coporation::corporation
::critisism::criticism
::critisisms::criticism
::culperate::culprit
::curosor::cursor
;}

;{ d
::deescelate::deescalate
::deminishing::diminishing
::demonstated::demonstrated
::demorilising::demoralising
::deoderant::deodorant
::dependancies::dependencies
::dependancy::dependency
::dependant::dependent
::desparate::desperate
::desparately::desperately
::devistating::devastating
::dichotamy::dichotomy
::digestable::digestible
::disablled::disabled
::disapear::disappear
::disect::dissect
::disengenious::disingenuous
::dissapointed::disappointed
::downlaod::download
;}

;{ e
::effeciency::efficiency
::elequent::eloquent
::encounted::encountered
::enitre::entire
::enthusiest::enthusiast
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
::greatful::grateful
::guage::gauge
::guantlet::gauntlet
;}

;{ h
::happebn::happen
::happenb::happen
::harrass::harass
::harrassing::harassing
::harrassment::harassment
::hinderance::hindrance
;}

;{ i
::immensly::immensely
::impatiant::impatient
::implomentation::implementation
::impossability::impossibility
::inadvertantly::inadvertently
::inaudable::inaudible
::incompetant::incompetent
::incrementially::incrementally
::incrimentally::incrementally
::inevitibly::inevitably
::inherant::inherent
::inherantly::inherently
::insited::insisted
::instantlly::instantly
::interesed::interested
::interfer::interfere
::interlectual::intellectual
::interperet::interpret
::interprated::interpreted
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
::libedo::libido
::likelyhood::likelihood
::literaelly::literally
::literaly::literally
::litereally::literally
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
::nepatism::nepotism
::neurodivergant::neurodivergent
::nothign::nothing
::notible::notable
::noticable::noticeable
::noticably::noticeably
::nuisence::nuisance
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
::occured::occurred
::occurence::occurrence
::occurences::occurrences
::occuring::occurring
::omited::omitted
::ommit::omit
::ommited::omitted
::ommitted::omitted
::outragiously::outrageously
::outragously::outrageously
::overal::overall
::overide::override
::overide::override
::overridding::overriding
::overzelous::overzealous
;}

;{ p
::paramater::parameter
::percieved::perceived
::persuing::pursuing
::preffered::preferred
::prefice::preface
::preperation::preparation
::pretyty::pretty
::prioritiesed::prioritised
::privilage::privilege
::privilages::privileges
::procces::process
::proccess::process
::propeganda::propaganda
::psudo::pseudo
::publically::publicly
;}

;{ q
::quiry::query
;}

;{ r
::realisttically::realistically
::reasses::reassess
::recepie::recipe
::recepies::recipes
::reciepts::receipts
::recieve::receive
::reciever::receiver
::recievers::receivers
::recieving::receiving
::redundent::redundant
::referal::referral
::refferal::referral
::rejoyce::rejoice
::repetative::repetitive
::repoduce::reproduce
::resoltion::resolution
::resteraunts::restaurants
::restraunts::restaurants
::ruccus::ruckus
;}

;{ s
::salaray::salary
::scamed::scammed
::scedadle::skedaddle
::sentimant::sentiment
::seratonin::serotonin
::sharable::shareable
::shortning::shortening
::smouldering::smoldering
::soley::solely
::soly::solely
::spliting::splitting
::spontaniously::spontaneously
::structered::structured
::subconcious::subconscious
::suceed::succeed
::suceeded::succeeded
::sucess::success
::sucessful::successful
::sucessfull::successful
::sucession::succession
::sudo::pseudo
::superceed::supersede
::superceeded::superseded
::suplimentary::supplementary
::supress::suppress
::supressed::suppressed
::syntatically::syntactically
;}

;{ t
::technicion::technician
::tedius::tedious
::teh::the
::tempromental::temperamental
::tomorroqw::tomorrow
::tought::taught
::transfered::transferred
::transparancy::transparency
::trialing::trialling
::tyope::typ
;}

;{ u
::ubruptly::abruptly
::udpates::updates
::unconciouosly::unconsciously
::uninpeaded::unimpeded
::unneccesarily::unnecessarily
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