^::
KeyWait, F9
KeyWait, Right
if GetKeyState("Ctrl", "P")
  Send, #+Shift+Right
return
