; This script is a collection of autocompletions to help type things relating to my repo faster within vscode (or any editor)
; This file does not need to be run individually and is #Included within textreplace.ahk

; { \\ #Includes
#Include <Classes\ptf>
; }

#HotIf WinActive(browser.vscode.winTitle)

:o:toolc:: {
	Send("{Raw}tool.Cust(`"`")")
	SendInput("{Left 2}")
}
:o:toolf:: {
	Send("{Raw}tool.Cust(`"`",, 1)")
	SendInput("{Left 6}")
}
:o:toolw::tool.Wait()

:o:coords::coord.s()
:o:coordw::coord.w()
:o:coordc::coord.c()
:o:coordclient::coord.client()

:o:blockon::block.On()
:o:blockoff::block.Off()

;***
;quickly type out includes

base := "{Raw}#Include "

class Classes {
    static classLoc := base "<Classes"
	static __Item   := Map(
		"block",		this.classLoc "\block>",
		"clip",			this.classLoc "\clip>",
		"coord",		this.classLoc "\coord>",
		"dark",		    this.classLoc "\dark>",
		"Move",			this.classLoc "\Move>",
		"obj",			this.classLoc "\obj>",
		"pause",		this.classLoc "\pause>",
		"ptf",			this.classLoc "\ptf>",
		"switchTo",		this.classLoc "\switchTo>",
		"timer",		this.classLoc "\timer>",
		"tool",			this.classLoc "\tool>",
		"winget",		this.classLoc "\winget>",
	)
}

class Apps {
    static appsLoc    := base "<Classes\Apps"
    static editorsLoc := base "<Classes\Editors"
    static __Item     := Map(
        "discord",      this.appsLoc "\Discord>",
        "vscode",       this.appsLoc "\VSCode>",

        "premiere",     this.editorsLoc "\Premiere>",
        "photoshop",    this.editorsLoc "\Photoshop>",
        "ae",      		this.editorsLoc "\After Effects>",
        "resolve",      this.editorsLoc "\Resolve>",
    )
}

;// inc
	;{ //inc
	:o:incinc::{
		Send("{Raw}; { \\ #Includes`n`n; ") ;vscode autogenerates and ending brace
		SendInput("{Up}")
	}
	;}

	;{ // root
	:ox:incguis::Send(base "<GUIs\")
	:ox:incgui::Send(base "<GUIs\")
	;}

	;{ // classes
	:o:incclasses:: { ;include all classes
		for key in Classes[]
			Send(Classes[key] "`n")
	}
	;individual
	:ox:incclass::Send(base "<Classes\")
	:ox:incblock::Send(Classes["block"])
	:ox:incclip::Send(Classes["clip"])
	:ox:inccoord::Send(Classes["coord"])
	:ox:inccoords::Send(Classes["coord"])
	:ox:incdark::Send(Classes["dark"])
	:ox:incmove::Send(Classes["Move"])
	:ox:incobj::Send(Classes["obj"])
	:ox:incpause::Send(Classes["pause"])
	:ox:incptf::Send(Classes["ptf"])
	:ox:incswitchto::Send(Classes["switchTo"])
	:ox:inctimer::Send(Classes["timer"])
	:ox:inctool::Send(Classes["tool"])
	:ox:incwinget::Send(Classes["winget"])
	;} //

	;{ // ksa
	:ox:incksa::Send(base "<KSA\Keyboard Shortcut Adjustments>")
	;}

	;{ // Apps
	:ox:incdiscord::Send(Apps["discord"])
	:ox:incvscode::Send(Apps["vscode"])
        ;{ // Editors
        :ox:incpremiere::Send(Apps["premiere"])
        :ox:incprem::Send(Apps["premiere"])
        :ox:incphotoshop::Send(Apps["photoshop"])
        :ox:incps::Send(Apps["photoshop"])
        :ox:incae::Send(Apps["ae"])
        :ox:incresolve::Send(Apps["resolve"])
	;}

	;{ // funcs
	funcs := base "<Functions"
	:ox:incfunc::Send(funcs "\")
	:ox:incfuncs::Send(funcs "\")

	:ox:incimg::Send(funcs "\checkImg>")
	:ox:incdelay::Send(funcs "\delaySI>")
	:ox:incdelaysi::Send(funcs "\delaySI>")
	:ox:incdetect::Send(funcs "\detect>")
	:ox:incerror::Send(funcs "\errorLog>")
	:ox:incerrorlog::Send(funcs "\errorLog>")
	:ox:incgethotkeys::Send(funcs "\getHotkeys>")
	;}

	;{ // Other
	Other := base "<Other"
	:ox:incOther::Send(Other "\")
	:ox:incOthers::Send(Other "\")

	:ox:incprint::Send(Other "\print>")
	:ox:incjson::Send(Other "\JSON>")
	;}

;\\

#HotIf ;reset back to normal