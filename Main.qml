import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("qt beginner practice part 2")

    ColumnLayout{
        anchors.left: parent.left
        anchors.right: parent.right

        Button{
            id:button1
            text:"click me"
            Layout.fillWidth: true
            onClicked: function(){
                console.log("button1 clicked")
            }
        }
    }
}
