import QtQuick 2.0

Item {
    id: calculator
    width: 360
    height: 360

    Rectangle{
        id: entryField
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        color: 'white'

        TextInput{
            id: textEditor
            anchors.fill:parent
            width:parent.width; height:parent.height
            color:"midnightblue"
            horizontalAlignment: Text.AlignRight
            focus: true
            font.pixelSize: 30
        }


    }

    Rectangle{
        id: resultField
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: entryField.bottom
        color: 'lightblue'
        opacity: 0.5

        TextInput{
            id: textResult
            anchors.fill:parent
            width:parent.width; height:parent.height
            color:"midnightblue"
            horizontalAlignment: Text.AlignRight
            focus: true
            font.pixelSize: 30
        }
    }

    Rectangle{
        id: buttons
        height: 260
        width: 360
        anchors.top: resultField.bottom
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: calculator.left
        anchors.leftMargin: 10
        anchors.right: calculator.right
        anchors.rightMargin: 10


        Grid {

            spacing: 5
            Repeater {
                id: repeater
                property string clearButton: "C"
                property string backspaceButton: '<-'
                model: ['7', '8', '9', clearButton, '4', '5', '6', '/', '1', '2', '3', '+', '0', '.', '*', backspaceButton]
                Button {
                    width: calculator.width/4-10
                    height: buttons.height/4-10
                    color: 'lightgrey'
                    radius: 10

                    Text{
                        text: modelData
                        anchors.centerIn: parent
                        font.pixelSize: 25
                    }
                    onClicked: {
                        console.log("Pressed ", modelData);

                        if (modelData == repeater.backspaceButton){
                            textEditor.text = textEditor.text.slice(0, -1);
                        }
                        else if (modelData == repeater.clearButton) {
                            textEditor.text = '';
                            textResult.text = '';
                        }
                        else {
                            textEditor.text = textEditor.text + modelData;
                        }

                        textResult.text = eval(textEditor.text);
                    }
                }
            }
        }
    }
}
