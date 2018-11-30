# Raspberry Pi 3 B/B+ Network test image

## AP Mode Notes


Needs

1. dnsmasq
1. hostapd

Ensure after running `./apply-config 3` be sure to restart `dhcpd`:

```
/etc/init.d/S41dhcpd restart
```


Bring up the `wlan0` interface

```
ifup wlan0
```


You can run `ifconfig` to ensure that the static IP
that is in the `3/etc/network/interface` for the `wlan0`.

Run:

```
/etc/init.d/S80dnsmasq start
```

If all goes well run:

```
/usr/sbin/hostapd 3/etc/hostapd/hostapd.conf
```

You should see `Pi3-AP` appear in your network settings as a netowrk to join.

somewhat good reference: https://frillip.com/using-your-raspberry-pi-3-as-a-wifi-access-point-with-hostapd/
