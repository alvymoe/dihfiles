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
        property string palette: "default"

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

    JsonAdapter {
        id: cols

        property color colBg: "#55232A2E"
        property color colFg: "#FFFFFF"
        property color colMuted: "#A7C080"
        property color colPrimary: "#A7C080"
        property color colAccent: "#A7C080"
        property color colWarn: "#A7C080"

        property color colGreen: "#A7C080"
        property color colCyan: "#A7C080"
        property color colPurple: "#A7C080"
        property color colRed: "#A7C080"
        property color colYellow: "#A7C080"
        property color colBlue: "#A7C080"
    }

    FileView {
        id: colsFile
        path: Quickshell.env("HOME") + "/.config/quickshell/default/palettes/" + cfg.palette + ".json"

        adapter: cols

        watchChanges: true
        onFileChanged: reload()
    }

    IpcHandler {
        target: "dihshell"

        // This function will be exposed via IPC
        function toggleBar() {
            cfg.showBar = !cfg.showBar
        }
    }

    // Theme colors
    property color colBg: cols.colBg
    property color colFg: cols.colFg
    property color colMuted: cols.colMuted
    property color colPrimary: cols.colPrimary
    property color colWarn: cols.colWarn

    property color colGreen: cols.colGreen
    property color colCyan: cols.colCyan
    property color colPurple: cols.colPurple
    property color colRed: cols.colRed
    property color colYellow: cols.colYellow
    property color colBlue: cols.colBlue

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
