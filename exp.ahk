#Include clip.ahk
SetBatchLines, -1
SendMode, Input

global vare := ""
global targetChar := ""

~Alt::
KeyWait, Alt
return

 	~Alt Up::
Send, {Alt Up}
return

!m::
    vare := ""
    targetChar := ""
    Input, SingleChar, L4, {Space}
    Send +{End}
    vare := Clip()
    targetChar := SingleChar
    Send {Left}
    posiii := InStr(vare,SingleChar) ;
    posiii := posiii - 1
    substart := posiii + 1
    vare := SubStr(vare, substart)
    Send {Right %posiii%}
    return

!n::
    vare := SubStr(vare, 2)
    Send {Right}
    
    ; Send +{End}
    ; vare := Clip()
    ; Send {Left}
    ; MsgBox "nfunc" %vare%
    posiii := InStr(vare,targetChar) ;
    if (posiii<1){
         Send {Left}
         return
    }
    posiii := posiii - 1
    substart := posiii + 1
    vare := SubStr(vare, substart)
    
    Send {Right %posiii%}
    return
; ;MsgBox, % vare the fox says cows to to tremble before the lord