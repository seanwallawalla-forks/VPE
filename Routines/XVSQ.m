XVSQ ; Paideia/SMH - VPE Process QWIKs ; 5/1/16 7:07pm
 ;;13.0;VICTORY PROG ENVIRONMENT;;Feb 29, 2016
 ;;XV
 ;
 N HLD
 S XVVWARN="QWIK"
 S HLD=$$ALLCAPS^XVEMKU($P(XVVSHC," "))_" "_$P(XVVSHC," ",2,99)
 D QWIK^XVEMSQS(HLD)
 QUIT
