# Using vnstat
This guide will help you to configure [vnstat](http://humdi.net/vnstat/) package to collect and [plot](http://humdi.net/vnstat/cgidemo/) network statistics for chosen network interface(s).

## Installation

* [Install](https://bitbucket.org/padavan/rt-n56u/wiki/EN/HowToConfigureEntware) Entware,
* Install necesary packages:
```
opkg install vnstati cron
```
* Configure cron, download cron job and make it executable:
```
sed -i 's|root|admin|g' /opt/etc/crontab
wget --no-check-certificate -O /opt/etc/cron.hourly/vnstati.sh https://raw.githubusercontent.com/DontBeAPadavan/vnstat/master/opt/etc/cron.hourly/vnstati.sh
chmod +x /opt/etc/cron.hourly/vnstati.sh
```
* `ppp0` interface statistics will collected by default. You should replace it if you want to monitor another one. Pick `eth2.2` interface if you've got dynamic/static IP connection to ISP:
```
sed -i 's|ppp0|eth2.2|g' /opt/etc/init.d/S32vnstat
sed -i 's|ppp0|eth2.2|g' /opt/etc/cron.hourly/vnstati.sh
```
* Make folder for WebUI images and download index file:
```
mkdir -p /opt/share/www/custom
wget -O /opt/share/www/custom/vnstat.html http://humdi.net/vnstat/cgidemo/
/opt/etc/cron.hourly/vnstati.sh
```
* Start cron and vnstatd services, they will be started automatically on every boot:
```
/opt/etc/init.d/S10cron start
/opt/etc/init.d/S32vnstat start
```
* Done! You may show interface stats via console...
```
# vnstat -h -i eth2.2
 eth2.2                                                                   15:04
  ^                                                           r
  |                                                        r  r
  |  r                                                     r  r
  |  r                                                     r  r
  |  r                                                  r  r  r
  |  r                                                  r  r  r
  |  r                                                  r  r  r
  |  r                                                  r  r  r  r
  |  r                                                  r  r  r  r  r
  |  r                                               r  r  r  r  r  r
 -+--------------------------------------------------------------------------->
  |  16 17 18 19 20 21 22 23 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15

 h  rx (KiB)   tx (KiB)      h  rx (KiB)   tx (KiB)      h  rx (KiB)   tx (KiB)
16      52111       5161    00        374         48    08       6089        348
17        376         46    01        374         46    09      41121       2644
18        376         48    02        374         47    10      53258       4048
19        376         46    03        371         47    11      59056       2947
20        376         48    04        382         47    12      23250       2139
21        373         47    05        403         48    13      17059       2099
22        374         47    06        405         47    14       3396       1283
23        373         47    07        405         48    15        200        128
```
...or via Web interface, by opening [http://my.router/custom/vnstat.html](http://my.router/custom/vnstat.html) URL. 
