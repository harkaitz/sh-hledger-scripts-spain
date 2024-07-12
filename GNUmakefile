.POSIX:
.SUFFIXES:
.PHONY: all clean install check
PROJECT   =hledger-scripts-spain
VERSION   =1.0.0
PREFIX    =/usr/local
PGC_PATH  =share/hledger-pgc

all: $(PGC_PATH)/pgc.hledger
clean:
	rm -f $(PGC_PATH)/pgc.hledger
install:
check:

## -- PGC (Plan General de Contabilidad) --
$(PGC_PATH)/pgc.hledger: $(PGC_PATH)/build.sh $(PGC_PATH)/PGC.txt
	cd $(PGC_PATH); ./build.sh PGC.txt > pgc.hledger
## ----------------------------------------
## -- BLOCK:license --
install: install-license
install-license: 
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
	cp COPYING $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
## -- BLOCK:license --
## -- BLOCK:sh --
install: install-sh
install-sh:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp bin/dsetup-fnmt-rcm  $(DESTDIR)$(PREFIX)/bin
	cp bin/dsetup-dnie      $(DESTDIR)$(PREFIX)/bin
	cp bin/lsetup-registradores-d2 $(DESTDIR)$(PREFIX)/bin
	cp bin/hlnk-registradores $(DESTDIR)$(PREFIX)/bin
	cp bin/hlnk-fnmt-newcert $(DESTDIR)$(PREFIX)/bin
	cp bin/hlnk-aeat-sl     $(DESTDIR)$(PREFIX)/bin
	cp bin/htodo-aeat-303   $(DESTDIR)$(PREFIX)/bin
	cp bin/hledger-ca       $(DESTDIR)$(PREFIX)/bin
	cp bin/hlnk-regmer      $(DESTDIR)$(PREFIX)/bin
	cp bin/txtc-303         $(DESTDIR)$(PREFIX)/bin
	cp bin/hledger-200      $(DESTDIR)$(PREFIX)/bin
	cp bin/txtc-200         $(DESTDIR)$(PREFIX)/bin
	cp bin/htodo-aeat-200   $(DESTDIR)$(PREFIX)/bin
	cp bin/htodo-regm-ca    $(DESTDIR)$(PREFIX)/bin
	cp bin/hledger-ca-ba    $(DESTDIR)$(PREFIX)/bin
	cp bin/hledger-ca-pg    $(DESTDIR)$(PREFIX)/bin
	cp bin/hledger-ca-mem   $(DESTDIR)$(PREFIX)/bin
	cp bin/hledger-ca-ida1  $(DESTDIR)$(PREFIX)/bin
	cp bin/hledger-es       $(DESTDIR)$(PREFIX)/bin
	cp bin/hledger-info     $(DESTDIR)$(PREFIX)/bin
	cp bin/hledger-ca-ida2  $(DESTDIR)$(PREFIX)/bin
install: install-share
install-share:
	mkdir -p $(DESTDIR)$(PREFIX)/share
	cp -r share/pgc $(DESTDIR)$(PREFIX)/share
	cp -r share/hledger-pgc $(DESTDIR)$(PREFIX)/share
	cp -r share/doc $(DESTDIR)$(PREFIX)/share
## -- BLOCK:sh --
