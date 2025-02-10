import QtQuick
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {

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

    ColumnLayout{
        width: parent.width
        height: parent.height

        //Non Editable ComboBox

        Label{
            text: "Non Editable Combo"
            wrapMode: Label.Wrap
            Layout.fillWidth: true
        }

        ComboBox{
            id: nonEditableComboId
            model: ["Hussein", "Sara", "Layla", "James"]
            Layout.fillWidth: true
            onActivated: {
                console.log("selected names is [" + currentIndex + "] " + currentText + " is showing")
            }
        }

        //Editable ComboBox
        Label {
            text: "Editable Combo"
            wrapMode: Label.Wrap
            Layout.fillWidth: true
        }

        ComboBox{
            id: editableComboId
            editable: true
            textRole: "text"
            Layout.fillWidth: true
            model: ListModel{
                id: model
                ListElement{
                    text: "Dog"
                    location: "Kigali"
                    favorite_food: "Meat"
                }
                ListElement{
                    text: "Chicken"
                    location: "Nairobi"
                    favorite_food: "Rice"
                }
                ListElement{
                    text: "Cat"
                    location: "Mumbai"
                    favorite_food: "Fish"
                }
            }

            onActivated: function(){
                console.log("[" + currentIndex + "] " + currentText + " is activated")
            }


            onAccepted: function(){
                if(find(editText) === -1){
                    model.append({ text: editText, location: "US", favorite_food: "Apple"})
                }
            }
        }

        Button{
            text: "Captrue current element"
            Layout.fillWidth: true
            onClicked: function(){
                console.log( model.get(editableComboId.currentIndex).text + ", " + model.get(editableComboId.currentIndex).location)
            }
        }

        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

    }



}
