XVSO ; Paideia/SMH - VPE 'Other' functions ; 2/27/16 4:01pm
 ;;13.1;VICTORY PROG ENVIRONMENT;;May 23, 2016
 ;;XV
 ; Notes: This corresponds to ^XVEMS("ZO")
 ;
ZO1 ; Reset $ZR and $T
 N X
 S:$G(XVV("$ZR"))]"" @("X=$"_$S(XVV("$ZR")["(":"O",1:"D")_"("_XVV("$ZR")_")")
 I $G(XVV("$T"))
 Q
 ;
ZO2 ;
 Q:'$D(XVV("ID"))
 Q:'$D(^%ZOSF("UCI"))
 N Y
 X ^("UCI") ; put UCI in Y
 Q:$G(^XVEMS("CLH","UCI",XVV("ID")_$G(^XVEMS("SY"))))=Y
 D ZO3
 Q
 ;
ZO3 ; Kill VShell's CLH if user switches UCIs
 S ^XVEMS("CLH","UCI",XVV("ID")_$G(^XVEMS("SY")))=Y
 K ^XVEMS("CLH",XVV("ID"),"VSHL")
 QUIT
 ;
ZO4 ; Reset X after ^%ZOSF("TRAP")
 S:$D(%1) X=%1
 KILL:'$D(%1) X
 KILL %1
 QUIT 
