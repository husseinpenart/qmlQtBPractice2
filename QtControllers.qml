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

    ColumnLayout{
        width: parent.width
        spacing: 40

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            Layout.fillWidth: true
            text: "Delayed Button. Use it when you want to prevent accidental clicks"
            font.pointSize: 15
        }

        DelayButton{
            property bool activated: false
            text: "DelayButton"
            Layout.fillWidth: true
            delay: 1000

            onPressed: function(){
                if(activated === true){
                    console.log("Button is clicked. Carrying out the task")
                    activated = false
                }
            }

            onActivated: function(){
                console.log("Button actiaved")
                activated = true
            }

            onProgressChanged: function(){
                console.log(progress)
            }
        }
    }
    Column{
        width: parent.width
        spacing: 40

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A Knob used to let the user choose a value from a range"
            font.pointSize: 15
        }

        Dial{
            anchors.horizontalCenter: parent.horizontalCenter
            from: 1
            to: 100
            value: 50
            //wrap: true // Read the docs to figure out if you really want this for your project!

            onValueChanged: function(){
                console.log("Current value: " + Math.ceil(value))
            }
        }
    }
    Frame{
        anchors.centerIn: parent

        ColumnLayout{
            Button{
                text: "Button1"
            }
            Button{
                text: "Button2"
            }
            Button{
                text: "Button3"
            }
        }
    }

}
