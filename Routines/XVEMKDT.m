XVEMKDT ;DJB,KRN**Date/Time [12/30/95 9:15am]
 ;;13.1;VICTORY PROG ENVIRONMENT;;May 23, 2016
 ;
 W !!?1,"Calling points: S DATE=$$DATE^XVEMKDT(1|2|3)"
 W !?1,"                S FMDATE=$$FMDATE^XVEMKDT()"
 W !?1,"                S TIME=$$TIME^XVEMKDT(1|2|3)",!
 Q
DATE(TYPE) ;TYPE=1 20-MAY-95   TYPE=2 3/5/95  TYPE=3 03/05/95
 NEW DATE,DAY,H,I,LEAPYR,MONTH,MONTHNAM,R,YR
 S:",1,2,3,"'[(","_$G(TYPE)_",") TYPE=1
 S MONTHNAM="JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC"
 S H=+$H,H=H>21914+H
 S LEAPYR=H\1461,R=H#1461,YR=LEAPYR*4+1841+(R\365),DAY=R#365,MONTH=1
 I R=1460,LEAPYR'=14 S DAY=365,YR=YR-1
 F I=31,(R>1154)&(LEAPYR'=14)+28,31,30,31,30,31,31,30,31,30 Q:I'<DAY  S MONTH=MONTH+1,DAY=DAY-I
 I DAY=0 S YR=YR-1,MONTH=12,DAY=31
 I TYPE=1 S DATE=DAY_"-"_$P(MONTHNAM," ",MONTH)_"-"_$E(YR,3,4)
 I TYPE=2 S DATE=MONTH_"/"_DAY_"/"_$E(YR,3,4)
 I TYPE=3 D  S DATE=MONTH_"/"_DAY_"/"_$E(YR,3,4)
 . I $L(MONTH)=1 S MONTH=0_MONTH
 . I $L(DAY)=1 S DAY=0_DAY
 Q DATE
FMDATE() ;Returns current date in FM format
 NEW DATE,DAY,H,MONTH,YR
 S H=$H>21608+$H-.1,YR=H\365.25+141,H=H#365.25\1
 S DAY=H+306#(YR#4=0+365)#153#61#31+1,MONTH=H-DAY\29+1
 S DATE=YR_"00"+MONTH_"00"+DAY
 Q DATE
TIME(TYPE) ;TYPE=1 3:42 PM   TYPE=2: 3:42pm  TYPE=3 15:42
 NEW I,MIN,N,NP,TIME
 S:",1,2,3,"'[(","_$G(TYPE)_",") TYPE=1
 S MIN=$P($H,",",2)\60
 S TIME=MIN\60_":"_(MIN#60\10)_(MIN#10)
 I $G(TYPE)=3 Q TIME
 S N=" AM" S:MIN'<720 MIN=MIN-720,N=" PM" S:MIN<60 MIN=MIN+720
 I $G(TYPE)=2 S N=$TR(N,"AMPM ","ampm")
 S I=MIN\600 S:'I I=" "
 S TIME=I_(MIN\60#10)_":"_$S($L(MIN#60)=1:0,1:"")_(MIN#60)_N
 Q TIME
