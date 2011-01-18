#!/bin/sh

qemuopts="-hda obj/kern/kernel.img"
. ./grade-functions.sh


$make
run

# The ugly slashes are because () are egrep special characters.
pts=10
quicktest 'Physical page management' \
	'check_page_alloc\(\) succeeded!' \

showpart A

pts=30
quicktest 'Page table management' \
	'page_check\(\) succeeded!' \

pts=20
quicktest 'Page directory' \
	'check_boot_pgdir\(\) succeeded!' \

showpart B

showfinal
