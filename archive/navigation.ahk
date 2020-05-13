~f & u::
    
    Suspend, off
    Gui, +AlwaysOnTop +Disabled -SysMenu +Owner  ; +Owner avoids a taskbar button.
    Gui, Add, Text,,Navigation is on
    Gui, Show, NoActivate,  Navigation;
    
    Send, {backspace 1} 
    return
    return


w::
    
    send {up}
    return
a::
    
    send {left}
    return

d::
    
    send {right}
    return

s::
    
    send {down}
    return

+w::
    
    send +{up}
    return
+a::
    
    send +{left}
    return

+d::
    
    send +{right}
    return

+s::
    
    send +{down}
    return


~j::
~b::

~c::

~e::

~f::

~g::


~l::

~m::

~n::

~o::

~p::

~q::

~r::

~k::
~t::

~v::

~i::

~x::

~y::

space::
    

~z::
    Suspend, on
    Gui, Cancel