import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Timeline 1.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import "components"

Window {
	width: 350
	height: 450
	visible: true
	id: loginScreen
	color: "#00000000"
	modality: Qt.ApplicationModal
	title: qsTr("Bull X Bear | Login")
	flags: Qt.SplashScreen | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

	property bool darkMode: false
	property color bgColor: darkMode ? "#ef3f4448" : '#efeef2f5'
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
		color: "#00000000"
		anchors.fill: parent
		DragHandler { onActiveChanged: if(active){loginScreen.startSystemMove()}}

		CustomAppButton {
			id: closeBtn
			z: 1
			opacity: 0
			sizeBtn: 25
			anchors.topMargin: 20
			anchors.rightMargin: 20
			anchors.top: parent.top
			anchors.right: parent.right
			onClicked: loginScreen.close()
			hoverColotBtn: loginScreen.hoverColot
			pressColotBtn: loginScreen.pressColot
			defaultColotBtn: loginScreen.defaultColot
			iconBtnSource: "../images/svg/fi-rr-cross-small.svg"
		}

		CircularProgressBar{
			id: circularProgressBar
			width: 200
			height: 200
			text: ""
			anchors.verticalCenter: parent.verticalCenter
			samples: 12
			textShowValue: false
			enableDropShadow: true
			value: 18
			textColor: loginScreen.fgColor
			progressColor: loginScreen.specialColor
			progressWidth: 4
			strokeBgWidth: 2
			bgStrokeColor: loginScreen.pgColor
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Image {
			id: logoImage
			anchors.verticalCenter: parent.verticalCenter
			source: "../images/logo/ms-icon-144x144.png"
			anchors.horizontalCenter: parent.horizontalCenter
		}

		CustomTextField {
			id: usernameTextField
			y: 226
			width: 280
			height: 40
			opacity: 0
			anchors.bottom: parent.bottom
			anchors.bottomMargin: 184
			horizontalAlignment: Text.AlignHCenter
			anchors.horizontalCenterOffset: 0
			leftPadding: 6
			font.pointSize: 11
			placeholderText: "Email or Username"
			anchors.horizontalCenter: parent.horizontalCenter
			colorOnFocus: loginScreen.specialColorLight
			colorDefault: "#00000000"
			colorMouseOver: loginScreen.defaultColot
			borderColor: loginScreen.specialColor
			textColor: loginScreen.fgColor
			selectTextColor: loginScreen.bgColor
			selectColor: loginScreen.fgColor
			holderTextColor: loginScreen.fgColor
			maximumLength: 32
		}

		CustomTextField {
			id: passwordTextField
			width: usernameTextField.width
			height: usernameTextField.height
			anchors.top: usernameTextField.bottom
			horizontalAlignment: Text.AlignHCenter
			leftPadding: 6
			font.pointSize: 10
			placeholderText: "Password"
			opacity: usernameTextField.opacity
			anchors.topMargin: 10
			anchors.horizontalCenter: parent.horizontalCenter
			colorOnFocus: loginScreen.specialColorLight
			colorDefault: "#00000000"
			colorMouseOver: loginScreen.defaultColot
			borderColor: loginScreen.specialColor
			textColor: loginScreen.fgColor
			selectTextColor: loginScreen.bgColor
			selectColor: loginScreen.fgColor
			holderTextColor: loginScreen.fgColor
			maximumLength: 32
			echoMode: TextInput.Password
		}

		CustomCheckBox {
			id: rememberCheckBox
			width: usernameTextField.width
			height: 20

			opacity: usernameTextField.opacity
			anchors.top: passwordTextField.bottom
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 10
		}

		CustomButton {
			id: customButton
			width: usernameTextField.width
			height: 35
			opacity: usernameTextField.opacity
			anchors.top: rememberCheckBox.bottom
			anchors.horizontalCenterOffset: 0
			font.pointSize: 12
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 10
			text: "Login"
			colorPressed: loginScreen.specialColor
			colorMouseOver: loginScreen.specialColorLow
			colorDefault: loginScreen.specialColorLight
			colorText: loginScreen.fgColor
		}
	}

	Timeline {
		id: startTimeLine
		animations: [
			TimelineAnimation {
				id: timelineAnimation
				easing.bezierCurve: [0.0575,0.00592,0.276,1,1,1]
				running: true
				duration: 3000
			 loops: 1
			 to: 5000
			 from: 0
			}
		]
		endFrame: 5000
		enabled: true
		startFrame: 0

		KeyframeGroup {
			target: circularProgressBar
			property: "value"
			Keyframe {
				frame: 3000
				value: 100
			}
		}

		KeyframeGroup {
			target: logoImage
			property: "anchors.verticalCenterOffset"
			Keyframe {
				value: 0
				frame: 3500
			}
			Keyframe {
				value: -100
				frame: 5000
			}
		}

		KeyframeGroup {
			target: circularProgressBar
			property: "opacity"
			Keyframe {
				value: 1
				frame: 2500
			}
			Keyframe {
				value: 0
				frame: 3500
			}
		}

		KeyframeGroup {
			target: background
			property: "color"
			Keyframe {
				value: "#00000000"
				frame: 3000
			}
			Keyframe {
				value: loginScreen.bgColor
				frame: 5000
			}
		}

		KeyframeGroup {
			target: closeBtn
			property: "opacity"
			Keyframe {
				value: 0
				frame: 4500
			}
			Keyframe {
				value: 1
				frame: 5000
			}
		}

		KeyframeGroup {
			target: usernameTextField
			property: "opacity"
			Keyframe {
				value: 0
				frame: 4000
			}
			Keyframe {
				value: 1
				frame: 5000
			}
		}

		KeyframeGroup {
			target: usernameTextField
			property: "anchors.bottomMargin"
			Keyframe {
				value: 70
				frame: 4000
			}
			Keyframe {
				value: 180
				frame: 5000
			}
		}
	}
}

/*##^##
Designer {
	D{i:0;formeditorZoom:1.75}D{i:10}
}
##^##*/
