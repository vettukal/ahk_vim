#Include clip.ahk
SetBatchLines, -1
SendMode, Input

global first_hit := A_TickCount
global second_hit := A_TickCount
global cap_hit := A_TickCount
global flag := False

global fullLineClip := ""
global targetChar := ""
global flagForwardSearch := False
global forward_timer := A_TickCount

global ticker_count := 0


global c_flag := False
global c_timer := A_TickCount

~v::
    tlapse := A_TickCount - cap_hit
    if(tlapse < 400) {
        ;Send {Backspace}{Backspace}{F10}
        Send {F10}
    }
    cap_hit := A_TickCount
return




!v::
	Send vmathew@starbucks.com{Enter}