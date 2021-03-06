# Add more folders to ship with the application, here
folder_01.source = qml/Sources
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    ../Pictures/KkcBackground.png \
    ../Pictures/KkcBackgroundDarkFog.png \
    ../Pictures/KkcBackgroundLightFog.png \
    ../Pictures/KkcMainGears.png \
    ../Pictures/KkcMainTitle.png \
    ../Pictures/KkcStartButton.png \
    ../Pictures/Bomb.png \
    ../Pictures/Exploded.png \
    ../Pictures/BasicBomb.png \
    ../Pictures/BasicBoard.png \
    qml/Sources/KkcBomb.qml \
    ../Pictures/BasicClock.png \
    ../Pictures/KkcDefuse.png \
    ../Pictures/KkcExplosion.png \
    ../Pictures/KkcFlame.png
