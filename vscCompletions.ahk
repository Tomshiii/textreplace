; This script is a collection of autocompletions to help type things relating to my repo faster within vscode (or any editor)
; This file does not need to be run individually and is #Included within textreplace.ahk

; { \\ #Includes
#Include '%A_Appdata%\tomshi\lib'
#Include Classes\ptf.ahk
#Include Classes\Mip.ahk
; }

#HotIf WinActive(browser.vscode.winTitle)

;// formatting things
:o:<kbd:: {
	Send("{Raw}<kbd></kbd>")
	SendInput("{Left 6}")
}

:o:<u:: {
	Send("{Raw}<u></u>")
	SendInput("{Left 4}")
}

;// function replacements
:o:toolc:: {
	Send("{Raw}tool.Cust(`"`")")
	SendInput("{Left 2}")
}
:*:toolt`s:: { ;// only works with a space input
	Send("{Raw}tool.tray({text: `"`"})")
	SendInput("{Left 3}")
}
:o:toolw::tool.Wait()

:*:coords`t::coord.s() ;// only works with a tab input
:o:coordw::coord.w()
:o:coordc::coord.c()
:o:coordclient::coord.client()

:o:blockon::block.On()
:o:blockoff::block.Off()

;***
;quickly type out includes

base := "{Raw}#Include "

class Classes {
    static classLoc := base "Classes"
	static __Item   := Mip(
		"block",		this.classLoc "\block.ahk",
		"clip",			this.classLoc "\clip.ahk",
		"cmd",			this.classLoc "\cmd.ahk",
		"coord",		this.classLoc "\coord.ahk",
		"dark",		    this.classLoc "\dark.ahk",
		"ffmpeg",		this.classLoc "\ffmpeg.ahk",
		"keys",		    this.classLoc "\keys.ahk",
		"mip",		    this.classLoc "\Mip.ahk",
		"Move",			this.classLoc "\Move.ahk",
		"obj",			this.classLoc "\obj.ahk",
		"pause",		this.classLoc "\pause.ahk",
		"ptf",			this.classLoc "\ptf.ahk",
		"settings",		this.classLoc "\settings.ahk",
		"switchTo",		this.classLoc "\switchTo.ahk",
		"timer",		this.classLoc "\timer.ahk",
		"tool",			this.classLoc "\tool.ahk",
		"winget",		this.classLoc "\winget.ahk",
		"wm",		    this.classLoc "\wm.ahk",
		"ytdlp",		this.classLoc "\ytdlp.ahk",
		"errorLog",		this.classLoc "\errorLog.ahk",
		"log",		    this.classLoc "\log.ahk",
		"explorer",		this.classLoc "\explorer.ahk",
	)
}

class Apps {
    static appsLoc    := base "Classes\Apps"
    static editorsLoc := base "Classes\Editors"
    static __Item     := Map(
        "discord",      this.appsLoc "\Discord.ahk",
        "slack",        this.appsLoc "\Slack.ahk",
        "vscode",       this.appsLoc "\VSCode.ahk",

        "premiere",     this.editorsLoc "\Premiere.ahk",
        "photoshop",    this.editorsLoc "\Photoshop.ahk",
        "ae",      		this.editorsLoc "\After Effects.ahk",
        "resolve",      this.editorsLoc "\Resolve.ahk",
    )
}

;// inc
	;{ //inc
	:o:incinc::{
		Send("{Raw}; { \\ #Includes`n#Include '%A_Appdata%\tomshi\lib'`n; ") ;vscode autogenerates and ending brace
		SendInput("{Left 3}")
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
	:ox:inccmd::Send(Classes["cmd"])
	:ox:inccoord::Send(Classes["coord"])
	:ox:inccoords::Send(Classes["coord"])
	:ox:incdark::Send(Classes["dark"])
	:ox:incffmpeg::Send(Classes["ffmpeg"])
	:ox:inckeys::Send(Classes["keys"])
	:ox:incmip::Send(Classes["mip"])
	:ox:incmove::Send(Classes["Move"])
	:ox:incobj::Send(Classes["obj"])
	:ox:incpause::Send(Classes["pause"])
	:ox:incptf::Send(Classes["ptf"])
	:ox:incset::Send(Classes["settings"])
	:ox:incsett::Send(Classes["settings"])
	:ox:incsettings::Send(Classes["settings"])
	:ox:incswitchto::Send(Classes["switchTo"])
	:ox:inctimer::Send(Classes["timer"])
	:ox:inctool::Send(Classes["tool"])
	:ox:incwinget::Send(Classes["winget"])
	:ox:incwm::Send(Classes["wm"])
	:ox:incytdlp::Send(Classes["ytdlp"])
	:ox:incerror::Send(Classes["errorLog"])
	:ox:incerrorlog::Send(Classes["errorLog"])
	:ox:inclog::Send(Classes["log"])
	:ox:inclogs::Send(Classes["log"])
	:ox:incexplorer::Send(Classes["explorer"])
	;} //

	;{ // ksa
	:ox:incksa::Send(base "<KSA\Keyboard Shortcut Adjustments>")
	;}

	;{ // Apps
	:ox:incdiscord::Send(Apps["discord"])
	:ox:incslack::Send(Apps["slack"])
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
	:ox:incgethotkeys::Send(funcs "\getHotkeys>")
	;}

	;{ // Other
	Other := base "<Other"
	:ox:incOther::Send(Other "\")
	:ox:incOthers::Send(Other "\")

	:ox:incprint::Send(Other "\print>")
	:ox:incjson::Send(Other "\JSON>")
	:ox:incuia::Send(Other "\UIA\UIA>")
	:ox:incnotify::Send(Other "\Notify\Notify>")
	;}

;\\

;// reset hotif
#HotIf