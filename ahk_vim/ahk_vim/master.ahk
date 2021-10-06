#Include clip.ahk
SetBatchLines, -1
SendMode, Input

global first_hit := A_TickCount
global second_hit := A_TickCount
global cap_hit := A_TickCount
global flag := False

global fullLineClip := ""
global targetChar := ""
global flagForwardSearch := False
global forward_timer := A_TickCount

global ticker_count := 0


global c_flag := False
global c_timer := A_TickCount

Capslock::
    tlapse := A_TickCount - cap_hit
    if(tlapse < 400) {
        Send à
    } else {
        Send {f10}
    }
    cap_hit := A_TickCount
return

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
+^!r::Suspend

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
    forward_timer := A_TickCount
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
    flag := false ; what the literal fck
    return

~Space::
    f_laps := A_TickCount - forward_timer
    if(f_laps < 2000) {
        if(flagForwardSearch = True) {
            flagForwardSearch := False
            Send, {BackSpace 1}
        }
        return
    }
    

~Esc:: 
    if(flagForwardSearch = True) {
        flagForwardSearch := False
    }
    return


ticker() {
    
    ticker_count := ticker_count + 1
    if(Mod(ticker_count, 2) = 0) {
        ticker_count := 0
        if( (A_TickCount - second_hit) <750) {
            flag := False 
            Send {Alt Down}{Tab}{Alt Up} 
        }
    } else {
        second_hit := A_TickCount
    }
    
}


MyLabel:
MsgBox You pressed %A_ThisHotkey%.
return

MyLabelS:
    c_lapse := A_TickCount - c_timer
    if(c_lapse < 1000) {
        Send ^s
        return
    }
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
    c_lapse := A_TickCount - c_timer
    if(c_lapse < 1000) {
        UniqueID := WinActive("ahk_exe Code.exe")
        if (UniqueID) {
            Send ^{Enter}
            return
        } 
    }
    Send {End}
return
MyLabelR:
    c_lapse := A_TickCount - c_timer
    if(c_lapse < 1000) {
        ; UniqueID := WinActive("ahk_exe Code.exe")
        ; if (UniqueID) 
        ; {
            Send !{Enter}
            return
        ; } 
    }
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
MyLabelJA:
    Send ^{Left}
return
MyLabelJD:
    Send ^{Right}
return
MyLabelJQ:
    Send ^{Home}
return
MyLabelJE:
    Send ^{End}
return
;; navigation number
MyLabel1:
    CoordMode, Mouse, Screen
    MouseGetPos, X, Y
    DllCall("SetCursorPos", "int", -1600, "int", 150)
    MouseClick
return 

MyLabel2:
    CoordMode, Mouse, Screen
    MouseGetPos, X, Y
    DllCall("SetCursorPos", "int", 390, "int", 50)
    MouseClick
return
MyLabel3:
    CoordMode, Mouse, Screen
    MouseGetPos, X, Y
    DllCall("SetCursorPos", "int", 173, "int", 116)
    MouseClick
return


MyLabelC:
    tlapse := A_TickCount - c_timer
    if(tlapse < 700) {
        Send ^c
        return
    }
    c_flag := True
    c_timer := A_TickCount
return 

MyLabelV:
    c_lapse := A_TickCount - c_timer
    if(c_lapse < 1000) {
        Send ^v
        return
    }
return

MyLabelT:
    c_lapse := A_TickCount - c_timer
    if(c_lapse < 1000) {
        Send ^{Tab}
        return
    }
return

MyLabelG:
    c_lapse := A_TickCount - c_timer
    if(c_lapse < 1000) {
        Send +!/
        return
    }
    Send !/
return

MyLabelD:
    c_lapse := A_TickCount - c_timer
    if(c_lapse < 1000) {
        Send ^d
        return
    }
    f_laps := A_TickCount - forward_timer
    
    if(f_laps < 1500) {
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
            forward_timer := A_TickCount
            return
        }
    }
     
    
    Send {Right}
    
return