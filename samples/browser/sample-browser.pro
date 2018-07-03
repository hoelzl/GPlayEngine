#--------------------------------------------------------------------
# path to build directory (generated by cmake)
#--------------------------------------------------------------------
PRE_TARGETDEPS += $$PWD/../../setup.pri
include($$PWD/../../setup.pri)

#--------------------------------------------------------------------
# project
#--------------------------------------------------------------------
QT -= core gui
TARGET = sample-browser
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
    QMAKE_POST_LINK += $$quote(rsync -rau $$PWD/game.config $${DESTDIR}/$${TARGET}.config$$escape_expand(\n\t))
}

#--------------------------------------------------------------------
# files
#--------------------------------------------------------------------
SOURCES += src/Audio3DSample.cpp \
    src/AudioSample.cpp \
    src/BillboardSample.cpp \
    src/FirstPersonCamera.cpp \
    src/FontSample.cpp \
    src/FormsSample.cpp \
    src/GamepadSample.cpp \
    src/GestureSample.cpp \
    src/Grid.cpp \
    src/InputSample.cpp \
    src/LightSample.cpp \
    src/MeshBatchSample.cpp \
    src/MeshPrimitiveSample.cpp \
    src/ParticlesSample.cpp \
    src/PhysicsCollisionObjectSample.cpp \
    src/PostProcessSample.cpp \
    src/Sample.cpp \
    src/SamplesGame.cpp \
    src/SceneCreateSample.cpp \
    src/SceneLoadSample.cpp \
    src/SpriteBatchSample.cpp \
    src/SpriteSample.cpp \
    src/TerrainSample.cpp \
    src/TextureSample.cpp \
    src/TriangleSample.cpp \
    src/WaterSample.cpp

HEADERS += src/Audio3DSample.h \
    src/AudioSample.h \
    src/BillboardSample.h \
    src/FirstPersonCamera.h \
    src/FontSample.h \
    src/FormsSample.h \
    src/GamepadSample.h \
    src/GestureSample.h \
    src/Grid.h \
    src/InputSample.h \
    src/LightSample.h \
    src/MeshBatchSample.h \
    src/MeshPrimitiveSample.h \
    src/ParticlesSample.h \
    src/PhysicsCollisionObjectSample.h \
    src/PostProcessSample.h \
    src/Sample.h \
    src/SamplesGame.h \
    src/SceneCreateSample.h \
    src/SceneLoadSample.h \
    src/SpriteBatchSample.h \
    src/SpriteSample.h \
    src/TerrainSample.h \
    src/TextureSample.h \
    src/TriangleSample.h \
    src/WaterSample.h

