import QtQuick

Item {
    Rectangle{
        id:containerRectId
        border.color: "black"
        width: 300
        height: width
        anchors.centerIn: parent

        Rectangle{
            id:topLeftContainer
            color:'gray'
            width: 100
            height: width

        }
    }
    Rectangle{
        id:siblingRectId
        color: "pink"
        width: 300
        height: width
        anchors.right: containerRectId.left
        anchors.leftMargin:20
    }

}
