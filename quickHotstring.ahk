#+h::quickHotstring()

quickHotstring() { ;original code found here: https://lexikos.github.io/v2/docs/commands/Hotstring.htm#Examples - minor adjustments by me to make it default to how I have my hotstrings
    ; Get the text currently selected. The clipboard is used instead of
    ; EditGetSelectedText because it works in a greater variety of editors
    ; (namely word processors).  Save the current clipboard contents to be
    ; restored later. Although this handles only plain text, it seems better
    ; than nothing:
    ClipboardOld := ClipboardAll()
    A_Clipboard := "" ; Must start off blank for detection to work.
    Send "^c"
    if !ClipWait(0.3)  ; ClipWait timed out.
    {
        A_Clipboard := ClipboardOld ; Restore previous contents of clipboard before returning.
        ShowInputBox("::::", "{End}{Left 2}")
        return
    }
    ; Replace CRLF and/or LF with `n for use in a "send-raw" hotstring:
    ; The same is done for any other characters that might otherwise
    ; be a problem in raw mode:
    ClipContent := StrReplace(A_Clipboard, "``", "````")  ; Do this replacement first to avoid interfering with the others below.
    ClipContent := StrReplace(ClipContent, "`r`n", "``n")
    ClipContent := StrReplace(ClipContent, "`n", "``n")
    ClipContent := StrReplace(ClipContent, "`t", "``t")
    ClipContent := StrReplace(ClipContent, "`;", "```;")
    ClipContent := Trim(ClipContent, " ")
    A_Clipboard := ClipboardOld  ; Restore previous contents of clipboard.
    ShowInputBox("::" ClipContent "::")
}

ShowInputBox(DefaultValue, inputs := "")
{
    ; This will move the input box's caret to a more friendly position:
    SetTimer MoveCaret, 10
    ; Show the input box, providing the default hotstring:
    IB := InputBox("
    (
    Add the correct spelling for the word at the end of the hotstring. You can also change the misspelt word if you wish.

    Example entry: ::btw`::by the way
    )", "New Hotstring",, Trim(DefaultValue))
    if IB.Result = "Cancel"  ; The user pressed Cancel.
        return

    if RegExMatch(IB.Value, "(?P<Label>:.*?:(?P<Abbreviation>.*?))::(?P<Replacement>.*)", &Entered)
    {
        if !Entered.Abbreviation
            MsgText := "You didn't provide an abbreviation"
        else if !Entered.Replacement
            MsgText := "You didn't provide a replacement"
        else
        {
            ; Hotstring Entered.Label, Entered.Replacement  ; Enable the hotstring now.
            appVal := StrLower(Trim(IB.Value, " "))
            __append(appVal)
        }
    }
    else
        MsgText := "The hotstring appears to be improperly formatted"

    if IsSet(MsgText)
    {
        Result := MsgBox(MsgText ". Would you like to try again?",, 4)
        if Result = "Yes"
            quickHotstring()
    }

    MoveCaret()
    {
        WinWait("New Hotstring",, 2)
        ; Otherwise, move the input box's insertion point to where the user will type the abbreviation.
        ; Send "{Home}{Right 2}"
        if inputs != ""
            SendInput(inputs)
        SetTimer , 0
    }
}

/**
 * This function will automatically place new additions into the correctly sorted position
 * @param {String} appendText the hotstring text passed into the function by the GUI
 */
__append(appendText) {
    iniPath     := A_ScriptDir "\autocorrections.ini"
    appendSplit := StrSplit(Trim(appendText, " `r`n"), "::")
    if appendSplit.Length > 2
        appendSplit.RemoveAt(1)
    sectionChar := SubStr(appendSplit[1], 1, 1)
    ;// check to ensure the value doesn't already exist so it isn't potentially overridden
    if IniRead(iniPath, sectionChar, appendSplit[1], false) != false {
        MsgBox("Value may already exist!")
        return
    }
    ;// add the value, then read the entire section, then sort it alphabetically
    IniWrite(appendSplit[2], iniPath, sectionChar, appendSplit[1])
    readSection := Sort(IniRead(iniPath, sectionChar), "C0")
    splitSection := StrSplit(readSection, ["=", "`n", "`r"])
    ;// delete all values already in the section
    for k, v in splitSection {
        if Mod(k, 2) = 0
			continue
		if k+1 > splitSection.Length
			break
        try IniDelete(iniPath, sectionChar, v)
    }
    ;// rewrite the section, sorted alphabetically
    for k, v in splitSection {
        if Mod(k, 2) = 0
            continue
        if k+1 > splitSection.Length
            break
        IniWrite(splitSection[k+1], iniPath, sectionChar, v)
    }
}