#InstallKeybdHook
#InstallMouseHook

Browser_Home::
 Send, !+d
 sleep, 200
 Send, j
return


~j::
    KeyWait, j			; wait for j to be released
    KeyWait, j, D T0.2		; and pressed again within 0.2 seconds
    if ErrorLevel 			; timed-out (only a single press)
        return
    Else {
       Input, UserInput, V T3 L6 C, {enter}.{esc}{tab}, c,d,e,b5,b2,b3,b4,m,l,i,r,sl,h,f,;
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
        case "d":   Send, {backspace 3}!+d
        case "c":   Send, {backspace 3}^1
        case "f":   Send, {backspace 3}^f
        case "h":   Send, {backspace 3}^!h
        case "e":  Send, {backspace 3}^e
        case "l":  Send, {backspace 3}^l
        case ";":  Send, {backspace 3}!m
        
        case "i":  Send, {backspace 3}^+i
        case "m":  
            Send, {backspace 3}
            ;MouseMove, 1200, 1100
            ;MouseMove, 600, -1830, 10, R
            ;Send {Click}
        
        case "b2":    Send, {backspace 4}!+2
        case "sl":    Send, {backspace 4}^+l
        case "b3":    Send, {backspace 4}!+3
        case "b4":    Send, {backspace 4}!+4
        case "b5":    Send, {backspace 4}!+5
        case "r":  Send, {backspace 3}^+b
}
return
    }
     
