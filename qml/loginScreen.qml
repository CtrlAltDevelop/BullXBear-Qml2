import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Timeline 1.0
import QtQuick.Controls 2.15

Window {
	width: 400
	height: 400
	visible: true
	id: loginScreen
	color: "#00000000"
	modality: Qt.ApplicationModal
	title: qsTr("Bull X Bear | Login")
	flags: Qt.SplashScreen | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

	property bool darkMode: true
	property color bgColor: darkMode ? "#ef3f4448" : '#efeef2f5'
	property color spColor: darkMode ? "#ef404348" : '#efe3e7ea'
	property color fgColor: darkMode ? "#eff0f0f2" : '#ef4c4d4f'
	property color pgColor: darkMode ? "#effeffff" : '#ef141414'

	Rectangle {
		id: background
		radius: 15
		clip: true
		focus: true
		color: bgColor
		anchors.fill: parent
	}
}
