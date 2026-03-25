import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
  id: root

  default property alias contents: innerItem.children
  property int padding: 10
  property bool clickable: false

  signal clicked

  color: "#fdf6e3"
  height: 40
  radius: 6
  border.color: "#333333"
  border.width: 3
  width: innerItem.childrenRect.width + padding * 2

  layer.enabled: true
  layer.effect: DropShadow {
    horizontalOffset: 4
    verticalOffset: 4
    radius: 0
    samples: 25
    color: "#333333"
  }

  Item {
    id: innerItem
    anchors.centerIn: parent
    width: childrenRect.width
    height: childrenRect.height
  }

  MouseArea {
    anchors.fill: parent
    enabled: clickable
    cursorShape: Qt.PointingHandCursor
    onClicked: root.clicked()
  }
}
