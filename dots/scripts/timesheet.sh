#!/usr/bin/env sh

gid="Z003WAEF"

for year in $(seq 2020 2021); do
	mkdir -p ~/work/timesheets/${year}
	for week in $(seq -w 1 53); do
		cp ~/work/timesheets/backup.xlsx ~/work/timesheets/${year}/Z003WAEF_W${week}_${year}.xlsx
	done
done
