

UNINSTALL="pm uninstall -k --user 0"

PACKAGES=(

# setup / restore
"com.google.android.setupwizard" 
"com.google.android.onetimeinitializer" 
"com.google.android.apps.restore" 

# Xiaomi Apps
"com.mfashiongallery.emag"
"com.mi.android.globalFileexplorer"
"com.miui.android.fashiongallery"
"com.miui.bugreport"
"com.miui.cloudbackup"
"com.miui.fm"
"com.jeejen.family.miui"
"com.jeejen.knowledge"
"com.jeejen.store"
"com.miui.videoplayer"
"com.miui.mipub"

# samsung Apps
"samsung.android.messaging"
"sec.android.easyonehand" 
"samsung.android.drivelink.stub" 
"sec.android.widgetapp.samsungapps" 
"sec.android.app.sbrowser" 
"samsung.android.mateagent" 
"sec.android.easyMover.Agent" 
"samsung.android.app.watchmanagerstub" 
"sec.android.daemonapp"
"samsung.android.app.social" 
"samsung.ecomm.global" 
"sec.android.app.voicenote" 
"samsung.android.oneconnect" 
"samsung.android.voc"
"sec.android.app.popupcalculator" 
"sec.android.splitsound" 
"mobeam.barcodeService"
"samsung.android.app.dressroom" 
"samsung.android.scloud" 
"samsung.android.sdk.handwriting" 
"samsung.android.sdk.professionalaudio.utility.jammonitor"
"samsung.android.universalswitch" 
"samsung.android.visioncloudagent" 
"samsung.android.visionintelligence" 
"samsung.android.widgetapp.yahooedge.finance"
"samsung.android.widgetapp.yahooedge.sport"
"samsung.app.highlightplayer"
"samsung.safetyinformation"
"samsung.storyservice"
"samsung.android.service.aircommand" 
"samsung.android.app.aodservice" 
"sec.android.app.dexonpc"
"samsung.android.ardrawing"
"samsung.android.svoiceime" 
"samsung.android.beaconmanager" 
"samsung.android.email.provider" 
"wsomacp"

# Samsung Pay and Pass
"samsung.android.samsungpassautofill" 
"samsung.android.authfw"
"samsung.android.samsungpass" 

# ar
"com.samsung.android.ardrawing" 
"com.samsung.android.arzone" 
"com.google.ar.core" 
"com.samsung.android.aremoji" 
"com.samsung.android.aremojieditor" 
"com.sec.android.mimage.avatarstickers" 
"com.sec.android.autodoodle.service" 
"com.samsung.android.livestickers" 

# bixby
"com.samsung.android.app.settings.bixby" 
"com.samsung.android.app.routines" 
"com.samsung.android.bixby.service" 
"com.samsung.android.bixby.agent" 
"com.samsung.android.bixbyvision.framework" 
"com.samsung.android.bixby.wakeup" 
"com.samsung.android.bixby.agent.dummy" 
"com.samsung.android.visionintelligence" 
"com.samsung.systemui.bixby2" 

# ant
"com.dsi.ant.server"
"com.dsi.ant.plugins.antplus"
"com.dsi.ant.sample.acquirechannels"
"com.dsi.ant.service.socket"


# google
"com.google.android.partnersetup" 
"com.android.printspooler" 
"com.android.calllogbackup" 
"com.android.wallpapercropper"
"com.android.wallpaperbackup"
"com.android.wallpaper.livepicker"
"com.google.android.tts" 
"com.google.android.feedback" 
"com.google.android.printservice.recommendation" 
"com.google.android.googlequicksearchbox" 
"com.android.bips" 
"com.android.providers.partnerbookmarks" 
"com.android.bookmarkprovider" 
"com.google.android.music" 
"com.google.android.videos" 
"com.google.android.projection.gearhead" 
## keep it - Duo ## "com.google.android.apps.tachyon"
"com.google.android.apps.turbo" 
## keep it - Maps ## "com.google.android.apps.maps"
"com.google.audio.hearing.visualization.accessibility.scribe" 
"com.google.android.gm" 
"com.google.android.apps.docs" 
"com.google.android.apps.photos" 

# youtube
## keep it - YouTube ## "com.google.android.youtube"
"com.google.android.apps.youtube.music" 

# facebook
"com.facebook.katana" 
"com.facebook.appmanager" 
"com.facebook.system" 
"com.facebook.services" 

# netflix
"com.netflix.partner.activation" 
"com.netflix.mediaclient" 

# microsoft
"com.microsoft.office.officehubrow" 
"com.microsoft.skydrive" 

# indian fw (these apps can be found in others firmwares too)
"com.linkedin.android" 
"com.mygalaxy" 
"com.eterno" 
"com.opera.max.oem" 
"com.opera.max.preinstall" 
"com.aura.oobe.samsung" 
"com.samsung.logwriter" 
"com.samsung.android.easysetup" 
"com.samsung.storyservice" 
"com.samsung.android.airtel.stubapp" 
"com.samsung.android.spaymini" 
"com.sec.android.widgetapp.samsungapps" 
"com.sec.android.widgetapp.webmanual" 
"com.samsung.visionprovider" 
"com.samsung.android.mfi" 
"com.sec.android.app.chromecustomizations" 
"com.samsung.android.uds" 

# sim
"com.android.stk" 
"com.android.stk2" 

# other
"com.android.dreams.basic" 
"com.android.egg" 
"flipboard.boxer.app" 
## keep it - non-root only (will be reinstalled on next boot) - Software update ## "com.wssyncmldm"
## keep it - non-root only (will be reinstalled on next boot) - Work Setup ## "com.android.managedprovisioning"
"com.spotify.music" 
"co.benx.weverse" 
"com.android.cellbroadcastreceiver"

)

# keep apps bellow installed to prevent "ExecutionCriteria: Package unavailable for Task" error
# triggered by: com.google.android.gms/com.google.android.gms.persistent (Google Play Services)
# ---------------------------------------------------------------------------------------------
# "com.google.android.youtube" (YouTube)
# "com.google.android.apps.tachyon" (Duo)
# "com.google.android.apps.maps" (Maps)
# ---------------------------------------------------------------------------------------------

cd /data/local/tmp

# traverse all the packages in
# the list and uninstall them!
for pkg in "${PACKAGES[@]}"
do
	apkpath=`pm path $pkg | cut -b 9-`
	if [ ! -z "$apkpath" -a "$apkpath" != "" ]; then
		label=`./aapt_arm_pie d badging $apkpath | grep application-label: | cut -b 19- | sed -e 's/^.//' -e 's/.$//'`
		if [ "$label" == "" ]; then
			label="NULL OR EMPTY"
		fi
		
		echo "- $label ($pkg)"
		${UNINSTALL} $pkg 2> /dev/null || true
		if [ "$?" == "1" ]; then
			echo "  Successfully uninstalled!"
		else
			echo "  Not installed or already uninstalled!"
		fi
	fi
done

exit 0
