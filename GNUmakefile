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
	cp bin/hledger-pgc      $(DESTDIR)$(PREFIX)/bin
install: install-share
install-share:
	mkdir -p $(DESTDIR)$(PREFIX)/share
	cp -r share/hledger-pgc $(DESTDIR)$(PREFIX)/share
## -- BLOCK:sh --
