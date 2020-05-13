~j::
    KeyWait, j			; wait for j to be released
    KeyWait, j, D T0.2		; and pressed again within 0.2 seconds
    if ErrorLevel 			; timed-out (only a single press)
        return
    Else {
        Send {BackSpace}
        Send {BackSpace}
        KeyWait, d, D T1
            if ErrorLevel 			; timed-out (only a single press)
                return
            else {
                Send {BackSpace}
                send, !+d
            }

        KeyWait, e, D T1
            if ErrorLevel 			; timed-out (only a single press)
                return
            else {
                Send {BackSpace}
                send, {ctrle}
            }        
    }
        
Return

~CapsLock::
    KeyWait, CapsLock 
    KeyWait, CapsLock, D T0.5
    if ErrorLevel 			; timed-out (only a single press)
        return
    Else {
        Send double
    }
    Return