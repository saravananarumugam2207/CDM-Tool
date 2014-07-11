#/bin/hash

                                           
echo
uid=`id | sed 's/uid=\([0-9]*\)(.*/\1/'`
if [ "$uid" != "0" ] ; then
        echo "Please Login As Root To Run This Script."
        exit 1
fi

until [ "$selection" = "0" ]; do


                                           ###### STARTING PROGRAMMING AND TYPING THE USER INTERFACE ##########
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ""
    clear
echo "                                                          $HOSTNAME : `date` "
echo ""
echo -e " \E[30;36m ---------------------------------------------" ; tput sgr0
echo -e " \E[30;32m  Choose From Below Options" ; tput sgr0
echo -e " \E[30;36m ---------------------------------------------" ; tput sgr0
echo -e " \E[30;31m "

echo " 1) Display existing LV's PV's VG's info's"
echo ""
echo " 2) Create Physical Volume"
echo ""
echo " 3) Create Volume Group"
echo ""
echo " 4) Extend Existing Volume Group"
echo ""
echo " 5) Create Logical Volume"
echo ""
echo " 6) Extend Logical Volume"
echo ""
echo " 7) Create Filesystem In Newly Created Logical Volume"
echo ""
echo " 8) Mount Newly created Logical Volume"
echo ""
echo " 9) Shrink Existing Logical Volume"
echo ""
echo " 10) Remove Existing Logical Volume"
echo ""
echo " 11) Scan LVM for Errors"
echo ""
echo ""
echo " 12) EXIT" ; tput sgr0
echo ""
echo ""
echo -n "Choose From Above: "
read selection
echo ""
clear
                                           ###### FINISHING  PROGRAMMING AND TYPING THE USER INTERFACE ##########
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
                                   ########### START SCRIPT MAIN PROGRAMMING AND COMMANDS WRITING #####################
  case $selection in

               ## --------------------------------------<General Infromation>-----------------------------------##
        1 )     echo "---------------------------------------------------------------------------------------"
                                echo -e "\E[30;35m Gathered General Information About the LVM $HOSTNAME"; tput sgr0
                echo "---------------------------------------------------------------------------------------"
                                echo ""
                                echo -e "\E[30;33m Physical Volume Details"; tput sgr0
                                echo "-----------------------"
                                pvs -a
                                echo ""
                                echo -e "\E[30;33m Volume Groups Details"; tput sgr0
                                echo "---------------------"
                                vgs -v
                                echo ""
                                echo -e "\E[30;33m Logical Volume Details"; tput sgr0
                                echo "----------------------"
                                lvs -av
                                echo ""
                        echo "---------------------------------------------------------------------------------------"
            echo -e "Press [enter] key to continue. . ."
            echo -n "Enter selection: "
            read selection
            clear
            ;;
               ## --------------------------------------<General Infromation/end>-------------------------------##

   2 )  echo "---------------------------------------------------------------------------------------"
        echo -e "\E[30;35m Creating Physical Volume `hostname`" ; tput sgr0
        echo "---------------------------------------------------------------------------------------"
        echo ""
clear
        echo -e "\E[30;33m  Please Provide the HARDDISK Name To Create Physical Volume (example=sdb1)" ; tput sgr0
read diskname
pvcreate /dev/$diskname
if [ $? -eq 0 ] ; then
                echo -e " \E[30;33mPhysical Volume Created Successfully" ; tput sgr0
                else
                echo -e '\E[30;31m Error While Creating Physical Volume (please provide correct diskname)'; tput sgr0
                fi
        echo ""
        echo -e "Press [enter] key to continue. . ."
        echo -n "Enter selection: "
        read selection
        clear
        ;;

        3 ) echo "---------------------------------------------------------------------------------------"
            echo -e "\E[30;35m Creating Volume Group `hostname`" ; tput sgr0
            echo "---------------------------------------------------------------------------------------"
            echo -e "\E[30;33m  Please Provide New Volume Group Name (example=apps)" ; tput sgr0
read groupname
echo -e "\E[30;33m  Please Provide Physical Volume Name Were You Already Created (example=sdb1)" ; tput sgr0
pvs
echo "Please Provide Input"
read diskname
vgcreate $groupname /dev/$diskname
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32mVolume Group Created Successfully" ; tput sgr0
                else
                echo -e '\E[30;31m Error While Creating Volume Group (please provide correct diskname)'; tput sgr0
                fi
echo ""
            echo "Press [enter] key to continue. . ."
            echo -n "Enter selection: "
            read selection
            clear
            ;;

4 )     echo "---------------------------------------------------------------------------------------"
echo -e "\E[30;35m Extend Existing Volume Group `hostname`" ; tput sgr0
echo "---------------------------------------------------------------------------------------"
                echo -e "\E[30;33m  Please Provide Volume Group Name Were You Already Created (example=apps)" ; tput sgr0
vgs
echo "Please Provide Input"
read groupname
echo -e "\E[30;33m  Please Provide The Physical Volume Name (example=sdb1)" ; tput sgr0
pvs
echo "Please Provide Input"
read lvname
vgextend  $groupname /dev/$lvname
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32m Volume Group Successfully Extended" ; tput sgr0
                else
                echo -e '\E[30;31m Error While Extending volume (please provide correct diskname,groupname)'; tput sgr0
                fi
                echo "Press [enter] key to continue. . ."
            echo -n "Enter selection: "
            read selection
            clear
            ;;



        5 )     echo "---------------------------------------------------------------------------------------"
echo -e "\E[30;35m Creating Logical Volume `hostname`" ; tput sgr0
echo "---------------------------------------------------------------------------------------"
                echo -e "\E[30;33m  Please Provide Volume Group Name Were You Already Created (example=apps)" ; tput sgr0
vgs
echo "Please Provide Input"
read groupname
echo -e "\E[30;33m  Please Provide New Logical Volume Name (example=opt_wily)" ; tput sgr0
echo "Please Provide Input"
read lvname
echo -e "\E[30;33m  Please Provide Logical Volume Size to create in MB/BG (example=+1G/+100M)" ; tput sgr0
read size
lvcreate -L $size -n $lvname $groupname
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32mLogical volume Created Successfully" ; tput sgr0
                else
                echo -e '\E[30;31m Error While Creating Logical volume (please provide correct diskname,size,groupname)'; tput sgr0
                fi
                echo "Press [enter] key to continue. . ."
            echo -n "Enter selection: "
            read selection
            clear
            ;;

               ## --------------------------------------<script ending>-----------------------------------------##

6 ) echo "---------------------------------------------------------------------------------------"
echo -e "\E[30;35m Extending Logical Volume  `hostname`" ; tput sgr0
echo "---------------------------------------------------------------------------------------"
                echo -e "\E[30;33m  Please Provide Volume Group Name Were You Already Created (example=apps)" ; tput sgr0
vgs
echo "Please Provide Input"
read groupname
echo -e "\E[30;33m  Please Provide New Logical Volume Name Were You Already Created (example=opt_wily)" ; tput sgr0
lvs
echo "Please Provide Input"
read lvname
echo -e "\E[30;33m  Please Provide Logical Volume Size to Increase in MB/BG (example=+1G/+100M)" ; tput sgr0
read size
lvextend -L $size -n /dev/$groupname/$lvname
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32m Logical volume Created Successfully" ; tput sgr0
                else
                echo -e '\E[30;31m Error While Creating Logical volume (please provide correct diskname,size,groupname)'; tput sgr0
                fi
echo -e " \E[30;33m Resizeing The Disk Space" ; tput sgr0
resize2fs -p /dev/$groupname/$lvname
e2fsck -f /dev/test/aswath_test
echo ""
                echo "Press [enter] key to continue. . ."
            echo -n "Enter selection: "
            read selection
            clear
            ;;
                    ## -------------------------------<script ending /end>--------------------------------------------##



                     ## --------------------------------------<Wrong Number condition>--------------------------##
        7 ) echo "---------------------------------------------------------------------------------------"
echo -e "\E[30;35m Creating Filesystem In Newly Creating Logical volume `hostname`" ; tput sgr0
echo "---------------------------------------------------------------------------------------"
                echo -e "\E[30;33m  Please Provide Volume Group Name Were You Already Created (example=apps)" ; tput sgr0
vgs
echo "Please Provide Input"
read groupname
echo -e "\E[30;33m  Please Provide Logical Volume Name Were You Already Created (example=opt_wily)" ; tput sgr0
lvs
echo "Please Provide Input"
read lvname
mkfs.ext3 /dev/$groupname/$lvname
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32m Filesystem Created Successfully" ; tput sgr0
                else
                echo -e '\E[30;31m Error While Creating Filesystem (please provide correct diskname,groupname)'; tput sgr0
                fi
                echo "Press [enter] key to continue. . ."
            echo -n "Enter selection: "
            read selection
            clear
            ;;
               ## --------------------------------------<Wrong Number condition/end>----------------------------##

8 ) echo "---------------------------------------------------------------------------------------"
echo -e "\E[30;35m Creating MountPoint Making Entry In FSTAB`hostname`" ; tput sgr0
echo "---------------------------------------------------------------------------------------"
                echo -e "\E[30;33m  Please Provide The mount Point (example=/mountpoint/mount)" ; tput sgr0
read mountpoint
echo -e "\E[30;33m  Please Provide Partitiion Name Which Needs To Mount (example=/dev/apps/opt_wily)" ; tput sgr0
lvs
echo "Please Provide Input"
read devicename
mkdir -p $mountpoint
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32m Mountpoint Created Successfully" ; tput sgr0
                else
                echo -e '\E[30;31m Error While Creating Mountpoint (please provide correct Mountpoint Name)'; tput sgr0
                fi
echo "$devicename  $mountpoint  ext3 defaults 0 0" >> /etc/fstab
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32m Entry Added Successfully In FSTAB" ; tput sgr0
                else
                echo -e '\E[30;31m Error While Adding FSTAB Entry '; tput sgr0
                fi
mount $mountpoint
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32m Partition Mounted Successfully " ; tput sgr0
                else
                echo -e '\E[30;31m Error While Mounting Filesystem '; tput sgr0
                fi
echo ""
echo ""
mount -v | grep $mountpoint
                echo "Press [enter] key to continue. . ."
            echo -n "Enter selection: "
            read selection
            clear
            ;;
9 ) echo "---------------------------------------------------------------------------------------"
echo -e "\E[30;35m Shrinking Existing Logical Volume `hostname`" ; tput sgr0
echo "---------------------------------------------------------------------------------------"
echo ""
echo -e "\E[30;31m ***************************************************************"
echo "PLEASE UNMOUNT THE PARTITION MANUALLY WHICH IS GOING TO SHRING"
echo "***************************************************************" ; tput sgr0
                echo -e "\E[30;33m  Please Provide Volume Group Name Were You Already Created (example=apps)" ; tput sgr0
vgs
echo "Please Provide Input"
read groupname
echo -e "\E[30;33m  Please Provide Logical Volume Name Were You Already Created (example=opt_wily)" ; tput sgr0
lvs
echo "Please Provide Input"
read lvname
echo -e "\E[30;33m  Please Provide The Accurate Size to Reduce The Partition (example=1G) WITHOUT + OR -" ; tput sgr0
read rsize
resize2fs /dev/$groupname/$lvname $rsize
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32m RESIZE2FS RAN SUCCESSFULLY " ; tput sgr0
                else
                echo -e '\E[30;31m ERROR IN RUNNING RESIZE2FS '; tput sgr0
                fi
sleep 10
echo ""
lvresize -L $rsize -n /dev/$groupname/$lvname
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32m LVRESIZE COMMAND RAN SUCCESSFULLY " ; tput sgr0
                else
                echo -e '\E[30;31m ERROR WHILE RUNNING LVRESIZE PLEASE PROVIDE THE CORRECT NAMES '; tput sgr0
                fi
mount /dev/$groupname/$lvname
echo ""
echo "Press [enter] key to continue. . ."
            echo -n "Enter selection: "
            read selection
            clear
            ;;
10 )     echo "---------------------------------------------------------------------------------------"
echo -e "\E[30;35m Removing Logical Volume `hostname`" ; tput sgr0
echo "---------------------------------------------------------------------------------------"
echo -e "\E[30;31m ***************************************************************"
echo "PLEASE UNMOUNT THE PARTITION MANUALLY WHICH IS GOING TO REMOVE"
echo "***************************************************************" ; tput sgr0
                echo -e "\E[30;33m  Please Provide Volume Group Name Were You Already Created (example=apps)" ; tput sgr0
vgs
echo "Please Provide Input"
read groupname
echo -e "\E[30;33m  Please Provide Logical Volume Name Were You Already Created (example=opt_wily)" ; tput sgr0
lvs
echo "Please Provide Input"
read lvname
lvremove /dev/$groupname/$lvname
if [ $? -eq 0 ] ; then
                echo -e " \E[30;32mLogical volume Removed Successfully" ; tput sgr0
                else
                echo -e '\E[30;31m Error While Removing Logical volume (please provide correct diskname,groupname)'; tput sgr0
                fi
                echo "Press [enter] key to continue. . ."
            echo -n "Enter selection: "
            read selection
            clear
            ;;

11 )     echo "---------------------------------------------------------------------------------------"
echo -e "\E[30;35m Scanning Disk To Fix And Scan Errors `hostname`" ; tput sgr0
echo "---------------------------------------------------------------------------------------"
echo -e "\E[30;33m  Please Provide Volume Group Name Were You Already Created (example=apps)" ; tput sgr0
vgs
echo "Please Provide Input"
read groupname
echo -e "\E[30;33m  Please Provide Logical Volume Name Were You Already Created (example=opt_wily)" ; tput sgr0
lvs
echo "Please Provide Input"
read lvname
lvscan -v
sleep 5
pvscan -v
sleep 5
vgscan -v
sleep 5
echo "Press [enter] key to continue. . ."
            echo -n "Enter selection: "
            read selection
            clear
            ;;

12 ) echo "Thank You `whoami` For Using This LVM Script, Any compliants Please Mail <initredhat@aol.com>"
sleep 3
exit
           
            ;;
   
                     ## --------------------------------------<Wrong Number condition>--------------------------##
        * ) echo "Ooops , You Enter A Wrong Number "
            echo "Please , Choose a number from The menu Above from (1 to 11)"
            echo "Press [enter] key to try again....."
            read
            ;;


               ## --------------------------------------<Wrong Number condition/end>----------------------------##
    esac
done

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

                                             ########################################################################
                                             #                                                                      #
                                             #                          ENDING OF THE SCRIPT                        #
                                             #                                                                      #
                                             ########################################################################
