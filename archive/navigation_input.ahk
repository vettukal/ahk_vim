~n::
    KeyWait, n			; wait for j to be released
    KeyWait, n, D T0.2		; and pressed again within 0.2 seconds
    if ErrorLevel 
        return
    Else {
        Suspend, off
        Gui, +AlwaysOnTop +Disabled -SysMenu +Owner  ; +Owner avoids a taskbar button.
        Gui, Add, Text,, Navigation is on
        Gui, Show, NoActivate, Navigation  ;
        Send, {backspace 2} 
        return
    }
    
    

u::
    
    send {up}
    return
h::
    
    send {left}
    return

k::
    
    send {right}
    return

j::
    
    send {down}
    return


~a::
~b::

~c::

~d::

~e::

~f::

~g::

~i::

~l::

~m::

~o::

~p::

~q::

~r::

~s::

~t::

~v::

~w::

~x::

~y::

~z::
    Suspend, on
    Gui, Cancel