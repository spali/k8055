UDEV=/etc/udev/rules.d
ifdef PREFIX
	UDEV=$(PREFIX)/etc/udev/rules.d
endif


build:
	make -C src

clean:
	make clean -C src
	rm -rf target

install: build install-permission
	make install -C src PREFIX=$(PREFIX)

install-permission:
	if !(test -d $(UDEV)); then \
		mkdir -p $(UDEV); \
	fi
	cp k8055.rules $(UDEV)/k8055.rules
	-groupadd --force --system k8055
	$(foreach user, $(USERS), usermod -a -G k8055 $(user);)

uninstall: uninstall-permission
	rm -f $(PREFIX)/lib/libk8055.*
	rm -f $(PREFIX)/usr/local/share/man/man1/k8055.*
	rm -f $(PREFIX)/include/k8055.*
	rm -f $(PREFIX)/bin/k8055
	find $(PREFIX) -type d -empty -delete

uninstall-permission:
	rm -f $(UDEV)/k8055.rules
	-groupdel k8055


