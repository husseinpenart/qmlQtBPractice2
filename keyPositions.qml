import QtQuick

Item {
    /*
      Row{
          anchors.centerIn: parent

          Rectangle{
              id: firstRectId
              width: 200
              height: width
              border.color: "black"
              color: "red"
              focus: true

              onFocusChanged: {
                  color = focus? "red" : "gray"
              }

              Keys.onDigit5Pressed: {
                  console.log("I am Rect1")
              }
              KeyNavigation.right: secondRectId
          }

          Rectangle{
              id: secondRectId
              width: 200
              height: width
              border.color: "black"
              color: "gray"
              focus: true

              onFocusChanged: {
                  color = focus? "red" : "gray"
              }

              Keys.onDigit5Pressed: {
                  console.log("I am Rect2")
              }
              KeyNavigation.left: firstRectId
          }
      }
      */

    Grid {
        width: 400; height: 200
        columns: 2

        Rectangle {
            id: topLeft
            width: 200; height: 200
            color: focus ? "red" : "lightgray"
            focus: true

            KeyNavigation.right: topRight
            KeyNavigation.down: bottomLeft
        }

        Rectangle {
            id: topRight
            width: 200; height: 200
            color: focus ? "red" : "lightgray"

            KeyNavigation.left: topLeft
            KeyNavigation.down: bottomRight
        }

        Rectangle {
            id: bottomLeft
            width: 200; height: 200
            color: focus ? "red" : "lightgray"

            KeyNavigation.right: bottomRight
            KeyNavigation.up: topLeft
        }

        Rectangle {
            id: bottomRight
            width: 200; height: 200
            color: focus ? "red" : "lightgray"

            KeyNavigation.left: bottomLeft
            KeyNavigation.up: topRight
        }
    }
}
