import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Rectangle {
	id: customCheckBtn

	property int sizeBtn: 15
	property string checkBtnText: qsTr("Type Something")
	property bool checkStatus: false
	property color hoverColotBtn: "#555555"
	property color pressColotBtn: "#000000"
	property color defaultColotBtn: "#999999"
	property url checkBtnSource: "../../images/svg/fi-rr-checkbox.svg"
	property url uncheckBtnSource: "../../images/svg/fi-rr-square.svg"


	QtObject {
		id: internal
		property color dynamicColor: if(checkBtn.down){checkBtn.down ? pressColotBtn : defaultColotBtn} else {
										 checkBtn.hovered ? hoverColotBtn : defaultColotBtn}
		function ckechBtnFunctions() {
			if (checkStatus) {
				checkStatus = false
				iconBtn.source = uncheckBtnSource
			} else {
				checkStatus = true
				iconBtn.source = checkBtnSource
			}
		}
	}
	color: '#00000000'
	Button {
		id: checkBtn
		anchors.left: parent.left
		anchors.right: textBtn.left
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		focus: true
		antialiasing: true
		implicitWidth: sizeBtn
		implicitHeight: sizeBtn
		onClicked: internal.ckechBtnFunctions()
		background: Rectangle {
			id: bgBtn
			color: '#00000000'

			Image {
				id: iconBtn
				width: sizeBtn
				height: sizeBtn
				source: uncheckBtnSource
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

	Text {
		id: textBtn
		text: customCheckBtn.checkBtnText
		anchors.left: checkBtn.right
		anchors.right: parent.right
		anchors.top: parent.top
		color: internal.dynamicColor
		anchors.bottom: parent.bottom
		horizontalAlignment: Text.AlignLeft
		verticalAlignment: Text.AlignVCenter
		leftPadding: 10
	}
}

/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:1.25;height:480;width:640}
}
##^##*/
