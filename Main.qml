import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("qt beginner practice part 2")
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

}
