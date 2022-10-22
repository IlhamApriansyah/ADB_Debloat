@echo off
SET ADB=adb

echo Welcome to debloat script

%ADB% kill-server
%ADB% start-server
%ADB% wait-for-device

for /F "delims=" %%a in ('%ADB% shell getprop ro.product.model') do set DEVICE=%%a
for /F "delims=" %%a in ('%ADB% shell getprop ril.product_code') do set PRODUCT=%%a
for /F "delims=" %%a in ('%ADB% shell getprop ro.build.display.id') do set FW=%%a
for /F "delims=" %%a in ('%ADB% shell getprop ro.oem.key1') do set CSC=%%a

echo.
echo Detected: %DEVICE% (%PRODUCT%)
echo Firmware: %FW% (%CSC%)

echo.
echo How to re-install an uninstalled app (adb command):
echo adb shell cmd package install-existing name.of.package

echo.
pause

echo.
echo Copying files. . .
%ADB% push %FILES%/aapt_arm_pie %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list.sh %TMP% > NUL 2> NUL
%ADB% shell chmod 0755 %TMP%/aapt_arm_pie
%ADB% shell chmod 0777 %TMP%/debloat_list.sh

echo.
echo Debloating (uninstalling quite a few packages, standby a minute or two). . .
echo.
%ADB% shell sh %TMP%/debloat_list.sh

echo.
echo Sedang menghapus. . .
%ADB% shell rm -f %TMP%/aapt_arm_pie > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list.sh > NUL 2> NUL

echo.
echo Berhasil!

echo.
echo Reboot device-mu . . .
%ADB% reboot
%ADB% kill-server

echo.
pause
