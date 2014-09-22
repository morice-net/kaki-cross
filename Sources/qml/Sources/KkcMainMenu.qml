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

KkcPage {
    id: kkcPageHome

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
                global.startGame();
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
