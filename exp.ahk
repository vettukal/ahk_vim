#Include clip.ahk
SetBatchLines, -1
SendMode, Input

global fullLineClip := ""
global targetChar := ""
global flagForwardSearch := False

global first_hit := A_TickCount
global flagAltClick := False

;
;
;

~v::
    if (flagAltClick = True) {
        tlapse := A_TickCount - first_hit
        Send {BackSpace}
        ; Send vincent
        Send %tlapse% ,
    }
    flagAltClick := false
    return

RAlt::
    flagAltClick := True
    first_hit := A_TickCount
    Hotkey, ^z, MyLabel, On
    Hotkey, j & f, MyLabelJF, On
    return

RAlt Up::
    Hotkey, ^z, Off
    Hotkey, j & f, Off

    charCommand()
    return

charCommand() 
{
    Input, UserInput, V T2 L4 C, {enter}.{esc}{tab}, fd
    switch ErrorLevel
    {
    case "Max":
        ; MsgBox, You entered "%UserInput%", which is the maximum length of text.
        return
    case "Timeout":
        ; Send, {backspace 1}
        flagForwardSearch := False
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
        
        forward3CharSearch()
    
    }
    return
}


forward3CharSearch() {
    Send, {backspace 2}
        fullLineClip := ""
        targetChar := ""
        Input, SingleChar, L3, {Space}
        Send +{End}
        fullLineClip := Clip()
        targetChar := SingleChar
        Send {Left}
        posiii := InStr(fullLineClip,SingleChar) ;
        posiii := posiii - 1
        substart := posiii + 1
        fullLineClip := SubStr(fullLineClip, substart)
        Send {Right %posiii%}
        Suspend, off
        flagForwardSearch := True
        return
}

#if flagForwardSearch
{
    d::
        fullLineClip := SubStr(fullLineClip, 2)
        Send {Right}
        
        posiii := InStr(fullLineClip,targetChar) ;
        if (posiii<1){
            Send {Left}
            return
        }
        posiii := posiii - 1
        substart := posiii + 1
        fullLineClip := SubStr(fullLineClip, substart)
        
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
    ~Home::
    ~End::
    ~Left::
    ~Right::

    ~>!r::
    ~z::
        flagForwardSearch := False
        return

}



MyLabel:
MsgBox You pressed %A_ThisHotkey%.
return


MyLabelJF:
    Send, jfVincent
return