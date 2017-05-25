set icon="slackware";
set vmlinuz_img="(loop)/kernels/huge.s/bzImage";
set initrd_img="(loop)/isolinux/initrd.img";
set loopiso=" ";
menuentry $"Boot Slackware From ISO" --class $icon{
	set kcmdline="vga=normal load_ramdisk=1 prompt_ramdisk=0 ro printk.time=0 nomodeset SLACK_KERNEL=huge.s";
	linux $vmlinuz_img $kcmdline $loopiso;
	initrd $initrd_img;
}