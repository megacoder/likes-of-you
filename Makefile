#########################################################################
# vim: ts=8 sw=8
#########################################################################
# Author:   tf135c (James Reynolds)
# Filename: Makefile
# Date:     2007-02-26 10:21:44
#########################################################################
# Note that we use '::' rules to allow multiple rule sets for the same
# target.  Read that as "modularity exemplarized".
#########################################################################

PREFIX	:=${HOME}/opt/$(shell uname -m)
BINDIR	=${PREFIX}/bin

TARGETS	=all clean distclean clobber check install uninstall tags
TARGET	=all

SUBDIRS	=

.PHONY:	${TARGETS} ${SUBDIRS}

CCMODE	=32
#CCMODE	=64
FN	=1
DEFS	=-DFN=${FN}
CC	=ccache gcc -m${CCMODE} -std=gnu99
OPT	=-Os
INCS	=-I.
CFLAGS	=${OPT} -Wall -Wextra -Werror -pedantic -pipe -g ${DEFS} ${INCS}

.SUFFIXES: .lst

%.lst:	%.o
	objdump -dS $< >$@

all::	likes-of-you-${FN}.lst

likes-of-you-${FN}.o: likes-of-you.c
	${CC} ${CFLAGS} -o $@ -c $<

${TARGETS}::

clean::
	${RM} a.out *.o core.* lint tags

distclean clobber:: clean
	${RM} *.lst

check::	likes-of-you.lst
	less likes-of-you.lst

tags::
	ctags -R .

# ${TARGETS}::
# 	${MAKE} TARGET=$@ ${SUBDIRS}

# ${SUBDIRS}::
# 	${MAKE} -C $@ ${TARGET}

kitchensink:
	for FN in 1 2 3 4; do ${MAKE} FN=$${FN} all; done
