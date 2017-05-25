set icon="ubuntu";
set vmlinuz_img="(loop)/casper/vmlinuz*";
set initrd_img="(loop)/casper/initrd*";
set loopiso="iso-scan/filename=${isofile}";
function CHSLocale {
	echo "是否使用简体中文？按[Y]选择简体中文，按其他键使用默认语言。";
	getkey key;
	if [ "$key" == "121" ]; then
		kcmdline="${kcmdline} locale=zh_CN.UTF-8";
	fi;
}
menuentry $"Boot Ubuntu From ISO" --class $icon{
	set kcmdline="boot=casper noprompt noeject";
	if [ "${lang}" == "zh_CN" ]; then
		CHSLocale;
	fi;
	linux $vmlinuz_img $kcmdline $loopiso;
	initrd $initrd_img;
}
menuentry $"Boot Ubuntu From ISO (persistent)" --class $icon{
	set kcmdline="boot=casper noprompt noeject persistent";
	if [ "${lang}" == "zh_CN" ]; then
		CHSLocale;
	fi;
	linux $vmlinuz_img $kcmdline $loopiso;
	initrd $initrd_img;
}