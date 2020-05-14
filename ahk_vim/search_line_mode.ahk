#Include clip.ahk
SetBatchLines, -1
SendMode, Input

global vare := ""
global targetChar := ""
global flag := False

~RAlt::
    KeyWait, RAlt			; wait for j to be released
    KeyWait, RAlt, D T0.2		; and pressed again within 0.2 seconds
    if ErrorLevel 			; timed-out (only a single press)
        return
    Else {
       Input, UserInput, V T1 L4 C, {enter}.{esc}{tab}, fd
        switch ErrorLevel
        {
        case "Max":
            ; MsgBox, You entered "%UserInput%", which is the maximum length of text.
            return
        case "Timeout":
            
            return
        case "NewInput":
            return
        default:
            if InStr(ErrorLevel, "EndKey:")
            {
                MsgBox, You entered "%UserInput%" and terminated the input with %ErrorLevel%.
                return
            }
        }
        switch UserInput
        {
        case "fd":   
            
            Send, {backspace 2}
            vare := ""
            targetChar := ""
            Input, SingleChar, L3, {Space}
            Send +{End}
            vare := Clip()
            targetChar := SingleChar
            Send {Left}
            posiii := InStr(vare,SingleChar) ;
            posiii := posiii - 1
            substart := posiii + 1
            vare := SubStr(vare, substart)
            Send {Right %posiii%}
            Suspend, off
            flag := True
            return
        
}
return
    }

#if flag
d::
    vare := SubStr(vare, 2)
    Send {Right}
    
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


~w::
~a::

~s::

~j::
~b::

~c::

~e::


~g::


~l::

~m::

~n::

~o::

~p::

~q::

~r::

~k::
~t::

~v::

~i::

~x::

~y::

space::

~z::
    flag := False

