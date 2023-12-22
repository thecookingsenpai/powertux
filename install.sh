#!/bin/bash
THIS=$(pwd)
SHELLTYPE=$(echo $SHELL | awk -F"/" '{print $4}')
echo $SHELLTYPE
SHELLRC="."$SHELLTYPE"rc"
echo $SHELLRC

if [ ! -f $HOME/$SHELLRC ]; then
	echo "No suitable configuration file found for $SHELLTYPE (tested $SHELLRC)"
	exit 0
fi

echo "Configuration is $HOME/$SHELLRC"

read -p "Do you want to install the binaries system wide (in /usr/bin)? This requires root (yes/no)" yn
case $yn in
	yes ) sudo cp powertux_folder/bin/* /usr/bin/;;
	no ) echo "Ok";;
esac

cp -R powertux_folder $HOME/
echo "PATH=$PATH:$HOME/powertux_folder/bin" >> $HOME/$SHELLRC
echo "sh $HOME/powertux_folder/powertux.sh" >> $HOME/$SHELLRC
cd $THIS
echo "Done! Add your binaries into $HOME/powertux_folder/bin"
echo "Please restart your shell or source your $SHELLRC to apply the settings in this session"
