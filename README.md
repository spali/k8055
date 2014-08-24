# k8055 library and command line utility

This library provides access to the Velleman K8055 USB Experiment Board for operating systems supporting libusb-1.0 (http://www.libusb.org/wiki/libusb-1.0), such as Linux. While providing a high-level interface to the user, the library communicates with a k8055 board through libusb.

## Requirements
- gcc
- make
- libusb-1.0 (Ubuntu package libusb-dev)

## Documentation

### Installation
Download the repository to a directory and use ```make install``` to install the library and command line untility. This also installs ```/etc/udev/rules.d/k8055.rules``` to allow the newly created group k8055 to use the board(s).
For each user that you want to grant access to the board you can add the user to the k8055 group:
	```usermod -a -G k8055 $(USER)```

Additional this can be defined during installation:
	```make install USERS="myuser1 myuser2"```

### Uninstall

	```make uninstall```

## Authors

- 2005 by Sven Lindberg <k8055@k8055.mine.nu> http://libk8055.sourceforge.net

## License

Licenced under GPL as from the original developer

## Tested

- Ubuntu 14.04.1 LTS, kernel 3.13.0-34-generic, x86_64, August 2014
