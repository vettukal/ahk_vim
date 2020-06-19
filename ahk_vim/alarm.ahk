global flag := False


#Persistent
SetTimer, CalcTimejheck, 60000 ; check every minute
return



^+l::Reload

calFun23()
{
    If (A_Hour=10 ) { 
        If (flag=False)
        {
            flag := True
            Run chrome
            Sleep, 4000
            a:="https://teams.microsoft.com/l/meetup-join/19%3ameeting_YzQ0NmZiMjMtMjE5MS00MzQ1LTliNjMtNWJjNTEyNThkZTcw%40thread.v2/0?context=%7b%22Tid%22%3a%22ee69be27-d938-4eb5-8711-c5e69ca43718%22%2c%22Oid%22%3a%22583c36fb-f4ad-4d7c-9045-468202df3a32%22%7d"
            Clipboard:=a
            send, ^v{Enter}
            Sleep, 4000
            Send {Left}
            Send {Enter}
            Sleep, 15000
            Send {Enter}
            Sleep, 4000
            Send ^+m
        } 
    }
}
CalcTimejheck: 
   calFun23()
   return

^!l::
    ; Send, msgchar %flag%
    calFun23()
    return 