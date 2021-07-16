import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Timeline 1.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import "components"

Window {
	id: mainScreen
	width: 1280
	height: 720
	minimumHeight: mainScreen.height * .75
	minimumWidth: mainScreen.width * .75
	visible: true
	color: "#00000000"
	modality: Qt.ApplicationModal
	title: qsTr("Bull X Bear | Login")
	flags: Qt.Window | Qt.FramelessWindowHint

	property bool darkMode: true
	property color surfaceColor: darkMode ? "#f938393b" : '#f9ffffff'
	property color bgColor: darkMode ? "#f925262a" : '#f9d9dee2'
	property color deepColor: darkMode ? "#f92d3134" : '#f9eef2f5'
	property color spColor: darkMode ? "#f9404348" : '#f9e3e7ea'
	property color fgColor: darkMode ? "#f9f0f0f2" : '#f94c4d4f'
	property color pgColor: darkMode ? "#f9feffff" : '#f9141414'

	property color specialColorHigh: "#4975be"
	property color specialColor: "#55aaff"
	property color specialColorLow: "#95caff"
	property color specialColorLight: "#b3d9fe"


	property color pressColor: darkMode ? "#777777" : "#777777"
	property color hoverColor: darkMode ? "#999999" : "#999999"
	property color focusColor: darkMode ? "#55aaff" : "#55aaff"
	property color defaultColot: darkMode ? "#bbbbbb" : "#bbbbbb"

	property bool isMaximize: false
	property bool isFullscreen: false
	property bool isSecureOrNot: false

	QtObject {
		id: internal
		function maximizeRestore() {if (isMaximize) {
				isMaximize = false
				mainScreen.showNormal()
				maximizeBtn.iconBtnSource = "../images/svg/square.svg"
				fullscreenBtn.iconBtnSource =  "../images/svg/fullscreen.svg"
			} else {
				isMaximize = true
				mainScreen.showMaximized()
				maximizeBtn.iconBtnSource = "../images/svg/squares.svg"
			}
		}

		function fullscreenRestore() {if (isFullscreen) {
				isFullscreen = false
				mainScreen.showNormal()
				maximizeBtn.iconBtnSource = "../images/svg/square.svg"
				fullscreenBtn.iconBtnSource =  "../images/svg/fullscreen.svg"
			} else {
				isFullscreen = true
				mainScreen.showFullScreen()
				fullscreenBtn.iconBtnSource =  "../images/svg/-fullscreen.svg"
			}
		}

		function tryToBeSecureOrNot() {if(isSecureOrNot){
				isSecureOrNot = false
				secureBtn.iconBtnSource = "../images/svg/fi-rr-eye-crossed.svg"
			} else {
				isSecureOrNot = true
				secureBtn.iconBtnSource = "../images/svg/fi-rr-eye.svg"
			}
		}

		function themeChange() {if(darkMode) {darkMode = false} else {darkMode = true}
		}
	}

	Rectangle {
		id: background
		radius: 25
		clip: true
		focus: true
		color: mainScreen.bgColor
		anchors.fill: parent
		anchors.rightMargin: 5
		anchors.leftMargin: 5
		anchors.bottomMargin: 5
		anchors.topMargin: 5

		Rectangle {
			id: bar
			width: background.width - 20
			height: 40
			color: "#00000000"
			anchors.top: parent.top
			anchors.topMargin: 10
			anchors.horizontalCenterOffset: 0
			anchors.horizontalCenter: parent.horizontalCenter
			DragHandler {onActiveChanged: if (active) {mainScreen.startSystemMove()}}

			MouseArea {
				anchors.fill: parent
				onDoubleClicked: internal.maximizeRestore()
			}

			Image {
				id: image
				width: 30
				anchors.left: parent.left
				anchors.top: parent.top
				anchors.bottom: parent.bottom
				source: "../images/logo/ms-icon-70x70.png"
				anchors.leftMargin: 0
				anchors.bottomMargin: 0
				anchors.topMargin: 0
				fillMode: Image.PreserveAspectFit
			}

			Label {
				id: label
				width: 225
				color: mainScreen.pgColor
				text: qsTr("Bull X Bear")
				anchors.left: image.right
				anchors.top: parent.top
				anchors.bottom: parent.bottom
				font.letterSpacing: 1
				horizontalAlignment: Text.AlignLeft
				verticalAlignment: Text.AlignVCenter
				font.strikeout: false
				font.pointSize: 14
				anchors.leftMargin: 10
			}

			CustomAppButton {
				id: closeBtn
				anchors.verticalCenter: parent.verticalCenter
				anchors.verticalCenterOffset: -5
				z: 1
				hoverColotBtn: "#884848"
				pressColotBtn: "#ff2222"
				iconBtnSource: "../images/svg/close.svg"
				CustomToolTip {text: "Exit"}
				onClicked: mainScreen.close()
				anchors {
					rightMargin: 16
					right: parent.right
				}
			}

			CustomAppButton {
				id: fullscreenBtn
				anchors.verticalCenter: parent.verticalCenter
				anchors.verticalCenterOffset: -5
				z: 1
				iconBtnSource: "../images/svg/fullscreen.svg"
				CustomToolTip {text: "Full Screen"}
				onClicked: internal.fullscreenRestore()
				anchors {
					right: closeBtn.left
					rightMargin: 16
				}
			}

			CustomAppButton {
				id: maximizeBtn
				anchors.verticalCenter: parent.verticalCenter
				anchors.verticalCenterOffset: -5
				z: 1
				iconBtnSource: "../images/svg/square.svg"
				CustomToolTip {text: "Maximize"}
				onClicked: internal.maximizeRestore()
				anchors {
					right: fullscreenBtn.left
					rightMargin: 16
				}
			}

			CustomAppButton {
				id: minimizeBtn
				anchors.verticalCenter: parent.verticalCenter
				anchors.verticalCenterOffset: -5
				z: 1
				iconBtnSource: "../images/svg/min.svg"
				onClicked: mainScreen.showMinimized()
				CustomToolTip {text: "Minimize"}
				anchors {
					right: maximizeBtn.left
					rightMargin: 16
				}
			}

			CustomAppButton {
				id: sepratorLine
				sizeBtn: 24
				anchors.verticalCenter: parent.verticalCenter
				anchors.verticalCenterOffset: -5
				z: 1
				pressColotBtn: '#999999'
				hoverColotBtn: '#999999'
				defaultColotBtn: '#999999'
				iconBtnSource: "../images/svg/v-line.svg"
				anchors {
					right: minimizeBtn.left
					rightMargin: 0
				}
			}

			CustomAppButton {
				id: secureBtn
				sizeBtn: 16
				anchors.verticalCenter: parent.verticalCenter
				anchors.rightMargin: 3
				anchors.verticalCenterOffset: -5
				z: 1
				onClicked: internal.tryToBeSecureOrNot()
				iconBtnSource: "../images/svg/fi-rr-eye-crossed.svg"
				CustomToolTip {text: "Secure"}
				anchors {
					right: sepratorLine.left
				}
			}

			CustomAppButton {
				id: themeBtn
				sizeBtn: 16
				anchors.verticalCenter: parent.verticalCenter
				anchors.verticalCenterOffset: -5
				z: 1
				onClicked: internal.themeChange()
				iconBtnSource: "../images/svg/fi-rr-opacity.svg"
				CustomToolTip {text: "Theme"}
				anchors {
					right: secureBtn.left
					rightMargin: 16
				}
			}

			CustomAppButton {
				id: notificationBtn
				sizeBtn: 16
				anchors.verticalCenter: parent.verticalCenter
				anchors.verticalCenterOffset: -5
				z: 1
				iconBtnSource: "../images/svg/fi-rr-bell.svg"
				CustomToolTip {text: "Notification"}
				anchors {
					right: themeBtn.left
					rightMargin: 16
				}
			}
		}

		Rectangle {
			id: menu
			width: 164
			color: "#ff39db"
			anchors.left: parent.left
			anchors.top: bar.bottom
			anchors.bottom: parent.bottom
			anchors.bottomMargin: 10
			anchors.leftMargin: 10
		}

		Rectangle {
			id: content
			color: "#073655"
			anchors.left: menu.right
			anchors.right: parent.right
			anchors.top: bar.bottom
			anchors.bottom: footer.top
			anchors.topMargin: 0
			anchors.rightMargin: 10
		}

		Rectangle {
			id: footer
			y: 668
			height: 20
			color: "#ffaa00"
			anchors.left: menu.right
			anchors.right: parent.right
			anchors.bottom: parent.bottom
			anchors.rightMargin: 10
			anchors.bottomMargin: 10
		}
	}

	MouseArea {
		id: resizeRight
		width: 5
		anchors.right: parent.right
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		anchors.bottomMargin: 20
		anchors.topMargin: 45
		cursorShape: Qt.SizeHorCursor
		DragHandler {
			onActiveChanged: if (active) {mainScreen.startSystemResize(Qt.RightEdge)}
		}
	}

	MouseArea {
		id: resizeLeft
		width: 5
		anchors.left: parent.left
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		anchors.topMargin: 45
		cursorShape: Qt.SizeHorCursor
		DragHandler {
			onActiveChanged: if (active) {mainScreen.startSystemResize(Qt.LeftEdge)}
		}
	}

	MouseArea {
		id: resizeBotton
		height: 5
		anchors.right: parent.right
		anchors.left: parent.left
		anchors.bottom: parent.bottom
		anchors.rightMargin: 20
		cursorShape: Qt.SizeVerCursor
		DragHandler {
			onActiveChanged: if (active) {mainScreen.startSystemResize(Qt.BottomEdge)}
		}
	}

	MouseArea {
		id: resizeApp
		width: 20
		height: 20
		anchors.right: parent.right
		anchors.bottom: parent.bottom
		cursorShape: Qt.SizeFDiagCursor
		DragHandler {
			onActiveChanged: if (active) {mainScreen.startSystemResize(Qt.RightEdge | Qt.BottomEdge)}
		}
	}

}

