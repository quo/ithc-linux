Linux driver for Intel Touch Host Controller
============================================

Installation
------------

- Install prerequisites (e.g. Debian packages: `build-essential` and `linux-headers-amd64`)
- `make && sudo make install`
- `sudo modprobe ithc` (or reboot)
- Check dmesg for ithc messages/errors.

Notes
-----

If you get an error in dmesg saying "Blocked an interrupt request due to
source-id verification failure", you will need to add the kernel parameter
`intremap=nosid` and reboot. Alternatively, use the driver in polling mode
by setting the `poll` module parameter.

The driver works in single-touch mode by default. Multitouch and pen data
is made available to userspace through /dev/ithc. To enable multitouch
functionality, you will need to install a version of iptsd with ithc support.

The driver can be made to function as a HID transport driver by setting
the `hid` module parameter. This mode is currently not recommended.

To enable debug logging use the module parameter `dyndbg=+pflmt`.


License: Public domain/CC0.

