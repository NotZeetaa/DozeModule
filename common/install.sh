unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'mode/*' -d $TMPDIR >&2
mkdir -p $MODPATH/system/bin

ui_print " "
ui_print "    ×××××××××××××××××××××××××××××××"
ui_print "       Select Doze Mode:  💤     "
ui_print "    ×××××××××××××××××××××××××××××××"
ui_print " "
ui_print "  Vol+ = Next; Vol- = Select"
ui_print " "
ui_print "  1. Light & Deep Doze Mode "
ui_print "  3. Force Doze Mode "
ui_print " "
ui_print "  Select: "
DZ=1
while true; do
ui_print "   $DZ"
	if $VKSEL; then
		DZ=$((DZ + 1))
	else 
		break
	fi
	if [ $DZ -gt 2 ]; then
		DZ=1
	fi
done
ui_print " "
ui_print "  Selected: $DZ"
#
case $DZ in
 1 ) FCTEXTAD1="Selected Light & Deep Doze Mode 😪"; cp -af $TMPDIR/mode/dp $MODPATH/system/bin;;
 2 ) FCTEXTAD1="Selected Force Doze Mode 😴"; cp -af $TMPDIR/mode/force $MODPATH/system/bin;;
esac
ui_print " "
ui_print "- Mode: $FCTEXTAD1 "
sleep 3