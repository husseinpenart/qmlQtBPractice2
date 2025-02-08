import QtQuick
import QtQuick.Layouts

Item {
    Row{
        x: 10
        y: 10
        spacing: 20

        Rectangle{
            id: firstNameRectId
            width: firstNameLabelId.implicitWidth + 20
            height: firstNameLabelId.implicitHeight + 20
            color: "#fef5f3"

            Text{
                id: firstNameLabelId
                anchors.centerIn: parent
                text: "First name: "
            }
        }

        Rectangle{
            id: firstNameTextRectId
            width: firstNameTextId.implicitWidth + 20
            height: firstNameTextId.implicitHeight + 20
            color: "#fef5f3"

            TextInput{
                id: firstNameTextId
                anchors.centerIn: parent
                focus: true
                text: "Type in your first name"
                onEditingFinished: {
                    console.log("The first name changed to: " + text)
                }
            }
        }
    }

    Row{
        x: 10
        y: 60
        spacing: 20

        Rectangle{
            id: lastNameRectId
            width: lastNameLabelId.implicitWidth + 20
            height: lastNameLabelId.implicitHeight + 20
            color: "#fef9f8"

            Text{
                id: lastNameLabelId
                anchors.centerIn: parent
                text: "Last name: "
            }
        }

        Rectangle{
            id: lastNameTextRectId
            width: lastNameTextId.implicitWidth + 20
            height: lastNameTextId.implicitHeight + 20
            color: "#fef9f8"

            TextInput{
                id: lastNameTextId
                anchors.centerIn: parent
                focus: true

                text: "Type in your last name"
                onEditingFinished: {
                    console.log("The last name changed to: " + text)
                }
            }
        }
    }


    ColumnLayout{
          Layout.topMargin: 100
          spacing: 100

          LabeledTextInput {
              id: firstNameId
              label: "First Name: "
              placeHolderText: "Type in your first name..."
              onEditingFinished: {
                  console.log("The first name changed to: " + firstNameId.text);
              }
          }

          LabeledTextInput {
              id: lastNameId
              label: "Last Name: "
              placeHolderText: "Type in your last name..."
              onEditingFinished: {
                  console.log("The last name changed to: " + lastNameId.text);
              }
          }
      }
}
