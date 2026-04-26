pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.DBusMenu
import Quickshell.Io

Singleton {
  id: root

  property var occupiedWorkspaces: []
  property var focusedWorkspace: null
  property var focusedWindow: 1
  readonly property var occupiedLabels: ['󰎦', '󰎩', '󰎬', '󰎮', '󰎰', '󰎵', '󰎸', '󰎻', '󰎾', '󰽾']
  readonly property var focusedLabels: ['󰎤', '󰎧', '󰎪', '󰎭', '󰎱', '󰎳', '󰎶', '󰎹', '󰎼', '󰽽']

  function buildWindowName(name) {
    if (name)
      return `󰍹   ${name}`
    return "󰍹 "
  }

  function getOccupiedWorkspaces() {
    occupiedWorkspacesProc.running = true
  }

  Process {
    id: occupiedWorkspacesProc
    command: ["bash", "/home/lsdrfrx/.config/quickshell/scripts/workspaces.sh", "occupied"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: root.occupiedWorkspaces = JSON.parse(this.text).map(w => w - 1).sort()
    }
  }

  Connections {
    target: Hyprland
    enabled: true

    function onRawEvent(event) {
      if (event.name === "activewindow") {
        const name = event.data.split(',')[1]
        root.focusedWindow = buildWindowName(name)
      }
      if (event.name === "workspace") {
        getOccupiedWorkspaces()
        root.focusedWorkspace = event.data - 1
      }
      if (["openwindow", "closewindow", "movewindow"].includes(event.name)) {
        getOccupiedWorkspaces()
      }
    }
  }
}
