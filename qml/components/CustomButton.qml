import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
	id: customBtn

	property int sizeBtn: 15
	property color hoverColotBtn: "#555555"
	property color pressColotBtn: "#000000"
	property color defaultColotBtn: "#999999"
	property url iconBtnSource: "../../images/svg/fi-rr-cross.svg"

	QtObject {
		id: internal
		property color dynamicColor: if(customBtn.down){customBtn.down ? pressColotBtn : defaultColotBtn} else {
										 customBtn.hovered ? hoverColotBtn : defaultColotBtn}
	}

	focus: true
	antialiasing: true
	implicitWidth: sizeBtn
	implicitHeight: sizeBtn
	background: Rectangle {
		id: bgBtn
		color: '#00000000'

		Image {
			id: iconBtn
			width: sizeBtn
			height: sizeBtn
			source: iconBtnSource
			fillMode: Image.PreserveAspectFit
			anchors {
				horizontalCenter: parent.horizontalCenter
				verticalCenter: parent.verticalCenter
			}
		}

		ColorOverlay {
			source: iconBtn
			focus: true
			cached: true
			antialiasing: true
			anchors.fill: iconBtn
			activeFocusOnTab: true
			color: internal.dynamicColor
		}
	}
}
