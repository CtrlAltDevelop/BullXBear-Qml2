import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Rectangle {
	id: customCheckBtn

	property int sizeBtn: 15
	property string checkBtnText: qsTr("Type Something")
	property bool checkBtnStatus: false
	property color hoverColorBtn: "#555555"
	property color pressColorBtn: "#000000"
	property color defaultColorBtn: "#999999"
	property url checkBtnSource: "../../images/svg/fi-rr-checkbox.svg"
	property url uncheckBtnSource: "../../images/svg/fi-rr-square.svg"


	QtObject {
		id: internal
		property color dynamicColor: if(checkBtn.down){checkBtn.down ? pressColorBtn : defaultColorBtn} else {
										 checkBtn.hovered ? hoverColorBtn : defaultColorBtn}
		function checkBtnFunctions() {
			if (checkBtnStatus) {
				checkBtnStatus = false
			} else {
				checkBtnStatus = true
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
		onClicked: internal.checkBtnFunctions()
		background: Rectangle {
			id: bgBtn
			color: '#00000000'

			Image {
				id: iconBtn
				width: sizeBtn
				height: sizeBtn
				source: checkBtnStatus ? checkBtnSource : uncheckBtnSource
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
