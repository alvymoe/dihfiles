//@ pragma UseQApplication

import Quickshell
import QtQuick
import Quickshell.Io
import "."

ShellRoot {
    id: root

    JsonAdapter {
        id: cfg
        property bool showBar: true

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

        property string fontFamily: "JetBrainsMono Nerd Font"
        property int fontSize: 12
    }

    FileView {
        id: configFile
        path: Quickshell.env("HOME") + "/.config/quickshell/default/configs/" + Quickshell.env("USER") + ".json"

        adapter: cfg

        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()
    }

    IpcHandler {
        target: "dihshell"

        // This function will be exposed via IPC
        function toggleBar() {
            cfg.showBar = !cfg.showBar
        }
    }

    // Theme colors
    property color colBg: cfg.colBg
    property color colFg: cfg.colFg
    property color colMuted: cfg.colMuted
    property color colPrimary: cfg.colPrimary
    property color colGreen: cfg.colGreen
    property color colCyan: cfg.colCyan
    property color colPurple: cfg.colPurple
    property color colRed: cfg.colRed
    property color colYellow: cfg.colYellow
    property color colBlue: cfg.colBlue

    // Font
    property string fontFamily: cfg.fontFamily
    property int fontSize: cfg.fontSize

    VolumeOSD {}
    Bar {
        visible: cfg.showBar
    }

//    Connections {
//        target: NotificationServer{
//            onNotification:(n)=>{
//                //handle notification
//            }
//        }
//    }
}
