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
    id: bomb
    width: 85; height: 85
    source: "../../Pictures/BasicBomb.png"

    // 3 states: normal, aboutToExplode, Exploded

    property int livingTime: 10000
    property int hurringTime: 2800

    Timer {
        id: livingTimer
        interval: bomb.livingTime
        running: bomb.state == 'normal'
        onTriggered: blink()
    }

    Timer {
        id: hurringTimer
        interval: bomb.hurringTime
        running: bomb.state == 'aboutToExplode'
        onTriggered: explode()
    }

    SequentialAnimation {
        id: hurry
        loops: Animation.Infinite
        running: bomb.state == 'aboutToExplode'
        NumberAnimation { target: bomb; property: "opacity"; to: 0.5; duration: 100 }
        NumberAnimation { target: bomb; property: "opacity"; to: 1; duration: 100 }
    }

    AnimatedSprite {
        id: explosion
        width: 64
        height: 64
        anchors.fill: parent
        source: "../../Pictures/Exploded.png"
        frameCount: 25
        frameSync: true
        frameWidth: 64
        frameHeight: 64
        frameDuration: 200
        loops: 1
        running: bomb.state == 'exploded'
        opacity: bomb.state == 'exploded' ? 0.85 : 0
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            console.log(bomb.state);
            if (bomb.state == 'normal')
                explode();
            else if (bomb.state == 'aboutToExplode')
                reload();
        }
    }

    function load() {
        randomizeTimer();
        livingTimer.restart();
        bomb.state = 'normal';
    }

    function reload() {
        bomb.state = 'normal';
        hurringTimer.stop();
        hurry.stop();
        bomb.opacity = 1;
        randomizeTimer();
        livingTimer.restart();
        global.currentPoints += 1;
    }

    function blink() {
        livingTimer.stop();
        hurringTimer.restart();
        bomb.state = 'aboutToExplode';
    }

    function explode() {
        bomb.state = 'exploded';
        bomb.source = "";
    }

    function randomizeTimer() {
        var now = new Date();
        var seed = now.getSeconds();
        bomb.livingTime = (Math.floor(10000 * Math.random(seed)));
    }

    Component.onCompleted: {
        load();
    }
}
