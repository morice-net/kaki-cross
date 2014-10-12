import QtQuick 2.0

Item {
    id: kkcPageSettings
    width: global.width
    height: global.height

    Image {
        id: gears
        source: "../../Pictures/KkcMainGears.png"
        anchors.right: parent.right ; anchors.bottom: parent.bottom

        MouseArea {
            anchors.fill: parent

            onClicked: {
                gears.opacity = 0;
                kkcPageSettings.destroyPage();
                global.backMenu()
            }
        }
        Behavior on opacity { PropertyAnimation { duration: 800 } }

    }
    Keys.onEscapePressed: {
        kkcPageSettings.destroyPage();
        global.backMenu()
}
}
