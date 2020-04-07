# Use a Debian Image
FROM arm32v7/debian:stretch-slim

#ARM Support
COPY qemu-arm-static /usr/bin

# Update and Upgrade Repo
RUN apt update && apt full-upgrade -y && apt autoremove && apt clean

# Install ClamAV Deamon
RUN apt install hostapd wireless-tools

# Configuration Volumes
VOLUME ["/etc/hostapd.conf"]

# Define Environment Variables
ENV WIFI_INTERFACE="wlan0"
ENV WIFI_DRIVER="nl80211"
ENV WIFI_SSID="WIFI_SSID"
ENV WIFI_CHANNEL="6"
ENV WIFI_MODE="g"
ENV WIFI_MODE_N = "1"
ENV WIFI_AUTH="1"
ENV WIFI_WPA="2"
ENV WIFI_PASSPHRASE="PASSPHRASE"

# Copy conf file
COPY ./hostapd.conf /etc/hostapd/hostapd.conf.conf

CMD ["hostapd -t"]
