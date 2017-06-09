#!/bin/bash
# This scripts initializes the catkin workspace and runs a rosinstall file to install 
# sick_tim, uos_tools, pico_flexx_drivers, volksbot driver and more. Also see:

echo ""
echo "Install wstool and use it to start .rosinstall process"
sudo apt install python-wstool
mkdir -p ~/ceres_ws
cd ~/ceres_ws

echo ""
echo "Pulling .rosinstall script"
wstool init src https://raw.githubusercontent.com/chbroecker/ceres/master/scripts/ceres-kinetic.rosinstall?token=AVQgivWyEzSsUrQHE6qCUBCDTZ6ieSP4ks5ZQ8zywA%3D%3D
mv ceres-kinetic.rosinstall?token=AVQgivWyEzSsUrQHE6qCUBCDTZ6ieSP4ks5ZQ8zywA%3D%3D ceres-kinetic.rosinstall
wstool update -t src 

echo ""
echo "Pulling launch file"

echo ""
echo "Copying the libroyale SDK to the pico_flexx_driver:"
# Installation instructions can be found at github.com/juliangaal/pico_flexx_driver
cd ~/ceres_ws/src/pico_flexx_driver/royale
cp ~/Downloads/libroyale.zip .
unzip libroyale.zip
unzip 20170127_royale_3.1.0.122.zip
unzip libroyale-3.1.0.122-LINUX-x86-64Bit.zip
rm *.zip
rm *.exe

echo ""
echo "Setting up USB details"
sudo mv libroyale-3.1.0.122-LINUX-x86-64Bit/driver/udev/10-royale-ubuntu.rules /etc/udev/rules.d
sudo mv ~/ceres_ws/src/sick_tim/udev/81-sick-tim3xx.rules /etc/udev/rules.d

echo ""
echo "catkin_make to apply changes"
cd ~/ceres_ws/
catkin_make

echo ""
echo "Completed"
echo "
. u want
.
.. .... __,--------__
<::::..____ :.......(ö).':
.............:............ :
. ............\..............\
----------------------
.
. sum fuk?
.....---;;;;;;---:
.. (Ö)...|_-_|...(Ö)
. .|...............|
. |.................|
. |.................|
"