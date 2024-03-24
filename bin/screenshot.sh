#!/bin/sh
# tool to take screenshots in QubesOS. Requires xclip on the target VM 
# zenity --list --modal --width=200 --height=390 --text "Select destination AppVM):" --radiolist --column "Pick" --column "AppVM" $(qvm-ls --running  --raw-data | cut -d '|' -f 1)
if [ $# -eq 1 ] ; then
	TARGET_VM="$1"
else
	WINDOW_ID=$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5 | tr -d ',')
	echo "Window ID: $WINDOW_ID"
	TARGET_VM=$(xprop -id $WINDOW_ID _QUBES_VMNAME | cut -d ' ' -f 3 | tr -d '"' )
fi
echo "Target VM: $TARGET_VM"
DEST=$(mktemp)
echo "Dest: $DEST"
sleep 2
xfce4-screenshooter -r -s "$DEST"
cat "$DEST" | qvm-run --pass-io $TARGET_VM -- xclip -sel c -t image/png -l 1
rm "$DEST"
# xfce4-screenshooter -c -r
# xclip -out -sel c -t image/png | qvm-run --pass-io $TARGET_VM 'xclip -sel c -t image/png'
# xfce4-screenshooter -r -o "qvm-copy-to-vm $TARGET_VM"
