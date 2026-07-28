//@ pragma UseQApplication

import Quickshell
import QtQuick
import "."

ShellRoot {
    id: root

    // Theme colors
    property color colBg: "#55232A2E"
    property color colFg: "#FFFFFF"
    property color colMuted: "#A7C080"
    property color colPrimary: "#A7C080"
    property color colGreen: "#A7C080"
    property color colCyan: "#A7C080"
    property color colPurple: "#A7C080"
    property color colRed: "#A7C080"
    property color colYellow: "#A7C080"
    property color colBlue: "#A7C080"

    // Font
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 12

    VolumeOSD {}
    Bar {}

//    Connections {
//        target: NotificationServer{
//            onNotification:(n)=>{
//                //handle notification
//            }
//        }
//    }
}
