
MANPAGE_SECTION = 8

all: man

man: pmailq.${MANPAGE_SECTION}

pmailq.${MANPAGE_SECTION}: pmailq.pod
	pod2man --center "" --date "" --release "" --section=${MANPAGE_SECTION} pmailq.pod > pmailq.${MANPAGE_SECTION}

clean:
	rm -f pmailq.${MANPAGE_SECTION}

.PHOMY: man
