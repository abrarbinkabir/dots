#!/usr/bin/env bash

gr_dt=$(date '+%d')
gr_mo=$(date '+%m')
gr_yr=$(date '+%Y')

hr_now=$(date '+%H')
hr_start=$(($hr_now-6))

if [ $hr_start -lt 0 ]; then
	gr_dt=$(($gr_dt-1))		
fi

month=("Boishakh" "Jyoistho" "Asharh" "Shrabon" "Bhadro" "Ashshin" "Kartik" "Ogrohayon" "Poush" "Magh" "Falgun" "Choitro")
start=(14 15 15 16 16 16 17 16 16 15 14 15)
end=(14 14 15 15 15 16 15 15 14 13 14 13)
day=(30 31 30 31 31 30 31 30 31 31 28 31)

if [ $gr_mo -eq 4 ]; then
	if [ $gr_dt -lt 14 ]; then
		bs_yr=$(( $gr_yr - 594 ))
	else
		bs_yr=$(( $gr_yr - 593 ))
	fi
elif [ $gr_mo -lt 4 ]; then
	bs_yr=$(( $gr_yr - 594 ))
elif [ $gr_mo -gt 4 ]; then
	bs_yr=$(( $gr_yr - 593 ))
fi


if [ $gr_mo -eq 4 ]; then
  i=0
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
elif [ $gr_mo -eq 5 ]; then
  i=1
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
elif [ $gr_mo -eq 6 ]; then
  i=2
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
 
elif [ $gr_mo -eq 7 ]; then
  i=3
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
elif [ $gr_mo -eq 8 ]; then
  i=4
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi

elif [ $gr_mo -eq 9 ]; then
  i=5
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
elif [ $gr_mo -eq 10 ]; then
  i=6
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
elif [ $gr_mo -eq 11 ]; then
  i=7
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
elif [ $gr_mo -eq 12 ]; then
  i=8
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
elif [ $gr_mo -eq 1 ]; then
  i=9
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
elif [ $gr_mo -eq 2 ]; then
  i=10
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
elif [ $gr_mo -eq 3 ]; then
  i=11
  comp=${start[i]}	
	if [ $gr_dt -ge $comp ]; then 
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($gr_dt - ($starts -1)))
	elif [ $gr_dt -lt $comp ]; then
		i=$(($i-1))
		starts=${start[$i]}
		days=${day[$i]}
		bs_mo=${month[$i]}
		bs_dt=$(($days - $starts + 1 + $gr_dt))
	fi
fi













