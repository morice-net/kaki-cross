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

Item {
    id: kkcPageHome
    width: global.width
    height: global.height

    KkcMenuButton {
        id: start
        buttonText: qsTr("Start !")
        opacity:0

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
        Behavior on opacity { PropertyAnimation { duration: 2200 } }
    }

    Image {
        id: title
        source: "../../Pictures/KkcMainTitle.png"

        anchors.horizontalCenter: parent.horizontalCenter
        height: 400
        y: -400

        Behavior on y { PropertyAnimation { easing.type: Easing.InOutElastic; duration: 2000 } }
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
                kkcPageHome.destroyPage();
                global.callSettings();
            }
        }

        PropertyAnimation on opacity { from: 0; to: 1; duration: 2500 }
        Behavior on opacity { PropertyAnimation { duration: 800 } }
    }

    Component.onCompleted: {
        title.y = -80;
        start.opacity = 1
    }

    Component.onDestruction: {
        console.log("KkcHomePage destroyed.")
    }


}
