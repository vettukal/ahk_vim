#Include clip.ahk
SetBatchLines, -1
SendMode, Input

global first_hit := A_TickCount
global second_hit := A_TickCount
global flag := False

global fullLineClip := ""
global targetChar := ""
global flagForwardSearch := False

charCommand() 
{
    
    Input, UserInput, V T2 L4 C, {enter}.{esc}{tab}, d
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
    case "d":   
        flag := false
        forward3CharSearch()
    }
    return
}

^!r::Reload  

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

~f::
    if (flag = True) {
        tlapse := A_TickCount - first_hit
        if(tlapse > 1000)
        {
            return
        }
        charCommand()
    } else 
    flag := false
    return

~Space::
    if(flagForwardSearch = True) {
        flagForwardSearch := False
        Send, {BackSpace}
    }
    return

RAlt::
    flag := True
    first_hit := A_TickCount
    Hotkey, ^z, MyLabel, On
    Hotkey, d, MyLabelD, On
    Hotkey, s, MyLabelS, On
    Hotkey, j & f, MyLabelJF, On
    return

RAlt Up::
    Hotkey, ^z, Off
    Hotkey, d, Off
    Hotkey, s, Off
    Hotkey, j & f, Off
return

MyLabel:
MsgBox You pressed %A_ThisHotkey%.
return

MyLabelS:
    Send {Right}
return

MyLabelD:
    if(flagForwardSearch = True) {
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
    } else {
        Send {Right}
    }
    
return


MyLabelJF:
    Send, jfVincent
return