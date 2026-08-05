//@ pragma UseQApplication

import Quickshell
import QtQuick
import Quickshell.Io
import Quickshell.Hyprland
import "."

ShellRoot {
    id: root

    JsonAdapter {
        id: configAdapter
        property bool showBar: true
    }

    FileView {
        id: configFile
        path: Quickshell.env("HOME") + "/.config/quickshell/default/configs/" + Quickshell.env("USER") + ".json"

        adapter: configAdapter

        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()
    }

    IpcHandler {
        target: "dihshell"

        // This function will be exposed via IPC
        function toggleBar() {
            configAdapter.showBar = !configAdapter.showBar
        }
    }

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
    Bar {
        visible: configAdapter.showBar
    }

//    Connections {
//        target: NotificationServer{
//            onNotification:(n)=>{
//                //handle notification
//            }
//        }
//    }
}
