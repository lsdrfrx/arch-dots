pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
  id: root

  readonly property PwNode sink: Pipewire.defaultAudioSink
  readonly property PwNode source: Pipewire.defaultAudioSource
  readonly property bool muted: sink?.audio.muted ?? false
  readonly property real volume: sink?.audio.volume ?? 0

  function setVolume(value) {
    if (sink?.ready && sink?.audio) {
      sink.audio.muted = false
      sink.audio.volume = value
    }
  }

  PwObjectTracker {
    objects: [root.sink, root.source, root.volume]
  }
}
