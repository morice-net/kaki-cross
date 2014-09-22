/*
    Copyright 2014 Jean-Nicolas Artaud <jeannicolasartaud@gmail.com>

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation; either version 3 of
    the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.1

Image {
    property string buttonText

    source: "../../Pictures/KkcStartButton.png"
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.margins: 400

    FontLoader { id: localFont; source: "../../Fonts/Candice.ttf" }

    Text {
        id: startText
        anchors.fill: parent
        opacity: 1

        color: "#ffffff"
        text: parent.buttonText
        font.family: localFont.name
        font.pointSize: 36

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
