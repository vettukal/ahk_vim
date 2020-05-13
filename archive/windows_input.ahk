!v::
Send vmathew
Send {Enter}

~u::
    KeyWait, u			; wait for u to be released
    KeyWait, u, D T0.2		; and pressed again within 0.2 seconds
    if ErrorLevel 			; timed-out (only a single press)
        return
    Else {
       Input, UserInput, V T3 L6 C, {enter}.{esc}{tab}, r
        switch ErrorLevel
        {
        case "Max":
            ;MsgBox, You entered "%UserInput%", which is the maximum length of text.
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
        
        case "r":  Send, {backspace 3}{AppsKey}
}
return
    }
     
