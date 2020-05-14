global first_hit := A_TickCount
global second_hit := A_TickCount
global flag := False

;
;jfVincentjfVincentjfVincentjfVincentjfVincentjfVincentjfVincent   
;jfVincent

~v::
    if (flag = True) {
        tlapse := A_TickCount - first_hit
        Send {BackSpace}
        ; Send vincent
        Send %tlapse% ,
    }
    flag := false
    return

RAlt::
    flag := True
    first_hit := A_TickCount
    Hotkey, ^z, MyLabel, On
    Hotkey, d, MyLabelD, On
    Hotkey, j & f, MyLabelJF, On
    return

RAlt Up::
Hotkey, ^z, Off
Hotkey, d, Off
Hotkey, j & f, Off
return

MyLabel:
MsgBox You pressed %A_ThisHotkey%.
return

MyLabelD:
    Send, {Right}
return

MyLabelJF:
    Send, jfVincent
return