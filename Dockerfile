# Use a Debian Image
FROM debian:stretch-slim

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
ENV WIFI_HW_MODE="g"
#Authentication "Open System Authentication"
ENV WIFI_AUTH_ALGS="192.168.0.0"
ENV WIFI_WPA="2"
ENV WIFI_WPA_PASSPHRASE="PASSPHRASE"
ENV NETWORK_RANGE_HIGH="192.168.0.50"
ENV DEFAULT_GATEWAY="192.168.0.1"
ENV BROADCAST="192.168.0.255"

# Copy default clamd configuration into container
COPY ./conf/dhcpd.conf /etc/dhcp/dhcpd.conf
RUN touch /var/lib/dhcp/dhcpd.leases

# ADD startUP.sh script into container and make runable
COPY ./startUP.sh ./startUP.sh
RUN chmod +x ./startUP.sh

# Start Update Virus Database and CLAMAV in foregournd
ENTRYPOINT ["./startUP.sh"]
CMD ["dhcpd"]
