import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Timeline 1.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import "components"

Window {
	width: 1280
	height: 720
	minimumHeight: mainScreen.height * .75
	minimumWidth: mainScreen.width * .75
	visible: true
	id: mainScreen
	color: "#00000000"
	modality: Qt.ApplicationModal
	title: qsTr("Bull X Bear | Login")
	flags: Qt.Window | Qt.FramelessWindowHint

	property bool darkMode: true
	property color surfaceColor: darkMode ? "#ef38393b" : '#efffffff'
	property color bgColor: darkMode ? "#ef25262a" : '#efd9dee2'
	property color deepColor: darkMode ? "#ef2d3134" : '#efeef2f5'
	property color spColor: darkMode ? "#ef404348" : '#efe3e7ea'
	property color fgColor: darkMode ? "#eff0f0f2" : '#ef4c4d4f'
	property color pgColor: darkMode ? "#effeffff" : '#ef141414'

	property color specialColorHigh: "#4975be"
	property color specialColor: "#55aaff"
	property color specialColorLow: "#95caff"
	property color specialColorLight: "#b3d9fe"


	property color pressColor: darkMode ? "#777777" : "#777777"
	property color hoverColor: darkMode ? "#999999" : "#999999"
	property color focusColor: darkMode ? "#55aaff" : "#55aaff"
	property color defaultColot: darkMode ? "#bbbbbb" : "#bbbbbb"

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

		DragHandler { onActiveChanged: if(active){loginScreen.startSystemMove()}}

		Rectangle {
			id: bar
			x: 10
			width: background.width - 20
			height: 30
			color: "#6affb4"
			anchors.top: parent.top
			anchors.topMargin: 10
			anchors.horizontalCenterOffset: 0
			anchors.horizontalCenter: parent.horizontalCenter
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
			anchors.topMargin: 0
		}

		Rectangle {
			id: content
			color: "#073655"
			anchors.left: menu.right
			anchors.right: parent.right
			anchors.top: header.bottom
			anchors.bottom: footer.top
			anchors.rightMargin: 10
			anchors.leftMargin: 0
			anchors.bottomMargin: 0
			anchors.topMargin: 0
		}

		Rectangle {
			id: footer
			y: 668
			height: 17
			color: "#ffaa00"
			anchors.left: menu.right
			anchors.right: parent.right
			anchors.bottom: parent.bottom
			anchors.rightMargin: 10
			anchors.leftMargin: 0
			anchors.bottomMargin: 10
		}

		Rectangle {
			id: header
			height: 30
			color: "#3b98aa"
			anchors.left: menu.right
			anchors.right: parent.right
			anchors.top: bar.bottom
			anchors.leftMargin: 0
			anchors.topMargin: 0
			anchors.rightMargin: 10
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
					target: null
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
					target: null
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
					target: null
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
					target: null
					onActiveChanged: if (active) {mainScreen.startSystemResize(Qt.RightEdge | Qt.BottomEdge)}
		}
	}

	MouseArea {
		id: moveApp
		height: 45
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.top: parent.top
		DragHandler {
				 target: null
				 onActiveChanged: if (active) {mainScreen.startSystemMove()}
		}
	}
}

/*##^##
Designer {
	D{i:0;formeditorZoom:1.1}D{i:3}D{i:4}D{i:5}D{i:6}D{i:7}D{i:8}D{i:16}
}
##^##*/
