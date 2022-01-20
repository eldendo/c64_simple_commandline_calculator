5 print chr$(147):rem clearscreen
10 print "  +--------------------------------+"
20 print "  !minimal command line calculator !"
30 print "  !(c) ir. marc dendooven (eldendo)!"
40 print "  !This work is licensed under the !" 
50 print "  !    terms of the mit license.   !"
60 print "  +--------------------------------+"
70 print

100 gosub 10000:rem install extended val

200 rem *** demo ***
210 input "calc";i$
220 if i$="exit"then print "bye":end
230 gosub 9000:rem simple tokenise
240 print val(t$)
250 goto 200


9000 rem *** minimal tokenise i$->t$ ***
9005 t$=""
9010 if i$=""then return
9020 for i = 1 to len(i$)
9030 ch$=mid$(i$,i,1)
9040 if ch$="+" then ch$=chr$(170)
9050 if ch$="-" then ch$=chr$(171)
9060 if ch$="*" then ch$=chr$(172)
9070 if ch$="/" then ch$=chr$(173)
9090 t$=t$+ch$ 
9100 next
9110 return


10000 rem *** extended val ***
10005 if peek(1) = 54 then 10200: rem already installed
10010 print "  +--------------------------------+"
10020 print "  !      install extended val      !"
10030 print "  !(c) ir. marc dendooven (eldendo)!"
10040 print "  +--------------------------------+"
10050 print
10060 print "copying basic rom to underlying ram"
10070 for a=40960 to 49151 
10080 poke a, peek(a) 
10090 if int(a/100)*100=a then print".";
10100 next a
10110 print:print "done"
10120 print "modifying basic in ram"
10130 poke 47067,138: poke 47068,173: rem (jsr) $ad8a
10160 print "done"
10170 print "switching to ram" 
10180 poke 1,54
10190 print "done"
10200 print "extended val installed"
10210 return

