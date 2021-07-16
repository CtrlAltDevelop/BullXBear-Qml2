import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
	id: button

	// Custom Properties
	property color colorDefault: "#4891d9"
	property color colorMouseOver: "#55AAFF"
	property color colorPressed: "#3F7EBD"
	property color colorText: "#FFFFFF"

	QtObject{
		id: internal

		property var dynamicColor: if(button.down){
									   button.down ? colorPressed : colorDefault
								   }else{
									   button.hovered ? colorMouseOver : colorDefault
								   }
	}

	text: qsTr("Button")
	contentItem: Item{
		Text {
			id: name
			text: button.text
			font: button.font
			color: internal.dynamicColor
			anchors.verticalCenter: parent.verticalCenter
			anchors.horizontalCenter: parent.horizontalCenter
		}
	}

	background: Rectangle{
		color: "#00000000"
		radius: 10
	}
}
/*##^##
Designer {
	D{i:0;autoSize:true;formeditorZoom:1.5;height:480;width:640}
}
##^##*/
