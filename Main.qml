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
        width: parent.width
        Button{
            id:button1
            text:"click me"
            Layout.fillWidth: true
            onClicked: function(){
                console.log("button1 clicked")
            }
        }


    }
    ColumnLayout{
        width: parent.width
        BusyIndicator{
            id:indicatorId
            visible: true
            running: true
            Layout.alignment: Qt.AlignHCenter

        }
        Button{
            id:runId
            text:"runIndicator"
            Layout.fillWidth: true
            onClicked: function(){
                indicatorId.running = true
                indicatorId.visible = true
            }
        }
        Button{
            id:stopId
            text:"stop Indicator"
            Layout.fillWidth: true
            onClicked: function(){
                indicatorId.running = false
                indicatorId.visible = false
            }
        }

        Column{
               spacing: 20
               anchors.horizontalCenter: parent.horizontalCenter

               CheckBox{
                   text: "Option1"
                   checked: true
                   onCheckedChanged: function(){
                       if(checked){
                           console.log("Option1 is checked")
                       }else{
                           console.log("Option1 is unchecked")
                       }
                   }
               }

               CheckBox{
                   text: "Option2"
               }

               CheckBox{
                   text: "Option3"
                   checked: true
                   enabled: false
               }
           }

    }
}
