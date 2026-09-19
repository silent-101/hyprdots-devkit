import QtQuick
import Quickshell

ShellRoot{
    id: bar
    PanelWindow{
        id: window
        implicitHeight: 42
        anchors {
            bottom: true
            left: true
            right: true
        }
        color: "#1f1f1f"
    }
}