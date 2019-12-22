case(1, a, 120, 1600, 1200, 73). 
case(2, a, 440, 1000, 1190, 91). 
case(3, b, 120, 800, 1190, 31).
referee(1, i, 600, 220, 0). 
referee(2, e, 360, 140, 2800). 
referee(3, e, 240, 40, 700).
prefType(1, a, 1). 
prefType(1, b, 2). 
prefType(2, a, 2). 
prefType(3, b, 2).
prefRegion(1, 1200, 1). 
prefRegion(1, 1190, 1). 
prefRegion(2, 1200, 2). 
prefRegion(2, 1190, 1). 
prefRegion(3, 1190, 1).
externalMaxDamage(1500).

{assign(C,R) : referee(R,RTYPE,MAXWORK,PREVWORK,PREVPAY)}=1  :- case(C,CTYPE,EFFORT,DAMAGE,POST,PAY).
#show assign/2.