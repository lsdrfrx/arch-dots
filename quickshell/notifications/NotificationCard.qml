import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Quickshell.Services.Notifications

Rectangle {
  id: card

  property var notification: null

  height: contentCol.implicitHeight + 20
  radius: 6
  color: "#fdf6e3"
  border.color: (notification && notification.urgency === NotificationUrgency.Critical) ? "#dc322f" : "#333333"
  border.width: 3

  anchors.rightMargin: 10
  clip: true

  layer.enabled: true
  layer.effect: DropShadow {
    horizontalOffset: 4
    verticalOffset: 4
    radius: 0
    samples: 1
    color: "#333333"
  }

  opacity: 0
  x: 40
  Component.onCompleted: {
    fadeIn.start()
    x = 0
  }
  Behavior on x {
    NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
  }

  function dismiss() {
    fadeOut.start()
  }

  NumberAnimation {
    id: fadeIn
    target: card
    property: "opacity"
    from: 0; to: 1
    duration: 200
    easing.type: Easing.OutCubic
  }

  NumberAnimation {
    id: fadeOut
    target: card
    property: "opacity"
    to: 0
    duration: 250
    easing.type: Easing.InCubic
    onFinished: if (notification) notification.dismiss()
  }

  Timer {
    interval: (notification && notification.expireTimeout > 0) ? notification.expireTimeout : 5000
    running: notification !== null
    onTriggered: card.dismiss()
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: card.dismiss()
  }

  ColumnLayout {
    id: contentCol
    anchors {
      left: parent.left
      right: parent.right
      top: parent.top
      margins: 10
    }
    spacing: 4

    RowLayout {
      Layout.fillWidth: true
      spacing: 8

      Image {
        id: appIcon
        Layout.preferredWidth: 18
        Layout.preferredHeight: 18
        source: notification ? notification.appIcon : ""
        visible: notification && notification.appIcon !== "" && status === Image.Ready
        fillMode: Image.PreserveAspectFit
        smooth: true
        antialiasing: true
        sourceSize: Qt.size(48, 48)
      }

      Text {
        text: notification ? notification.appName : ""
        font.pixelSize: 11
        color: "#888888"
        Layout.fillWidth: true
        elide: Text.ElideRight
      }
    }

    Text {
      text: notification ? notification.summary : ""
      font.pixelSize: 14
      font.bold: true
      color: "#333333"
      Layout.fillWidth: true
      wrapMode: Text.WordWrap
    }

    Text {
      visible: notification && notification.body !== ""
      text: (notification && notification.body) ? notification.body : ""
      font.pixelSize: 12
      color: "#555555"
      Layout.fillWidth: true
      wrapMode: Text.WordWrap
    }
  }
}
