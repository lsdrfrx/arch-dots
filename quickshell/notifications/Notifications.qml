import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications

PanelWindow {
  id: root

  WlrLayershell.layer: WlrLayer.Overlay
  WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

  anchors {
    top: true
    right: true
  }

  margins {
    top: 20
    right: 20
  }

  color: "transparent"
  implicitWidth: 360
  implicitHeight: notifColumn.implicitHeight > 0 ? notifColumn.implicitHeight + 10 : 1

  property var notifList: []

  NotificationServer {
    id: server
    keepOnReload: false
    onNotification: (notif) => {
      notif.tracked = true
      root.notifList = [...root.notifList, notif]
      notif.closed.connect(() => {
        root.notifList = root.notifList.filter(n => n !== notif)
      })
    }
  }

  Column {
    id: notifColumn
    width: parent.width
    spacing: 10

    Repeater {
      model: root.notifList.length
      delegate: NotificationCard {
        notification: root.notifList[index]
        width: notifColumn.width
      }
    }
  }
}
