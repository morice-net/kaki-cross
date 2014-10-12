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
    id: background
    width: global.width
    height: global.height

    Image {
        id: darkFog
        width: 820
        height: 820
        source: "../../Pictures/KkcBackgroundDarkFog.png"
        opacity: 0
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
        opacity: 0
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

    Component.onCompleted: {
        darkFog.opacity =0.95;
        lightFog.opacity=0.95;

    }
}
