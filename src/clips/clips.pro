include( $$(QMKBLD)/root.pri )

QT -= gui
TEMPLATE = app
TARGET = clips
DESTDIR = $$PRJ_BIN
DEPENDPATH += . 
INCLUDEPATH += ../../clips

LIBS += -L$$PRJ_LIB -lclips


# Input
#HEADERS += 
SOURCES += clips.cc
