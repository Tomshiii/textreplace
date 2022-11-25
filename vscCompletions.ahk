; This script is a collection of autocompletions to help type things relating to my repo faster within vscode (or any editor)
; This file does not need to be run individually and is #Included within textreplace.ahk

#HotIf WinActive(browser.winTitle["vscode"])

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

:o:blockon::block.On()
:o:blockoff::block.Off()

;***
;quickly type out includes

base := "{Raw}#Include "

class Classes {
    static classLoc := base "<\Classes"
	static __Item := Map(
		"block",		this.classLoc "\block>",
		"tool",			this.classLoc "\tool>",
		"ptf",			this.classLoc "\ptf>",
		"coord",		this.classLoc "\coord>",
		"switchTo",		this.classLoc "\switchTo>",
		"Move",			this.classLoc "\Move>",
		"winget",		this.classLoc "\winget>",
		"dark",		    this.classLoc "\dark>",
		"pause",		this.classLoc "\pause>",
	)
}

class Apps {
    static appsLoc := base "<\Classes\Apps"
    static editorsLoc := this.appsLoc "\Editors"
    static __Item := Map(
        "discord",      this.appsLoc "\Discord>",
        "vscode",      this.appsLoc "\VSCode>",

        "premiere",      this.editorsLoc "\Premiere>",
        "photoshop",      this.editorsLoc "\Photoshop>",
        "ae",      this.editorsLoc "\After Effects>",
        "resolve",      this.editorsLoc "\Resolve>",
    )
}

;// inc

	;{ // root
	:ox:incwindows::Send(base "<\Windows>")
	:ox:incguis::Send(base "<\GUIs>")
	:ox:incgui::Send(base "<\GUIs>")
	;}

	;{ // classes
	:o:incclasses:: { ;include all classes
		for key in Classes[]
			Send(Classes[key] "`n")
	}
	;individual
	:ox:incblock::Send(Classes["block"])
	:ox:inctool::Send("" Classes["tool"])
	:ox:incptf::Send(Classes["ptf"])
	:ox:inccoord::Send(Classes["coord"])
	:ox:incswitchto::Send(Classes["switchTo"])
	:ox:incmove::Send(Classes["Move"])
	:ox:incwinget::Send(Classes["winget"])
	:ox:incdark::Send(Classes["dark"])
	:ox:incpause::Send(Classes["pause"])
	;} //

	;{ // ksa
	:ox:incksa::Send(base "<\KSA\Keyboard Shortcut Adjustments>")
	;}

	;{ // Apps
	:ox:incdiscord::Send(Apps["discord"])
	:ox:incvscode::Send(Apps["vscode"])
        ;{ // Editors
        :ox:incpremiere::Send(Apps["premiere"])
        :ox:incphotoshop::Send(Apps["photoshop"])
        :ox:incae::Send(Apps["ae"])
        :ox:incresolve::Send(Apps["resolve"])
	;}

;\\

#HotIf ;reset back to normal