import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

TextField {
	id: textField

	property color colorDefault: "#3f4448"
	property color colorOnFocus: "#404348"
	property color colorMouseOver: "#33334c"
	property color borderColor: "#000000"
	property color textColor: "#ffffff"
	property color selectTextColor: "#ffffff"
	property color selectColor: "#55aaff"
	property color holderTextColor: "#55aaff"
	property int borderWidth: 3

	QtObject {
		id: internal
		property var dynamicColor: if(textField.focus){textField.focus ? colorOnFocus : colorDefault}else{
									   textField.hovered ? colorMouseOver : colorDefault}
	}

	implicitWidth: 300
	implicitHeight: 40
	placeholderText: qsTr("Type something")
	color: textColor
	background: Rectangle {
		color: internal.dynamicColor
		radius: 10
		border.color: borderColor
		border.width: borderWidth
	}
	selectByMouse: true
	selectedTextColor: selectTextColor
	selectionColor: selectColor
	placeholderTextColor: holderTextColor
}
