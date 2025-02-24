#!/system/bin/sh
# shellcheck disable=SC2086
MODDIR=${0%/*}
until [ "$(getprop sys.boot_completed)" = 1 ]; do
	sleep 1
done
BASEPATH=$(pm path __PKGNAME | grep base | cut -d: -f2)
if [ "$BASEPATH" ]; then
	chcon u:object_r:apk_data_file:s0 $MODDIR/base.apk
	mount -o bind $MODDIR/base.apk $BASEPATH
fi
