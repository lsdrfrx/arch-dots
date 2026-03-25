import Quickshell
import QtQuick
import Quickshell.Wayland
import Quickshell.Io
import Qt5Compat.GraphicalEffects


PanelWindow {
  id: launcher
  WlrLayershell.layer: WlrLayer.Overlay
  WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

  anchors {
    top: true
    bottom: true
    left: true
    right: true
  }

  color: "#00000000"
  visible: false

  IpcHandler {
    target: "launcher"
    function toggle() {
      prompt.text = ""
      launcher.visible = !launcher.visible
    }
  }

  MouseArea {
    anchors.fill: parent
    onClicked: {
      launcher.visible = false
      prompt.text = ""
    }

    Rectangle {
      id: launcherContainer

      anchors.centerIn: parent
      anchors.margins: 30
      width: 400
      height: 80 + (filteredApps.length > 0 ? Math.min(filteredApps.length * 40, 240) + 20 : 0)
      color: "#fdf6e3"

      Behavior on height {
        NumberAnimation { duration: 300; easing.type: Easing.OutCubic}
      }


      property var filteredApps: {
        var query = prompt.text.toLowerCase();
        if (query === "") return [];
        return DesktopEntries.applications.values.filter(
          function(app) { return app.name.toLowerCase().includes(query); }
        );
      }
      property int selectedIndex: 0
      radius: 6

      layer.enabled: true
      layer.effect: DropShadow {
        horizontalOffset: 4
        verticalOffset: 4
        radius: 0
        samples: 25
        color: "#333333"
      }

      border {
        color: "#333333"
        width: 3
      }

      MouseArea {
        anchors.fill: parent
        onClicked: {}
      }

      Rectangle {
        id: searchBox
        anchors {
          top: parent.top
          left: parent.left
          right: parent.right
          topMargin: 20
          leftMargin: 20
          rightMargin: 20
        }

        height: prompt.implicitHeight + 20
        radius: 6
        color: "#f4f0d9"

        TextInput {
          id: prompt
          focus: true
          Keys.onEscapePressed: {
            launcher.visible = false
            prompt.text = ""
          }
          Keys.onDownPressed: {
            if (launcherContainer.filteredApps.length > 0)
              launcherContainer.selectedIndex = Math.min(
                launcherContainer.selectedIndex + 1,
                launcherContainer.filteredApps.length - 1
              );
          }
          Keys.onUpPressed: {
            if (launcherContainer.selectedIndex > 0)
              launcherContainer.selectedIndex--;
          }
          Keys.onReturnPressed: {
            var idx = launcherContainer.selectedIndex;
            if (idx >= 0 && idx < launcherContainer.filteredApps.length) {
              launcherContainer.filteredApps[idx].execute();
              launcher.visible = false;
            }
          }
          onTextChanged: {
            launcherContainer.selectedIndex = 0;
            console.log(text);
          }
          anchors {
            fill: parent
            margins: 10
            leftMargin: 30
          }
          font.pixelSize: 20
          color: "#333333"
          verticalAlignment: TextInput.AlignVCenter
        }
      }

      ListView {
        anchors {
          top: searchBox.bottom
          left: parent.left
          right: parent.right
          topMargin: 10
          leftMargin: 20
          rightMargin: 20
        }
        height: Math.min(launcherContainer.filteredApps.length * 40, 240)
        clip: true
        model: launcherContainer.filteredApps
        currentIndex: launcherContainer.selectedIndex
        delegate: Rectangle {
          width: ListView.view.width
          height: 40
          color: (index === launcherContainer.selectedIndex || appMouseArea.containsMouse) ? "#e8e0c8" : "transparent"
          radius: 4

          MouseArea {
            id: appMouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
              modelData.execute();
              launcher.visible = false;
            }
          }

          Row {
            spacing: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 8

            Image {
              source: modelData.icon
              sourceSize.width: 48
              sourceSize.height: 48
              height: 20
              width: 20
              antialiasing: true
              smooth: true
            }
            Text {
              text: modelData.name
              color: "#333333"
              font.pixelSize: 16
            }
          }
        }
      }
    }
  }
}
