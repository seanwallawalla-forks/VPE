XVEMGR1 ;DJB,VGL**Process Variables [10/25/94]
 ;;13.1;VICTORY PROG ENVIRONMENT;;May 23, 2016
 ;
VARIABLE ;Check if variable is valid and replace with its value
 NEW TEMP1,TEMP2,TEMPSP
 F I=1:1:$L(NEWSUB,ZDELIM) S TEMP=$P(NEWSUB,ZDELIM,I) D @$S(TEMP[ZDELIM1:"VAR1",1:"VAR2") S $P(NEWSUB,ZDELIM,I)=TEMP
 I FLAGQ W !!?1,"Subscript contains an invalid variable"
 Q
VAR1 ;TEMP contains spaces
 S TEMPSP=TEMP F I1=1:1:$L(TEMPSP,ZDELIM1) S TEMP=$P(TEMPSP,ZDELIM1,I1) D VAR2 S $P(TEMPSP,ZDELIM1,I1)=TEMP
 S TEMP=TEMPSP
 Q
VAR2 ;TEMP does not contain spaces
 I TEMP[ZDELIM2 S TEMP1=$$VARCHK($P(TEMP,ZDELIM2)),TEMP2=$$VARCHK($P(TEMP,ZDELIM2,2)),TEMP=TEMP1_ZDELIM2_TEMP2
 I TEMP'[ZDELIM2 S TEMP=$$VARCHK(TEMP)
 Q
VARCHK(VaR) ;If variable is alpha, make sure quote marks are correct. Use VaR so I don't interfere with Variable name.
 S VaR=$G(VaR) I VaR']"" Q VaR
 I +VaR=VaR!(VaR?1""""1.E1"""") Q VaR
 I VaR="$J" S VaR=$S(+$J=$J:$J,1:""""_$J_"""") Q VaR
 I VaR="$I" S VaR=$S(+$I=$I:$I,1:""""_$I_"""") Q VaR
 I VaR="$H" S VaR=$S(+$H=$H:$H,1:""""_$H_"""") Q VaR
 I VaR?1A.AN,$D(VaR)#2,$G(@VaR)]"" S VaR=@VaR D  Q VaR
 . I +VaR'=VaR S VaR=""""_VaR_""""
 S FLAGQ=1
 Q VaR
SPACES ;Process range entered with spaces.
 NEW ACTLEV,RUNSUB,SPACE,TEMPSUB,UPLEV
 S (ACTLEV,UPLEV)=$L(NEWSUB,ZDELIM),FLAGQ=0
 F I=1:1:UPLEV S CNTX(I)=1,TEMP=$P(NEWSUB,ZDELIM,I) F II=1:1:$L(TEMP,ZDELIM1) S SPACE(I,II)=$P(TEMP,ZDELIM1,II)
 D SPACECK I FLAGQ W !!?1,"Invalid subscript" Q
 D SPACES1 I XVVT("STATUS")'["START",XVVT("STATUS")'["PROT" W !!?1,"No data"
 Q
SPACES1 ;Set each part of subscript to correct value.
 S NEWSUB="" F I=1:1:UPLEV S NEWSUB=NEWSUB_SPACE(I,CNTX(I))_$S(I=UPLEV:"",1:ZDELIM)
 D SETPARAM^XVEMGR,START^XVEMGR Q:FLAGQ
SPACES2 ;Now get new values for NEWSUB
 Q:ACTLEV<1
 S CNTX(ACTLEV)=CNTX(ACTLEV)+1 I '$D(SPACE(ACTLEV,CNTX(ACTLEV))) S CNTX(ACTLEV)=1,ACTLEV=ACTLEV-1 G SPACES2
 S ACTLEV=UPLEV
 G SPACES1
SPACECK ;Check subscript
 NEW ACTLEV,RUNSUB,SPACE,TEMPSUB,UPLEV
 S (ACTLEV,UPLEV)=$L(NEWSUB,ZDELIM),FLAGQ=0
 F I=1:1:UPLEV S CNTX(I)=1,TEMP=$P(NEWSUB,ZDELIM,I) F II=1:1:$L(TEMP,ZDELIM1) S SPACE(I,II)=$P(TEMP,ZDELIM1,II)
 S NEWSUB="" F I=1:1:UPLEV S NEWSUB=NEWSUB_SPACE(I,CNTX(I))_$S(I=UPLEV:"",1:ZDELIM)
 D SETPARAM^XVEMGR
SPACECK1 ;Now get new values for NEWSUB
 Q:ACTLEV<1
 S CNTX(ACTLEV)=CNTX(ACTLEV)+1 I '$D(SPACE(ACTLEV,CNTX(ACTLEV))) S CNTX(ACTLEV)=1,ACTLEV=ACTLEV-1 G SPACECK1
 G SPACECK
