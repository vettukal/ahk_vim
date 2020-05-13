!v::
Send vmathew
Send {Enter}

1::
    CoordMode, Mouse, Screen
    MouseGetPos, X, Y
    DllCall("SetCursorPos", "int", -8070, "int", 1608)
    MouseClick
    return 


2::
    CoordMode, Mouse, Screen
    MouseGetPos, X, Y
    DllCall("SetCursorPos", "int", -3370, "int", 1408)
    MouseClick
    return 

3::
    CoordMode, Mouse, Screen
    MouseGetPos, X, Y
    DllCall("SetCursorPos", "int", 1903, "int", 701)
    MouseClick
    return 

    
5::
    MouseClick
    return 

9::
    
    send {up}
    return
7::
    
    send {left}
    return

0::
    
    send {right}
    return

^8::
    
    send +{down}
    return

^9::
    
    send +{up}
    return
^7::
    
    send +^{left}
    return

6::
    
    send +^{right}
    return

^0::
    
    send +^{right}
    return

8::
    
    send {down}
    return

!7::
    CoordMode, Mouse, Screen
    MouseGetPos, X, Y
    X -= 40
    DllCall("SetCursorPos", "int", X, "int", Y)
    return 

!8::
    CoordMode, Mouse, Screen
    MouseGetPos, X, Y
    Y += 40
    DllCall("SetCursorPos", "int", X, "int", Y)
    return 



!9::
    CoordMode, Mouse, Screen
    MouseGetPos, X, Y
    Y -= 40
    DllCall("SetCursorPos", "int", X, "int", Y)
    return 
            
!0::
    CoordMode, Mouse, Screen
    MouseGetPos, X, Y
    X += 40
    DllCall("SetCursorPos", "int", X, "int", Y)
    return 

>!j::
    send, left alt pressed
    return
