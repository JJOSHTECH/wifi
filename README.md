# wifi
Wifi Accesspoint there is no DHCP Server included. You will need an external one.

## Variables

* WIFI_INTERFACE: default="wlan0" if you have a different Name for your wifi device, change it. Check with "ip a".
* WIFI_DRIVER: default="nl80211"
* WIFI_SSID: default="WIFI" change it to any Value you want which is a legal WIFI Name* 
* WIFI_CHANNEL: default="0" if you think another channel is better for you change it. (Range 1-13 if you want to use in 2.4GHz)
* WIFI_MODE: default="g" g is for 2.4GHz change to a for 5GHz. Don't forget to change the Channel.
* WIFI_MODE_N: default="1" if you don't want to use WIFI n standard set to 0. If you use 5GHz only disable too.
* WIFI_AUTH: default="1" better don't change if you don't know what are you doing.
* WIFI_WPA: default="2" better don't change. Default is WPA2 if you want to change to WPA use 1 and if you don't want to use * WPA use 0. Only WPA2 is recommended because the others are very unsecure.
* WIFI_PASSPHRASE: default="WIFI" change to a secure Password for your WIFI.
