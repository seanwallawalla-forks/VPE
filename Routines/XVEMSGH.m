XVEMSGH ;DJB/VSHL**VShell Global - Help Text ;2017-08-15  4:49 PM
 ;;15.1;VICTORY PROG ENVIRONMENT;;Jun 19, 2019
 ; Original Code authored by David J. Bolduc 1985-2005
 ;
 Q
TEXT ;Load HELP and other text
 NEW CNT,LN,RTN,TAG,TXT
 KILL ^XVEMS("ZZ") S ^XVEMS("ZZ")="Help Text"
 S RTN="XVEMSH1",TAG="INTRO" D TEXT1
 S RTN="XVEMSH2",TAG="KEYS" D TEXT1
 S RTN="XVEMSH3" F TAG="QWIK","USER" D TEXT1
 S RTN="XVEMSH4",TAG="SYSTEM" D TEXT1
 S RTN="XVEMSH5" F TAG="BOXES","VENDOR" D TEXT1
 S RTN="XVEMSH6" F TAG="CLH","PGM" D TEXT1
 S RTN="XVEMSH7" F TAG="PARAM","PROT" D TEXT1
 S RTN="XVEMSH8",TAG="MISC" D TEXT1
 S RTN="XVEMSH9",TAG="KERN" D TEXT1
 S RTN="XVEMSF1" F TAG="DDS","DIAC","DIB","DIM","DIO2" D TEXT1
 S RTN="XVEMSF2",TAG="DIC" D TEXT1
 S RTN="XVEMSF3" F TAG="DIC1","DICN" D TEXT1
 S RTN="XVEMSF4" F TAG="DICQ","DICRW","DID","DIEZ","DIFG","DICD","DIKZ" D TEXT1
 S RTN="XVEMSF5",TAG="DIE" D TEXT1
 S RTN="XVEMSF6" F TAG="DIK","DIPZ","DIR","DIS" D TEXT1
 S RTN="XVEMSF7" F TAG="DIP","DIPT" D TEXT1
 S RTN="XVEMSF8" F TAG="DIQ","DIQ1" D TEXT1
 S RTN="XVEMSF9",TAG="DIWF" D TEXT1
 S RTN="XVEMSFA" F TAG="DIU2","DIWE","DIWP","DIWW" D TEXT1
 S RTN="XVEMSFB" F TAG="%DT","COMMA" D TEXT1
 S RTN="XVEMSFC",TAG="%DTC" D TEXT1
 S RTN="XVEMSFD" F TAG="%RCR","DDIOL","DIAXU" D TEXT1
 S RTN="XVEMSLA",TAG="DATE" D TEXT1
 S RTN="XVEMSLB",TAG="STRING" D TEXT1
 S RTN="XVEMSLC",TAG="MATH" D TEXT1
 S RTN="XVEMSLD",TAG="MEAS" D TEXT1
 S RTN="XVEMSN",TAG="NOTES" D TEXT1
 S CNT=1
 S RTN="XVEMDH1",TAG="VEDD1" D TEXT2
 S RTN="XVEMDH2",TAG="VEDD1" D TEXT2
 S RTN="XVEMDH3",TAG="VEDD1" D TEXT2
 S RTN="XVEMDH4",TAG="VEDD2" D TEXT2
 S RTN="XVEMDH5",TAG="VEDD2" D TEXT2
 S RTN="XVEMGH",TAG="VGL1" D TEXT1
 S CNT=1
 S RTN="XVEMGH1",TAG="VGL2" D TEXT2
 S RTN="XVEMGH2",TAG="VGL2" D TEXT2
 S CNT=1
 S RTN="XVEMRH",TAG="VRR1" D TEXT2
 S RTN="XVEMRH1",TAG="VRR1" D TEXT2
 S RTN="XVEMRHK",TAG="VRR2" D TEXT2
 S RTN="XVEMRHL",TAG="LIBRARY" D TEXT2
 S RTN="XVEMRHW",TAG="WEB" D TEXT2
 Q
TEXT1 ;Move text to ^XVEMS("ZZ")
 S CNT=1 W "."
 ;
TEXT2 ;
 X "F LN=1:1 S TXT=$T("_TAG_"+LN^"_RTN_") Q:TXT']""""  S TXT=$P(TXT,"";;;"",2,999) Q:TXT=""***""  S ^XVEMS(""ZZ"",TAG,CNT)=TXT,CNT=CNT+1"
 Q
