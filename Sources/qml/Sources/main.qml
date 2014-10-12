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

Rectangle {
    id: global
    width: 600
    height: 800
    property int maxPointsEver: 0
    property int currentPoints: 0
    property int time: 0


    KkcPage {
        Loader { id: pageLoader }
    }

    Component.onCompleted: backMenu()

    Timer {
        id: pageUnloadingTimerToMenu
        interval: 800
        running:false
        onTriggered: pageLoader.source = "KkcMainMenu.qml"
    }

    Timer {
        id: pageUnloadingTimerToStart
        interval: 2000
        running:false
        onTriggered: pageLoader.source = "KkcBombBoard.qml"
    }

    Timer {
        id: pageUnloadingTimerToSettings
        interval: 2000
        running:false
        onTriggered: pageLoader.source = "KkcSettings.qml"
    }

    function backMenu() {
        pageUnloadingTimerToMenu.start();
    }

    function startGame() {
        pageUnloadingTimerToStart.start();
    }

    function callSettings() {
        pageUnloadingTimerToSettings.start();
    }
}
