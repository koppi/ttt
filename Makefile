# update the VERSION before a new release
# -- " --  to set the DESTDIR env. variable when installing
#
# Set CC and CFGLAGS in your local environment for a suitable
# compiler (tcc?) and CFLAGS (-Os -W -Wall -Werror)

VERSION        = 0.0.3-beta3
CFG_OPTS      ?= 
CC            ?= @gcc
CPPFLAGS      += $(CFG_OPTS)

all: ttt

ttt.o: Makefile ttt.c

clean:
	-@$(RM) ttt ttt.o

distclean: clean
	-@$(RM) *.o *~

install: all
	@install -D -m 0755 ttt $(DESTDIR)/bin/ttt

uninstall:
	-@$(RM) $(DESTDIR)/bin/ttt

dist:
	@git archive --format=tar --prefix=ttt-$(VERSION)/ $(VERSION) | gzip >../ttt-$(VERSION).tar.gz
	@(cd .. && md5sum    ttt-$(VERSION).tar.gz > ttt-$(VERSION).tar.gz.md5)
	@(cd .. && sha256sum ttt-$(VERSION).tar.gz > ttt-$(VERSION).tar.gz.sha256)

release: dist
	@echo "Resulting release files in parent dir:"
	@echo "=================================================================================================="
	@for file in ttt-$(VERSION).tar.gz; do					\
                printf "%-33s Distribution tarball\n" $$file;                           \
                printf "%-33s " $$file.md5;    cat ../$$file.md5    | cut -f1 -d' ';    \
                printf "%-33s " $$file.sha256; cat ../$$file.sha256 | cut -f1 -d' ';    \
	done
