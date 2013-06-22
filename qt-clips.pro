#

# This include is not strictly necessary but
# might be good way to catch errors early
include( $$(QMKBLD)/root.pri )


TEMPLATE = subdirs
SUBDIRS = clips src #test
