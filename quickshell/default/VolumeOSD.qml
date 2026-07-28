import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
	id: volumeOSD

	// Bind the pipewire node so its volume will be tracked
	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	property bool shouldShowOsd: false
	property PwNode activeNode: null 

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: volumeOSD.shouldShowOsd = false
	}

	// Instantiator dynamically handles connection tracking for all audio sinks
	Instantiator {
		model: Pipewire.nodes

		delegate: QtObject {
			// Filter model nodes: ensure the node is a valid audio sink and not an app stream
			required property PwNode modelData
			readonly property bool isAudioOutput: modelData && modelData.isSink && !modelData.isStream

			// Automatically registers any discovered output device node to track its volume
			property PwObjectTracker tracker: PwObjectTracker {
				objects: isAudioOutput ? [modelData] : []
			}

			// Dynamically monitor volume modifications on individual active devices
			property Connections volConnection: Connections {
				target: isAudioOutput ? modelData.audio : null
				ignoreUnknownSignals: true

				function onVolumeChanged() {
					volumeOSD.activeNode = modelData;
					volumeOSD.shouldShowOsd = true;
					hideTimer.restart();
				}
			}
		}
	}

	// The OSD window will be created and destroyed based on shouldShowOsd.
	// PanelWindow.visible could be set instead of using a loader, but using
	// a loader will reduce the memory overhead when the window isn't open.
	LazyLoader {
		active: volumeOSD.shouldShowOsd

		PanelWindow {
			// Since the panel's screen is unset, it will be picked by the compositor
			// when the window is created. Most compositors pick the current active monitor.

			anchors.bottom: true
			margins.bottom: screen.height / 20
			exclusiveZone: 0

			color: "transparent"
			implicitWidth: 400

			// An empty click mask prevents the window from blocking mouse events.
			mask: Region {}

			ClippingWrapperRectangle {
				anchors {
					left: parent.left
					right: parent.right
				}
				radius: 4
				color: root.colBg

			    // Defines the clipping area and rounded corners
			    border.color: root.colPrimary
			    border.width: 1

			    ColumnLayout {

                    Item { height: 4 }

			    	Text {
						Layout.fillWidth: true
						text: volumeOSD.activeNode.description ?? "No Device Connected"
						color: root.colPrimary 
                        font.family: root.fontFamily
						font.pixelSize: 12
						font.bold: true
						horizontalAlignment: Text.AlignHCenter 
						elide: Text.ElideRight 
					}

					RowLayout {
						anchors {
							left: parent.left
							right: parent.right
							margins: 10
						}

						IconImage {
							implicitSize: 25
							source: Quickshell.iconPath("audio-volume-high-symbolic")


						    layer.enabled: true
						    layer.effect: MultiEffect {
						    	colorization: 1.0
	        					colorizationColor: root.colPrimary
						    }
						}

						Rectangle {
							// Stretches to fill all left-over space
							Layout.fillWidth: true

							implicitHeight: 4
							radius: 4
							color: root.colBg

							Rectangle {
								anchors {
									left: parent.left
									top: parent.top
									bottom: parent.bottom
								}

								color: root.colPrimary
								implicitWidth: parent.width * (volumeOSD.activeNode.audio.volume ?? 0)
								radius: parent.radius
							}
						}
					}

                    Item { height: 4 }
			    }
			}
		}
	}
}