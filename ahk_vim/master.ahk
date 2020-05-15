#Include clip.ahk
SetBatchLines, -1
SendMode, Input

global first_hit := A_TickCount
global second_hit := A_TickCount
global flag := False

global fullLineClip := ""
global targetChar := ""
global flagForwardSearch := False

global ticker_count := 0

charCommand() 
{
    
    Input, UserInput, V T2 L4 C, {enter}.{esc}{tab}, d,l
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
            return
        case "l": 
            Send, {BackSpace 2}  
            Send, ^+l
            return
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
            flag := False
            return
        }
        charCommand()
    } else 
    flag := false
    return
                 
~Space::
    if(flagForwardSearch = True) {
        flagForwardSearch := False
        Send, {BackSpace 1}
    }
    return

~Esc:: 
    if(flagForwardSearch = True) {
        flagForwardSearch := False
    }
    return

RAlt::
    flag := True
    first_hit := A_TickCount
    Hotkey, ^z, MyLabel, On
    Hotkey, d, MyLabelD, On
    Hotkey, s, MyLabelS, On
    Hotkey, a, MyLabelA, On
    Hotkey, w, MyLabelW, On
    Hotkey, q, MyLabelQ, On
    Hotkey, g, MyLabelG, On
    Hotkey, e, MyLabelE, On
    Hotkey, r, MyLabelR, On

    Hotkey, k & e, MyLabelKE, On
    Hotkey, k & q, MyLabelKQ, On
    Hotkey, k & a, MyLabelKA, On
    Hotkey, k & s, MyLabelKS, On
    Hotkey, k & d, MyLabelKD, On
    Hotkey, k & w, MyLabelKW, On
    return

RAlt Up::
    Hotkey, ^z, Off
    Hotkey, d, Off
    Hotkey, s, Off
    Hotkey, a, Off
    Hotkey, w, Off
    Hotkey, q, Off
    Hotkey, e, Off
    Hotkey, g, Off
    Hotkey, r, Off

    Hotkey, k & e, Off
    Hotkey, k & q, Off
    Hotkey, k & a, Off
    Hotkey, k & s, Off
    Hotkey, k & d, Off
    Hotkey, k & w, Off
    
    ticker()
return


ticker() {
    
    ticker_count := ticker_count + 1
    if(Mod(ticker_count, 2) = 0) {
        ticker_count := 0
        if( (A_TickCount - second_hit) <750) {
            flag := False 
            Send, {Enter}
        }
    } else {
        second_hit := A_TickCount
    }
    
}


MyLabel:
MsgBox You pressed %A_ThisHotkey%.
return

MyLabelS:
    Send {Down}
    return
MyLabelW:
    Send {Up}
    return
MyLabelA:
    Send {Left}
return
MyLabelQ:
    Send {Home}
return
MyLabelE:
    Send {End}
return
MyLabelR:
    Send ^+{Right}
return
MyLabelKE:
    Send +{End}
return
MyLabelKQ:
    Send +{Home}
return
MyLabelKA:
    Send +{Left}
return
MyLabelKS:
    Send +{Down}
return
MyLabelKD:
    Send +{Right}
return
MyLabelKW:
    Send +{Up}
return
MyLabelG:
    UniqueID := WinActive("ahk_exe Code.exe")
    if (UniqueID) {
        Send ^+w
    }    
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


