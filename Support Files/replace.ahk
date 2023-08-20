;// This function is required to close the active textreplace script & replace it with a new one
;// then rerun the script

; { \\ #Includes
#Include <Functions\detect>
; }

SetWorkingDir("..\")
detect()
if WinExist("textreplace.ahk")
    WinClose("textreplace.ahk")
try FileMove(A_WorkingDir "\temp.ahk", A_WorkingDir "\textreplace.ahk", 1)
Run("textreplace.ahk")