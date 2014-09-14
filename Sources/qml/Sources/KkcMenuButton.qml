import QtQuick 2.0


Image {
    property string buttonText

    source: "../../Pictures/KkcStartButton.png"
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.margins: 400

    Text {
        id: startText
        anchors.fill: parent
        opacity: 1

        color: "#ffffff"
        text: parent.buttonText
        font.family: "Cantarell"
        font.bold: true
        font.italic: true
        font.pointSize: 36
        font.letterSpacing: -1
        styleColor: "#ffffff"

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        
        SequentialAnimation on font.pointSize {
            loops: Animation.Infinite
            PropertyAnimation { from: 35; to: 37; duration: 450 }
            PauseAnimation { duration: 80 }
            PropertyAnimation { from: 37; to: 35; duration: 450 }
            PauseAnimation { duration: 80 }
        }
    }

    SequentialAnimation on width {
        loops: Animation.Infinite
        PropertyAnimation { from: 215; to: 225; easing.type: Easing.OutCurve; duration: 450 }
        PauseAnimation { duration: 80 }
        PropertyAnimation { from: 225; to: 215; easing.type: Easing.OutCurve; duration: 450 }
        PauseAnimation { duration: 80 }
    }
    SequentialAnimation on height {
        loops: Animation.Infinite
        PropertyAnimation { from: 94; to: 98; easing.type: Easing.OutCurve; duration: 450 }
        PauseAnimation { duration: 80 }
        PropertyAnimation { from: 98; to: 94; easing.type: Easing.OutCurve; duration: 450 }
        PauseAnimation { duration: 80 }
    }
    Behavior on opacity { PropertyAnimation { duration: 800 } }
}
