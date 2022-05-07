KDIR ?= /lib/modules/`uname -r`/build
DEST ?= build

default:
	mkdir -p $(DEST)
	find $(DEST)/ -type l -exec rm {} +
	ln -sr src/* $(DEST)/
	$(MAKE) -C $(KDIR) M=$(abspath $(DEST))

install:
	$(MAKE) -C $(KDIR) M=$(abspath $(DEST)) modules_install
	depmod -a
	sync

clean:
	-rm -r $(DEST)

run:
	$(MAKE)
	-sudo modprobe -r ithc
	sudo $(MAKE) install
	sudo modprobe ithc

$(DEST)/%: src/%.c
	mkdir -p $(DEST)
	$(CC) $(CFLAGS) -W -Wall -Wextra -Werror -o $@ $<

dump: $(DEST)/ithc-dump

