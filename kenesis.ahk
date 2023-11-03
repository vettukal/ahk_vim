!v::
	Send vmathew@starbucks.com{Enter}
return 

#If GetKeyState("Ctrl", "P")  ; If Ctrl is pressed, the following hotkeys are active

; This hotkey only activates when Ctrl is held down
F9 & Right::  ; When F9 and Right Arrow are pressed together
    Send, #+{Right}  ; Send Win+Shift+Right Arrow
    return

; This hotkey only activates when Ctrl is held down
F9 & Left::  ; When F9 and Right Arrow are pressed together
    Send, #+{Left}  ; Send Win+Shift+Right Arrow
    return

F9 & j::  ; When F9 and Right Arrow are pressed together
    Send, #{Left}  ; Send Win+Shift+Right Arrow
    return

F9 & l::  ; When F9 and Right Arrow are pressed together
    Send, #{Right}  ; Send Win+Shift+Right Arrow
    return

F9 & i::  ; When F9 and Right Arrow are pressed together
    Send, #{Up}  ; Send Win+Shift+Right Arrow
    return

F9 & k::  ; When F9 and Right Arrow are pressed together
    Send, #{Down}  ; Send Win+Shift+Right Arrow
    return
#If  ; Turn off context sensitivity


