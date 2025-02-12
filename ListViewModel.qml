import QtQuick

Item {
    ListView{
        id: listViewId
        anchors.fill: parent
        model: modelId
        //delegate: delegateId
        delegate:         Rectangle{
            id: rectangleId
            width: parent.width
            height: 50
            color: "beige"
            border.color: "black"
            radius: 5

            Text{
                id: textId
                anchors.centerIn: parent
                font.pointSize: 20
                text: country + ": " + capital
            }

            MouseArea{
                anchors.fill: parent
                onClicked: function(){
                    console.log("Clicken on " + country + ": " + capital)
                }
            }
        }
    }


    ListModel{
        id: modelId

        ListElement{
            country: "Iran"
            capital: "Tehran"
        }

        ListElement{
            country: "Afghanistan"
            capital: "Kabol"
        }

        ListElement{
            country: "Germany"
            capital: "Berlin"
        }

        ListElement{
            country: "India"
            capital: "Mumbai"
        }
    }


    Component{
        id: delegateId
        Rectangle{
            id: rectangleId
            width: parent.width
            height: 50
            color: "beige"
            border.color: "black"
            radius: 5

            Text{
                id: textId
                anchors.centerIn: parent
                font.pointSize: 20
                text: country + ": " + capital
            }
        }
    }
    // inline model Data
    ListView{
        id: listViewId2
        anchors.fill: parent
        model: ["January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December"]
        delegate: Rectangle{
            id: rectangleId2
            width: rootId.width
            height: 50
            color: "beige"
            border.color: "yellowgreen"
            radius: 5


            Text{
                id: textId2
                anchors.centerIn: parent
                font.pointSize: 20
                text: modelData
            }

            MouseArea{
                anchors.fill: parent
                onClicked: function(){
                    console.log("Clicked on: " + modelData)
                }
            }
        }
    }

    ListView{
        id: listViewId
        anchors.fill: parent
        header: headerId
        footer: Rectangle{
            width: rootId.width
            height: 50
            color: "dodgerblue"
        }

        highlight: Rectangle{
            width: rootId.width
            color: "blue"
            radius: 15
            border.color: "yellowgreen"
            opacity: 0.1
            z: 3
        }

        model: ["January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December"]
        delegate: Rectangle{
            id: rectangleId
            width: rootId.width
            height: 50
            color: "beige"
            border.color: "yellowgreen"
            radius: 5


            Text{
                id: textId
                anchors.centerIn: parent
                font.pointSize: 20
                text: modelData
            }

            MouseArea{
                anchors.fill: parent
                onClicked: function(){
                    console.log("Clicked on: " + modelData)
                    listViewId.currentIndex = index
                }
            }
        }
    }

    Component{
        id: headerId
        Rectangle{
            id: headerRectId
            width: rootId.width
            height: 50
            color: "yellowgreen"
            border{
                color: "#9EDDF2"
                width: 2
            }

            Text{
                anchors.centerIn: parent
                text: "Months"
                font.pointSize: 20
            }
        }
    }


    ListModel {
        id: listModelId

        ListElement {
            names: "Seth Moris"
            company: "GOOGLE"
        }
        ListElement {
            names: "Miriam Katv"
            company: "GOOGLE"
        }

        ListElement {
            names: "Eugene Fitzgerald"
            company: "GOOGLE"
        }
        ListElement {
            names: "Kantkl Vikney"
            company: "GOOGLE"
        }
        ListElement {
            names: "Mary Beige"
            company: "TESLA"
        }
        ListElement {
            names: "Bamba Pikt"
            company: "TESLA"
        }
        ListElement {
            names: "Jeffery Mor"
            company: "SIEMENS"
        }
        ListElement {
            names: "Pick Mo"
            company: "SIEMENS"
        }
    }

    ListView{
        id: listViewId
        anchors.fill: parent
        model: listModelId
        delegate: delegateId
        section{
            property: "company"
            criteria: ViewSection.FullString
            delegate: Rectangle{
                id: sectionRectId
                width: parent.width
                height: 50
                color: "red"
                border.color: "yellowgreen"
                radius: 14

                Text{
                    id: sectionTextId
                    text: section
                    anchors.centerIn: parent
                    font.pointSize: 20
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: function(){
                        console.log("Clicked on: " + section)
                    }
                }
            }
        }
    }

    Component {
        id: delegateId
        Rectangle {
            id: rectangleId
            width: parent.width  // Remember to specify these sizes or you'll have problems
            height: 50
            color: "beige"
            border.color: "yellowgreen"
            radius: 14

            Text {
                id: textId
                anchors.centerIn: parent
                text: names
                font.pointSize: 20
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on: " + names);
                }
            }
        }
    }

    /*
       Column {
           Repeater {
               model: 23
               Rectangle {
                   width: 100; height: 40
                   border.width: 1
                   color: "yellow"
               }
           }
       }
       */


    /*
       Column{
           spacing: 20
           Repeater{
               //model: ["One", "Two", "Three"]
               model: 100
               CheckBox{
                   text: modelData
               }
           }
       }
       */


    Flickable{
        contentHeight: columnId.implicitHeight
        anchors.fill: parent

        Column{
            id: columnId
            anchors.fill: parent
            spacing: 2

            Repeater{
                //model: ["Jan", "Feb", "March"]
                model: 100
                Rectangle{
                    width: parent.width
                    height: 50
                    color: "dodgerblue"

                    Text{
                        anchors.centerIn: parent
                        text: modelData
                        font.pointSize: 20
                    }


                    MouseArea{
                        anchors.fill: parent
                        onClicked: function(){
                            console.log("Clicked on " + modelData)
                        }
                    }
                }
            }
        }
    }

    ListModel {
        id: listModelId

        ListElement {
            firstName: "John"
            lastName: "Snow"
        }
        ListElement {
            firstName: "Nicholai"
            lastName: "Itchenko"
        }
        ListElement {
            firstName: "Mitch"
            lastName: "Mathson"
        }
        ListElement {
            firstName: "Ken"
            lastName: "Kologorov"
        }
        ListElement {
            firstName: "Vince"
            lastName: "Luvkyj"
        }
    }

    ColumnLayout{
        anchors.fill: parent

        ListView{
            id: listViewId
            model: listModelId
            delegate: delegateId
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Button{
            text: "Add Item"
            Layout.fillWidth: true
            onClicked: function(){
                listModelId.append({
                                       "firstName": "Daniel",
                                       "lastName": "Gakwaya"
                                   });
            }
        }
        Button{
            text: "Clear"
            Layout.fillWidth: true
            onClicked: function(){
                listModelId.clear()
            }
        }
        Button{
            text: "Delete Item at index 2"
            Layout.fillWidth: true
            onClicked: function(){
                if(2 < listViewId.model.count){ // If we have more than 2 items
                    listModelId.remove(2,1)
                }else{
                    console.log("Index is invalid")
                }
            }
        }
        Button{
            text: "Set item at index 1"
            Layout.fillWidth: true
            onClicked: function(){
                listModelId.set(1,{
                                    "firstName": "Daniel",
                                    "lastName": "Gakwaya"
                                })
            }
        }

    }


    Component {
        id: delegateId
        Rectangle {
            id: rectangleId
            width: listViewId.width
            height: 50
            color: "beige"
            border.color: "yellowgreen"
            radius: 14

            Text {
                id: textId
                anchors.centerIn: parent
                text: firstName + " " + lastName
                font.pointSize: 20
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on: " + firstName + " " + lastName);
                }
            }
        }
    }
}
