#!/bin/bash
cd $1 || exit
list1=$(ls ${1})
for x in $list1 ; do
	if [ -d "$x" ] ; then
		cd "$x" || exit
		perl-rename 'y/A-Z/a-z/' * && perl-rename 'y/ /-/' * && echo "renamed 2nd layer"
		cd ..
	fi
done
perl-rename 'y/A-Z/a-z/' * && perl-rename 'y/ /-/' * && echo "renamed 1st layer"
