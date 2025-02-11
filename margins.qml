import QtQuick

Item {
    Rectangle{
           id: containerRectId
           width: 300
           height: width
           border.color: "black"
           anchors.centerIn: parent

           Rectangle{
               id: topLeftRectId
               width: 100
               height: width
               color: "magenta"
               Text{
                   anchors.centerIn: parent
                   text: "1"
                   font.pointSize: 20
               }
           }

           Rectangle{
               id: topCenterRectId
               width: 100
               height: width
               color: "yellowgreen"
               anchors.left: topLeftRectId.right
               Text{
                   anchors.centerIn: parent
                   text: "2"
                   font.pointSize: 20
               }
           }

           Rectangle{
               id: topRightRectId
               width: 100
               height: width
               color: "dodgerblue"
               anchors.left: topCenterRectId.right
               Text{
                   anchors.centerIn: parent
                   text: "3"
                   font.pointSize: 20
               }
           }

           Rectangle {
               id: centerLeftRectId
               width: 100
               height: width
               color: "red"
               anchors.top: topLeftRectId.bottom
               Text {
                   anchors.centerIn: parent
                   text: "4"
                   font.pointSize: 20
               }
           }


           Rectangle{
               id: centerCenterRectId
               width: 100
               height: width
               color: "green"

               //Position relative to other rectangles
               //anchors.left: centerLeftRectId.right
               //anchors.top: topRightRectId.bottom

               //Position relative to parent center lines
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.verticalCenter: parent.verticalCenter

               //We can use the centerIn shorthand
               //anchors.centerIn: parent

               //Margins
               anchors.topMargin: 10

               //This margin won't work because we have no right anchor set
               anchors.rightMargin: 10

               //Offsets: they work relative to the center lines (horizontal and vertical)
               anchors.horizontalCenterOffset: -10
               anchors.verticalCenterOffset: 10

               Text{
                   anchors.centerIn: parent
                   text: "5"
                   font.pointSize: 20
               }
           }

           Rectangle {
               id: centerRightRectId
               width: 100
               height: width
               color: "blue"
               anchors.left: centerCenterRectId.right
               anchors.top: topRightRectId.bottom
               Text {
                   anchors.centerIn: parent
                   text: "6"
                   font.pointSize: 20
               }
           }

           //The bottom row will be positioned in terms of centerCenterRectId
           Rectangle {
               id: bottomLeftRectId
               width: 100
               height: width
               color: "royalblue"
               anchors.right: centerCenterRectId.left
               anchors.top: centerCenterRectId.bottom
               Text {
                   anchors.centerIn: parent
                   text: "7"
                   font.pointSize: 20
               }
           }

           Rectangle {
               id: bottomCenterRectId
               width: 100
               height: width
               color: "yellow"
               anchors {
                   left: centerCenterRectId.left
                   top: centerCenterRectId.bottom
               }
               // anchors.left: centerCenterRectId.left
               // anchors.top: centerCenterRectId.bottom
               Text {
                   anchors.centerIn: parent
                   text: "8"
                   font.pointSize: 20
               }
           }

           Rectangle {
               id: bottomRightRectId
               width: 100
               height: width
               color: "pink"
               anchors {
                   left: centerCenterRectId.right
                   top: centerCenterRectId.bottom
               }
               // anchors.left: centerCenterRectId.right
               // anchors.top: centerCenterRectId.bottom
               Text {
                   anchors.centerIn: parent
                   text: "9"
                   font.pointSize: 20
               }
           }
       }
}
