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
    id: board
    width: global.width
    height: global.height

    FontLoader { id: localFont; source: "../../Fonts/Candice.ttf" }

    Rectangle {
        id: pointCounter
        width: 270; height: 80
        anchors.top: board.top
        anchors.left: board.left
        anchors.margins: 20
        radius: 10
        smooth: true

        Image {
            source: "../../Pictures/Bomb.png"
            anchors.verticalCenter: pointCounter.verticalCenter
            width: 22; height: 22
            x: 15
        }

        Text {
            id: pointsDrawn
            text: global.currentPoints.toString()
            anchors.fill: parent
            font.family: localFont.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 64
        }
    }

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: { global.time += 1 }
    }

    Rectangle {
        id: globalTimer
        width: 270; height: 80
        anchors.top: board.top
        anchors.right: board.right
        anchors.margins: 20
        radius: 10
        smooth: true

        Image {
            source: "../../Pictures/BasicClock.png"
            anchors.verticalCenter: globalTimer.verticalCenter
        }

        Text {
            id: timerDrawn
            text: global.time.toString()
            anchors.fill: parent
            font.family: localFont.name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 64
        }
    }

    Image {
        id: bombsBoard
        width: 400; height: 400
        anchors.margins: 90
        anchors.horizontalCenter: board.horizontalCenter
        anchors.bottom: board.bottom
        source: "../../Pictures/BasicBoard.png"

        Grid {
            spacing: 20
            Repeater {
                model: 16
                KkcBomb {
                }
            }
        }
    }
}
