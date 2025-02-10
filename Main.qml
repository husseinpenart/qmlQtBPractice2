import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("qt beginner practice part 2")


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
}
