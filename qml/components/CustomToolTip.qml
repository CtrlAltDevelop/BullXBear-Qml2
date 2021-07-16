import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

ToolTip {
	id: control

	property color bgColor: "#000000"
	property color fgColor: "#ffffff"

	delay: 500
	timeout: 3000
	leftPadding: 10
	rightPadding: 10
	visible: parent.hovered
	contentItem: Text {
		text: control.text
		font: control.font
		color: control.fgColor
	}

	background: Rectangle{
		color: control.bgColor
		border.color: control.fgColor
		border.width: 1
		radius: 5
	}
}
