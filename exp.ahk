#Include clip.ahk
SetBatchLines, -1
SendMode, Input

global vare := ""
global targetChar := ""

!h::
    CoordMode, Caret, Screen
	x := A_CaretX
	y := A_CaretY + 20
    
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
    ; MsgBox % vare ;
    tw := posiii-1
    Send {Right %posiii%}
    return
    ; Loop, % tw
    ; {
    ;     Send {Right}
    ; }

!n::
    Send {Right}
    
    Send +{End}
    vare := Clip()
    Send {Left}
    ; MsgBox "nfunc" %vare%
    posiii := InStr(vare,targetChar) ;
    posiii := posiii - 1
    substart := posiii + 2
    vare := SubStr(vare, substart)
    ; MsgBox % vare ;
    tw := posiii-1
    Send {Right %posiii%}
    return
; !m::

; Send +{End}
; vare := Clip()
; Send {Left}
; Send +{Home}
; varh := Clip()
; Send {Right}
; ;MsgBox, % vare the fox says cows to to tremble before the lord
; return