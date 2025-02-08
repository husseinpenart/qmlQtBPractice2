import QtQuick

Item {
    TextEdit {
        width: 540
        text: "<b>Text</b> <i>Edit!</i>"
        font.family: "Helvetica"
        font.pointSize: 15
        color: "blue"
        focus: true
        wrapMode: TextEdit.Wrap
        textFormat: TextEdit.RichText
        onEditingFinished: {
            console.log("The current text is: " + text)
        }
    }
}
