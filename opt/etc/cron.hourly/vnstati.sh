#!/bin/sh

ETH='ppp0'
WWW_ROOT='/opt/share/www/custom'

vnstati -s -i $ETH -o $WWW_ROOT/vnstat.png
vnstati -h -i $ETH -o $WWW_ROOT/vnstat_h.png
vnstati -d -i $ETH -o $WWW_ROOT/vnstat_d.png
vnstati -t -i $ETH -o $WWW_ROOT/vnstat_t.png
vnstati -m -i $ETH -o $WWW_ROOT/vnstat_m.png
