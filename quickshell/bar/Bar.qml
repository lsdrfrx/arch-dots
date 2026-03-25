import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Notifications
import Quickshell.Services.Pipewire
import Quickshell.Services.SystemTray
import Quickshell.Hyprland
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  margins {
    top: 10
    left: 20
    right: 20
    bottom: -10
  }

  color: '#00000000'

  implicitHeight: 60

  Row {
    id: appInfo

    spacing: 10

    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
    }

    Box {
      Text {
        id: appName
        font.pixelSize: 14
      text: Workspaces.focusedWindow
      }
    }
  }

  Box {
    id: workspaces
    anchors.centerIn: parent

    Row {
      id: workspacesContainer
      spacing: 5

      Repeater {
        model: [...Array(10).keys()]
        delegate: Rectangle {
          height: 10
          radius: 10
          border.width: 2
          border.color: "#333333"
          width: modelData == Workspaces.focusedWorkspace ? 30 : 10
          color: Workspaces.occupiedWorkspaces.includes(modelData) ? "#333333" : "#00000000"

          Behavior on width {
            NumberAnimation { duration: 500; easing.type: Easing.OutCubic }
          }

          Behavior on color {
            ColorAnimation { duration: 150 }
          }

          MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: changeWsProc.running = true
          }

          Process {
            id: changeWsProc
            command: ["hyprctl", "dispatch", "workspace", String(modelData + 1)]
          }
        }
      }
    }
  }

  Row {
    id: modules
    spacing: 10
    anchors {
      right: parent.right
      verticalCenter: parent.verticalCenter
    }

    Box {
      id: tray
      padding: 0

      Row {
        id: trayContainer
        Repeater {
          model: SystemTray.items
          delegate: Item {
            width: 40
            height: 40
            Image {
              id: trayIcon
              width: 20
              height: 20
              anchors.centerIn: parent
              source: modelData.icon
              sourceSize.width: 48
              sourceSize.height: 48
              fillMode: Image.PreserveAspectFit
              smooth: true
              antialiasing: true
              layer.enabled: true
              layer.effect: ColorOverlay {
                color: "#666666"
              }
            }
          }
        }
      }
    }

    Box {
      id: layout
      clickable: true
      onClicked: switchProc.running = true

      Text {
        id: layoutText
        font.pixelSize: 14

        Process {
          id: layoutProc
          command: ["/home/lsdrfrx/.config/quickshell/scripts/keyboard.sh", "get"]
          running: true

          stdout: StdioCollector {
            onStreamFinished: layoutText.text = this.text
          }
        }

        Process {
          id: switchProc
          command: ["/home/lsdrfrx/.config/quickshell/scripts/keyboard.sh", "next"]
          onRunningChanged: if (!running) layoutProc.running = true
        }

        Timer {
          interval: 1000
          running: true
          repeat: true
          onTriggered: layoutProc.running = true
        }
      }
    }

    Box {
      id: volume

      Row {
        id: volumeContainer
        spacing: 10

        Text {
          height: 30
          text: "   " + Math.round(Audio.volume * 100) + "%"
        }

        Slider {
          height: 30
          from: 0
          to: 1
          value: Audio.volume
          onMoved: Audio.setVolume(value)
        }
      }
    }

    Box {
      id: clock

      Text {
        id: clockText
        font.pixelSize: 14

        Process {
          id: dateProc
          command: ["date", "+%H:%M"]
          running: true

          stdout: StdioCollector {
            onStreamFinished: clockText.text = this.text
          }
        }

        Timer {
          interval: 1000
          running: true
          repeat: true
          onTriggered: dateProc.running = true
        }
      }
    }

    Box {
      id: menuButton

      Text {
        text: "󰣇"
        font.pixelSize: 16
      }
    }
  }
}
