#!/usr/bin/python
import sys
import socket
import re

SSDP_ADDR = "239.255.255.250";
SSDP_PORT = 1900;
SSDP_MX = 3;
SSDP_ST = "urn:dial-multiscreen-org:service:dial:1";
# SSDP_ST = "uuid:c236ff0d-9140-4087-b370-d1bbf416a515"
# SSDP_ST = ""

ssdpRequest = "M-SEARCH * HTTP/1.1\r\n" + \
                "HOST: %s:%d\r\n" % (SSDP_ADDR, SSDP_PORT) + \
                "MAN: \"ssdp:discover\"\r\n" + \
                "MX: %d\r\n" % (SSDP_MX, ) + \
                "ST: %s\r\n" % (SSDP_ST, ) + "\r\n";

print(ssdpRequest)
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.sendto(ssdpRequest.encode('utf-8'), (SSDP_ADDR, SSDP_PORT))
# print(sock.recv(1024))
data = sock.recv(1024);
dyonddxml = data.decode('utf-8')
print(dyonddxml)
location = re.search("LOCATION(.+)",dyonddxml)
print(location.group(0))
wakeup = re.search("WAKEUP(.+)",dyonddxml)
print(wakeup.group(0))
