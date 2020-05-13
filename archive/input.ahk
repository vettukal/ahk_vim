CapsLock::
Input, UserInput, V T3 L6 C, {enter}.{esc}{tab}, d,e,fl,ahk,ca
switch ErrorLevel
{
case "Max":
    MsgBox, You entered "%UserInput%", which is the maximum length of text.
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
case "d":   Send, {backspace 2} !+d
case "e":  Send, {backspace 2} ^e
case "fl":    Send, {backspace 3}Florida
case "ca":    Send, {backspace 3}California
case "ahk":   Run, https://www.autohotkey.com
}
return