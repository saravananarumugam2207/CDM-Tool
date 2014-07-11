CDM-Tool
========

Completed Disk Management Tool Pre-Release

This Script is Created As a Part of Hobby. Please expect Delay in Response to the Query's and Concern's.

***** !!!!! USE THIS SCRIPT WITH CAUSION !!!!! ***** 
***** !!!!! SCRIPT WILL ALTER YOUR DISK  !!!!! *****


SAMPLE OUTPUT : 1 
  
  ---------------------------------------------
   Choose From Below Options
  ---------------------------------------------
  
 1) Display existing LV's PV's VG's info's

 2) Create Physical Volume

 3) Create Volume Group

 4) Extend Existing Volume Group

 5) Create Logical Volume

 6) Extend Logical Volume

 7) Create Filesystem In Newly Created Logical Volume

 8) Mount Newly created Logical Volume

 9) Shrink Existing Logical Volume

 10) Remove Existing Logical Volume

 11) Scan LVM for Errors


 12) EXIT


Choose From Above: 



SAMPLE OUTPUT : 2

---------------------------------------------------------------------------------------
 Gathered General Information About the LVM oc5302440845.example.com
---------------------------------------------------------------------------------------

 Physical Volume Details
-----------------------
  PV                                                    VG              Fmt  Attr PSize   PFree
  /dev/mapper/luks-38e37e3b-4bd3-4838-a2d4-dab72fe5b7a1 vg_oc1084655053 lvm2 a--  297.09g    0 
  /dev/ram0                                                                  ---       0     0 
  /dev/ram1                                                                  ---       0     0 
  /dev/ram10                                                                 ---       0     0 
  /dev/ram11                                                                 ---       0     0 
  /dev/ram12                                                                 ---       0     0 
  /dev/ram13                                                                 ---       0     0 
  /dev/ram14                                                                 ---       0     0 
  /dev/ram15                                                                 ---       0     0 
  /dev/ram2                                                                  ---       0     0 
  /dev/ram3                                                                  ---       0     0 
  /dev/ram4                                                                  ---       0     0 
  /dev/ram5                                                                  ---       0     0 
  /dev/ram6                                                                  ---       0     0 
  /dev/ram7                                                                  ---       0     0 
  /dev/ram8                                                                  ---       0     0 
  /dev/ram9                                                                  ---       0     0 
  /dev/root                                                                  ---       0     0 
  /dev/sda1                                                                  ---       0     0 
  /dev/sda2                                                                  ---       0     0 
  /dev/vg_oc1084655053/lv_swap                                               ---       0     0 

 Volume Groups Details
---------------------
    Finding all volume groups
    Finding volume group "vg_oc1084655053"
  VG              Attr   Ext    #PV #LV #SN VSize   VFree VG UUID                                VProfile
  vg_oc1084655053 wz--n- 32.00m   1   2   0 297.09g    0  3Dejah-lGTe-TIPE-4Men-lzPf-FLCE-5JHT2w         

 Logical Volume Details
----------------------
    Finding all logical volumes
  LV      VG              #Seg Attr       LSize   Maj Min KMaj KMin Pool Origin Data%  Meta%  Move Cpy%Sync Log Convert LV UUID                                LProfile
  lv_root vg_oc1084655053    1 -wi-ao---- 289.09g  -1  -1 253  1                                                        O0Lgkk-Z6xY-htv4-QtKu-Y5n9-O51X-YSQ453         
  lv_swap vg_oc1084655053    1 -wi-ao----   8.00g  -1  -1 253  2                                                        vOjH2F-NIEn-CyRm-keRC-BlAm-roiA-YCQycb         

---------------------------------------------------------------------------------------
Press [enter] key to continue. . .
Enter selection: 

