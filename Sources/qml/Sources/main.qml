import QtQuick 2.0


Rectangle {
    id: kkcPageHome
    width: 600
    height: 800
    Image {
        id: background
        width: 800
        height: 800
        source: "../../Pictures/KkcBackground.png"

        Image {
            id: darkFog
            width: 820
            height: 820
            source: "../../Pictures/KkcBackgroundDarkFog.png"
            opacity: 0.95
            SequentialAnimation on x {
                loops: Animation.Infinite
                PropertyAnimation { from: background.x - 20; to: background.x; easing.type: Easing.OutCurve; duration: 2000 }
                PropertyAnimation { from: background.x; to: background.x - 20; easing.type: Easing.OutCurve; duration: 1800 }
            }
            SequentialAnimation on y {
                loops: Animation.Infinite
                PropertyAnimation { from: background.y - 20; to: background.y; easing.type: Easing.OutCurve; duration: 1700 }
                PropertyAnimation { from: background.y; to: background.y - 20; easing.type: Easing.OutCurve; duration: 2050 }
            }
        }
        Image {
            id: lightFog
            width: 820
            height: 820
            source: "../../Pictures/KkcBackgroundLightFog.png"
            opacity: 0.95
            SequentialAnimation on x {
                loops: Animation.Infinite
                PropertyAnimation { from: background.x; to: background.x - 20; easing.type: Easing.OutCurve; duration: 1800 }
                PropertyAnimation { from: background.x - 20; to: background.x; easing.type: Easing.OutCurve; duration: 1800 }
            }
            SequentialAnimation on y {
                loops: Animation.Infinite
                PropertyAnimation { from: background.y; to: background.y - 20; easing.type: Easing.OutCurve; duration: 1800 }
                PropertyAnimation { from: background.y - 20; to: background.y; easing.type: Easing.OutCurve; duration: 1800 }
            }
        }

    }

    KkcMenuButton {
        id: start
        buttonText: qsTr("Start !")

        MouseArea {
            id: startArea
            anchors.fill: parent

            onPressed: {
                console.log("Game starting, load level selector.");
                title.y = -400;
                gears.opacity = 0;
                Qt.quit()
            }
        }
    }

    Image {
        id: title
        source: "../../Pictures/KkcMainTitle.png"

        anchors.horizontalCenter: parent.horizontalCenter
        height: 400

        PropertyAnimation on y { from: -400; to: -80; easing.type: Easing.OutElastic; duration: 1200 }
        Behavior on y { PropertyAnimation { easing.type: Easing.InElastic; duration: 800 } }
    }

    Image {
        id: gears
        source: "../../Pictures/KkcMainGears.png"
        anchors.right: parent.right ; anchors.bottom: parent.bottom

        MouseArea {
            id: gearsArea
            anchors.fill: parent

            onPressed: {
                console.log("Settings called, gears pressed.");
                title.y = -400;
                start.opacity = 0;
            }
        }

        PropertyAnimation on opacity { from: 0; to: 1; duration: 1200 }
        Behavior on opacity { PropertyAnimation { duration: 800 } }
    }

    Behavior on opacity { PropertyAnimation { duration: 800 } }

    Component.onDestruction: {
        kkcPageHome.opacity = 0;
        console.log("KkcHomePage destroyed.")
    }


}
