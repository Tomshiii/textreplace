;// This function is required to close the active textreplace script & replace it with a new one
;// then rerun the script

; { \\ #Includes
#Include '%A_Appdata%\tomshi\lib'
#Include Functions\detect.ahk
; }

SetWorkingDir("..\")
detect()
if WinExist("textreplace.ahk",, "Visual Studio Code")
    WinClose("textreplace.ahk",,, "Visual Studio Code")
try FileMove(A_WorkingDir "\temp.ahk", A_WorkingDir "\textreplace.ahk", 1)
Run("textreplace.ahk")