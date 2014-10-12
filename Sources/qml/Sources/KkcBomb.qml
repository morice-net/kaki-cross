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
    id: kkcBomb
    width: 85; height: 85

    property int hurringCounter: 4

    Image {
        id: bomb
        anchors.horizontalCenter: kkcBomb.horizontalCenter
        anchors.bottom: kkcBomb.bottom
        source: "../../Pictures/BasicBomb.png"

        // 3 states: normal, aboutToExplode, Exploded

        SequentialAnimation {
            id: hurry
            loops: Animation.Infinite
            running: false
            NumberAnimation { target: bomb; properties: "width,height"; to: 0.5; duration: 100 }
            NumberAnimation { target: bomb; property: "opacity"; to: 1; duration: 100 }
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                console.log(bomb.state);
                if (bomb.state == 'normal')
                    explode();
                else if (bomb.state == 'aboutToExplode')
                    load();
            }
        }
    }

    Rectangle {
        id:timerBackground
        width: 25
        height: 25
        radius: 8
        anchors.margins: 10
        anchors.bottom: kkcBomb.bottom
        anchors.right: kkcBomb.right
        opacity: (hurringCounter <= 3 && hurringCounter >0) ? 1 : 0

        FontLoader { id: localFont; source: "../../Fonts/Candice.ttf" }

        Text {
            id: startText
            anchors.fill: parent

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            color: "red"
            text: kkcBomb.hurringCounter
            font.family: localFont.name
            font.pointSize: 20
        }
    }

    AnimatedSprite {
        id: explodeAnimation
        width: 256
        height: 256

        anchors.horizontalCenter: kkcBomb.horizontalCenter
        anchors.verticalCenter: kkcBomb.verticalCenter

        source: "../../Pictures/KkcExplosion.png"
        frameCount: 48
        frameSync: true
        frameWidth: 256
        frameHeight: 256
        frameDuration: 200
        loops: 1
        running: false
        opacity: explodeAnimation.running
    }

    Timer {
        id: livingTimer
        running: false
        onTriggered: blink()
    }

    Timer {
        id: hurringTimer
        interval: 1000
        running: false
        onTriggered: {
            kkcBomb.hurringCounter -= 1;
            if (kkcBomb.hurringCounter <= 0) explode();
            else hurringTimer.start();
        }
    }

    function load() {
        livingTimer.interval = randomizeTimer(2.5,12);
        livingTimer.restart();
        bomb.state = 'normal';
        hurry.stop();
        kkcBomb.hurringCounter = 4;
    }

    function blink() {
        livingTimer.stop();
        hurringTimer.restart();
        bomb.state = 'aboutToExplode';
    }

    function explode() {
        bomb.state = 'exploded';
        explodeAnimation.start();
        bomb.width = 0;
        bomb.height = 0;
    }

        // in seconds
        function randomizeTimer(fix,moving) {
            var now = new Date();
            var seed = now.getSeconds();
            var returnTime = (Math.floor(moving * 1000 * Math.random(seed))) + fix * 1000;
            return returnTime;
        }

        Component.onCompleted: {
            load();
        }
}
