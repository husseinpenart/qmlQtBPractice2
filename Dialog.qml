import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
Item {
    Column{
        spacing: 20
        anchors.centerIn: parent

        Button{
            text: "Choose color"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function(){
                colorDialogId.open()
            }
        }


        Rectangle{
            id: rectangleId
            width: 200
            height: 200
            border.color: "black"
            border.width: 8
            anchors.horizontalCenter: parent.horizontalCenter

        }

        ColorDialog{
            id: colorDialogId
            title: "Choose color"
            onAccepted: function(){
                console.log("Choosen color: " + selectedColor)
                rectangleId.color = selectedColor
            }

            onRejected: function(){
                console.log("User rejected the dialog")
            }
        }
    }

    Column{
        spacing: 20
        anchors.centerIn: parent

        Button{
            text: "Choose file"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function(){
                fileDialogId.open()
            }
        }


        Text{
            id: textId
            text: "User hasn't chosen yet."
            wrapMode: Text.Wrap

        }


        FileDialog{
            id: fileDialogId
            title: "Choose file"
            nameFilters: ["Text files (*.txt)", "HTML files (*.html *.htm)", "Images (*.jpg *.png)"]
            fileMode: FileDialog.OpenFiles // Allow for selecting multiple files
            onAccepted: function(){
                textId.text = currentFile
            }

            onRejected: function(){
                console.log("Dialog rejected")
            }

        }
    }
    Column {
        spacing: 20
        anchors.centerIn: parent

        Button {
            text: "Choose Folder"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function(){
                folderDialogId.open();
            }
        }

        Text {
            id: textId
            text: "Use hasn't chosen yet"
            wrapMode: Text.Wrap
        }

        FolderDialog {
            id: folderDialogId
            title: "Choose Folder"
            currentFolder: folderDialogId.currentFolder
            onAccepted: {
                textId.text = currentFolder;
            }

            onRejected: {
                textId.text = "Dialog rejected";
            }
        }
    }

    Column {
        spacing: 20
        anchors.centerIn: parent

        Button {
            text: "Change Font"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                fontDialogId.open();
            }
        }

        Text {
            id: textId2
            text: "Hello World"
        }

        FontDialog{
            id: fontDialogId
            title: "Choose Font"
            options: FontDialog.MonospacedFonts
            currentFont: Qt.font({
                                     family: "Arial",
                                     pointSize: 24,
                                     weight: Font.Normal
                                 })
            onAccepted: function(){
                textId2.font = fontDialogId.selectedFont
            }

            onRejected: function(){
                console.log("Dialog is rejected.")
            }

        }

    }

    Column{
        spacing: 20

        Button{
            text: "Press Me"
            onClicked: function(){
                messageDialogId.open()
            }
        }
    }

    MessageDialog{
        id: messageDialogId
        title: "Message"
        text: "Lie down and watch the sky my friend!"
        buttons: MessageDialog.Ok | MessageDialog.Cancel
        onAccepted: function(){
            console.log("Dialog accepted")
        }

        onRejected: function(){
            console.log("Dialog rejected")
        }
    }



    readonly property int buttonWidth: 300

    Column{
        spacing: 20
        width: parent.width

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "Dialog is a popup that is mostly used for short-term tasks "
                  + "and brief communications with the user."
        }

        Button {
            text: "Message"
            anchors.horizontalCenter: parent.horizontalCenter
            width: buttonWidth
            onClicked: messageDialog.open()

            Dialog {
                id: messageDialog

                x: (parent.width - width) / 2
                y: (parent.height - height) / 2

                title: "Message"

                Label {
                    text: "Lorem ipsum dolor sit amet..."
                }
            }
        }

        Button {
            id: button
            text: "Confirmation"
            anchors.horizontalCenter: parent.horizontalCenter
            width: buttonWidth
            onClicked: confirmationDialog.open()

            Dialog {
                id: confirmationDialog

                x: (parent.width - width) / 2
                y: (parent.height - height) / 2
                parent: Overlay.overlay

                modal: true
                title: "Confirmation"
                standardButtons: Dialog.Yes | Dialog.No

                Column {
                    spacing: 20
                    anchors.fill: parent
                    Label {
                        text: "The document has been modified.\nDo you want to save your changes?"
                    }
                    CheckBox {
                        text: "Do not ask again"
                        anchors.right: parent.right
                    }
                }
            }
        }


        Button {
            text: "Content"
            anchors.horizontalCenter: parent.horizontalCenter
            width: buttonWidth
            onClicked: contentDialog.open()

            Dialog {
                id: contentDialog

                x: (parent.width - width) / 2
                y: (parent.height - height) / 2
                width: Math.min(parent.width, parent.height) / 3 * 2
                contentHeight: logo.height * 2
                parent: Overlay.overlay

                modal: true
                title: "Content"
                standardButtons: Dialog.Close

                Flickable {
                    id: flickable
                    clip: true
                    anchors.fill: parent
                    contentHeight: column.height

                    Column {
                        id: column
                        spacing: 20
                        width: parent.width

                        Image {
                            id: logo
                            width: parent.width / 2
                            anchors.horizontalCenter: parent.horizontalCenter
                            fillMode: Image.PreserveAspectFit
                            source: "images/image1.jpg"
                        }

                        Label {
                            width: parent.width
                            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc finibus "
                                  + "in est quis laoreet. Interdum et malesuada fames ac ante ipsum primis "
                                  + "in faucibus. Curabitur eget justo sollicitudin enim faucibus bibendum. "
                                  + "Suspendisse potenti. Vestibulum cursus consequat mauris id sollicitudin. "
                                  + "Duis facilisis hendrerit consectetur. Curabitur sapien tortor, efficitur "
                                  + "id auctor nec, efficitur et nisl. Ut venenatis eros in nunc placerat, "
                                  + "eu aliquam enim suscipit."
                            wrapMode: Label.Wrap
                        }
                    }

                    ScrollIndicator.vertical: ScrollIndicator {
                        parent: contentDialog.contentItem
                        anchors.top: flickable.top
                        anchors.bottom: flickable.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: -contentDialog.rightPadding + 1
                    }
                }
            }
        }

        Button {
            text: "Input"
            anchors.horizontalCenter: parent.horizontalCenter
            width: buttonWidth
            onClicked: inputDialog.open()

            Dialog {
                id: inputDialog

                x: (parent.width - width) / 2
                y: (parent.height - height) / 2
                parent: Overlay.overlay

                focus: true
                modal: true
                title: "Input"
                standardButtons: Dialog.Ok | Dialog.Cancel

                ColumnLayout {
                    spacing: 20
                    anchors.fill: parent
                    Label {
                        elide: Label.ElideRight
                        text: "Please enter the credentials:"
                        Layout.fillWidth: true
                    }
                    TextField {
                        focus: true
                        placeholderText: "Username"
                        Layout.fillWidth: true
                    }
                    TextField {
                        placeholderText: "Password"
                        echoMode: TextField.PasswordEchoOnEdit
                        Layout.fillWidth: true
                    }
                }
            }
        }

    }
}
