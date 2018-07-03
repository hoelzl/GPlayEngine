#--------------------------------------------------------------------
# path to build directory (generated by cmake)
#--------------------------------------------------------------------
PRE_TARGETDEPS += $$PWD/../../setup.pri
include($$PWD/../../setup.pri)

#--------------------------------------------------------------------
# project
#--------------------------------------------------------------------
QT -= core gui
TARGET = sample-character
TEMPLATE = app
CONFIG += c++11
CONFIG -= qt

DESTDIR = $$BUILD_DIR/bin
QMAKE_CLEAN += $$DESTDIR/$$TARGET

CONFIG(debug, debug|release):
    DEFINES += _DEBUG
DEFINES += GP_USE_GAMEPAD

INCLUDEPATH += $$BUILD_DIR/include/gplayengine/
INCLUDEPATH += $$BUILD_DIR/include/gplayengine/thirdparty

#--------------------------------------------------------------------
# platform specific
#--------------------------------------------------------------------
linux: {
    DEFINES += __linux__
    PRE_TARGETDEPS += $$BUILD_DIR/lib/thirdparty/libgplay-deps.a
    PRE_TARGETDEPS += $$BUILD_DIR/lib/libgplay.a
    LIBS += -L$$BUILD_DIR/lib/ -lgplay
    LIBS += -L$$BUILD_DIR/lib/thirdparty/ -lgplay-deps
    LIBS += -lm -lGL -lrt -ldl -lX11 -lpthread -lsndio
    QMAKE_POST_LINK += $$quote(rsync -rau $$PWD/game.dds.config $${DESTDIR}/$${TARGET}.config$$escape_expand(\n\t))
}

#--------------------------------------------------------------------
# files
#--------------------------------------------------------------------
SOURCES += src/CharacterGame.cpp
HEADERS += src/CharacterGame.h 
