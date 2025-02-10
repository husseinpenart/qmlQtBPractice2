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

    Column{
        spacing: 10
        anchors.fill: parent

        //RadioButton controls
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A GroupBox wrapping around RadioButtons."
        }

        GroupBox{
            title: "Choose bonus"
            anchors.horizontalCenter: parent.horizontalCenter
            Column{
                RadioButton{
                    text: "Coke"
                    onCheckedChanged: function(){
                        if(checked){
                            console.log("Coke button checked")
                        }else{
                            console.log("Coke button NOT checked")
                        }
                    }
                }

                RadioButton{
                    text: "Green Tea"
                }

                RadioButton{
                    text: "Ice Cream"
                }
            }
        }

        //Checkbox controls
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A GroupBox wrapping around CheckBoxes."
        }

        GroupBox{
            title: "Choose a Qt supported desktop platoform"
            anchors.horizontalCenter: parent.horizontalCenter
            Column{
                CheckBox{
                    text: "Windows"
                    onCheckedChanged: function(){
                        if(checked){
                            console.log("Windows button checked")
                        }else{
                            console.log("Windows button NOT checked")
                        }
                    }
                }

                CheckBox{
                    text: "Mac"
                }

                CheckBox{
                    text: "Linux"
                }
            }
        }

        // Disable and enable a groupbox
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A Groupbox that can enabled and disabled"
        }

        GroupBox{
            anchors.horizontalCenter: parent.horizontalCenter
            label: CheckBox{
                id: checkBox
                checked: true
                text: checked ? "Disable" : "Enable" // ternary operator
                onCheckedChanged: function(){
                    console.log("Status: " + text + "d")
                }
            }

            Column{
                enabled: checkBox.checked
                CheckBox{
                    text: "Item1"
                }
                CheckBox{
                    text: "Item2"
                }
                CheckBox{
                    text: "Item3"
                }
            }
        }

    }

    SwipeView{
        id: swipeViewId
        anchors.fill: parent
        currentIndex: pageIndicatorId.currentIndex
        anchors.bottomMargin: 20

        Image{
            id: image1
            fillMode: Image.PreserveAspectFit
            source: "images/image1.jpg"
        }
        Image{
            id: image2
            fillMode: Image.PreserveAspectFit
            source: "images/image2.jpg"
        }
        Image{
            id: image3
            fillMode: Image.PreserveAspectFit
            source: "images/image3.jpg"
        }

        onCurrentIndexChanged: function(){
            console.log("Current index: " + currentIndex)
        }
    }

    PageIndicator{
        id: pageIndicatorId
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        //PageIndicator specific properties
        currentIndex: swipeViewId.currentIndex
        interactive: true
        count: swipeViewId.count
    }
    Column{
        width: parent.width
        spacing: 20

        Button{
            text: "Start"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function(){
                //Respond when the button is clicked.
                progressBarId1.value = 75
            }
        }

        Dial{
            id: dialId
            from: 1
            to : 100
            value: 40
            anchors.horizontalCenter: parent.horizontalCenter
            onValueChanged: function(){
                //Transfer the value to some ProgressBar
                progressBarId.value = value
            }
        }

        ProgressBar{
            id: progressBarId
            from: 1
            to: 100
            value: 40
            anchors.horizontalCenter: parent.horizontalCenter
            onValueChanged: function(){
                console.log("Current value: " + visualPosition)
            }
        }


        ProgressBar{
            id: progressBarId1
            //value: 40
            indeterminate: true
            from: 1
            to: 100
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    RangeSlider{
        anchors.centerIn: parent
        from: 1
        to: 100
        first.value: 25
        second.value: 75

        first.onValueChanged: function(){
            console.log("First value changed to " + Math.ceil(first.value))
        }

        second.onValueChanged: function(){
            console.log("Second value changed to " + Math.ceil(second.value))
        }
    }

    Flickable{
        width: parent.width
        height: parent.height
        contentHeight: mColumnId.implicitHeight

        Column{
            id: mColumnId
            anchors.fill: parent

            Rectangle{
                color: "red"
                width: parent.width
                height: 200
                Text{
                    anchors.centerIn: parent
                    text: "Element1"
                    font.pointSize: 30
                    color: "white"
                }
            }
            Rectangle{
                color: "lightgray"
                width: parent.width
                height: 200
                Text{
                    anchors.centerIn: parent
                    text: "Element2"
                    font.pointSize: 30
                    color: "white"
                }
            }
            Rectangle{
                color: "gray"
                width: parent.width
                height: 200
                Text{
                    anchors.centerIn: parent
                    text: "Element3"
                    font.pointSize: 30
                    color: "white"
                }
            }
            Rectangle{
                color: "yellowgreen"
                width: parent.width
                height: 200
                Text{
                    anchors.centerIn: parent
                    text: "Element4"
                    font.pointSize: 30
                    color: "white"
                }
            }
            Rectangle{
                color: "dodgerblue"
                width: parent.width
                height: 200
                Text{
                    anchors.centerIn: parent
                    text: "Element5"
                    font.pointSize: 30
                    color: "white"
                }
            }
            Rectangle{
                color: "green"
                width: parent.width
                height: 200
                Text{
                    anchors.centerIn: parent
                    text: "Element6"
                    font.pointSize: 30
                    color: "white"
                }
            }
        }

        ScrollBar.vertical: ScrollBar{

        }
    }

    Column{
        width: parent.width
        spacing: 20

        Slider{
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            from: 1
            to: 100
            value: 40
            onValueChanged: function(){
                progressBarId.value = value
            }
        }

        ProgressBar{
            id: progressBarId
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            from: 1
            to: 100
            value: 40
        }
    }

    Column{
        width: parent.width
        spacing: 20

        Switch{
            anchors.horizontalCenter: parent.horizontalCenter
            text: "WiFi"
            checked: true
            onCheckedChanged: function(){
                if(checked){
                    console.log("WiFi switch is turned ON")
                }else{
                    console.log("WiFi switch is turned OFF")
                }
            }
        }

        Switch{
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Bluetooth"
        }

        Switch{
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: false
            text: "NFC"
        }
    }
    Page{
        id: pageId
        anchors.fill: parent


        header: Rectangle{
            width: parent.width
            height: 50
            color: "yellowgreen"
            Text{
                text: "header Text"
                anchors.centerIn: parent
            }
        }


        SwipeView {
            id: swipeViewId
            anchors.fill: parent
            currentIndex: tabBarId.currentIndex

            Image {
                fillMode: Image.PreserveAspectFit
                source: "images/image1.jpg"
            }

            Image {
                fillMode: Image.PreserveAspectFit
                source: "images/image2.jpg"
            }
            Image {
                fillMode: Image.PreserveAspectFit
                source: "images/image3.jpg"
            }
        }

        footer: TabBar{
            id: tabBarId
            currentIndex: swipeViewId.currentIndex

            TabButton{
                text: "First"
            }
            TabButton{
                text: "Second"
            }
            TabButton{
                text: "Third"
            }

        }
    }

    Column{
        spacing: 40
        width: parent.width

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "TextArea is a multi-line text editor."
        }

        ScrollView{
            id: scrollViewId
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: 150
            TextArea{
                id: textAreaId
                font.pointSize: 15
                wrapMode: TextArea.WordWrap
                placeholderText: "About Yourself"
            }
        }

        Button{
            text: "Submit"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function(){
                //console.log("The text is: " + textAreaId.text)
                textAreaId.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan"
            }
        }
    }

    Column{
        spacing: 30
        anchors.centerIn: parent

        Row{
            spacing: 30
            width: 300
            Label{
                width: 100
                height: 50
                wrapMode: Label.Wrap
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                text: "First name: "
            }

            Text{
                id:textValue
                color:"red"
                text: textFieldId.text
            }

            TextField{
                id: textFieldId
                width: 200
                height: 50
                placeholderText: "Type in your name"
                onEditingFinished: function(){
                    console.log("Current text: " + text)
                }
            }
        }

        Button{
            text: "Click"
            onClicked: function(){
                console.log("Text: " + textFieldId.text)
                textFieldId.text = textValue.text
            }
        }
    }


    SplitView{
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle{
            id: rect1Id
            SplitView.preferredWidth: 100
            color: "lightblue"
            Text{
                text: "View1"
                anchors.centerIn: parent
            }
        }
        Rectangle{
            id: rect2Id
            SplitView.preferredWidth: 100
            SplitView.minimumWidth: 50
            color: "lightgray"
            Text{
                text: "View2"
                anchors.centerIn: parent
            }
        }
        Rectangle{
            id: rect3Id
            SplitView.preferredWidth: 100
            color: "lightgreen"
            Text{
                text: "View3"
                anchors.centerIn: parent
            }
        }
    }

    // drawer part which need applicationWindows Tags /

    header: ToolBar{
        height: 50
        background: Rectangle{
            color: "lightgray"
        }

        RowLayout{
            spacing: 20
            anchors.fill: parent

            ToolButton{
                background: Rectangle{
                    color: "lightgray"
                }

                icon.source: "images/drawer.png"

                onClicked: function(){
                    //Open the drawer
                    drawerId.open()
                }
            }

            Label{
                id: titleLabelId
                text: "Drawerr App"
                font.pointSize: 20
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
        }
    }

    Drawer{
        id: drawerId
        width: Math.min(rootId.width, rootId.height) * (2/3)
        height: rootId.height
        interactive: true

        ColumnLayout{
            spacing: 0
            width: parent.width

            Button{
                width: parent.width
                height: 50
                text: "Item1"
                font.pointSize: 20
                background: Rectangle{
                    color: "dodgerblue"
                }
                Layout.fillWidth: true
                onClicked: function(){
                    console.log("Clicked on Item1")
                    contentRectId.color = "red"
                    drawerId.close()
                }
            }
            Button{
                width: parent.width
                height: 50
                text: "Item2"
                font.pointSize: 20
                background: Rectangle{
                    color: "yellowgreen"
                }
                Layout.fillWidth: true
                onClicked: function(){
                    console.log("Clicked on Item2")
                    contentRectId.color = "green"
                    drawerId.close()
                }
            }
            Button{
                width: parent.width
                height: 50
                text: "Item3"
                font.pointSize: 20
                background: Rectangle{
                    color: "dodgerblue"
                }
                Layout.fillWidth: true
                onClicked: function(){
                    console.log("Clicked on Item3")
                    contentRectId.color = "blue"
                    drawerId.close()
                }
            }
        }

    }

    Rectangle{
        id: contentRectId
        anchors.fill: parent
        color: "gray"
    }
}
