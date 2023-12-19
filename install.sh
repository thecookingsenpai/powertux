#!/bin/bash
THIS=$(PWD)
mv custom $HOME/
mv custom.sh $HOME/custom.sh
echo "source $HOME/custom.sh" >> $HOME/.profile
cd $HOME
source .profile
cd $THIS
echo "Done! Add your binaries into $HOME/custom/bin or $HOME/custom/local/bin"
