#!/usr/bin/env sh

for year in $(seq 2020 2021); do
	mkdir -p ~/work/timesheets/${year}
	for week in $(seq -w 1 53); do
		cp ~/work/timesheets/backup.xlsx ~/work/timesheets/${year}/$1_W${week}_${year}.xlsx
	done
done
