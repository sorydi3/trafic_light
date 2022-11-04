import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Rectangle {


        id: semafor

        width: height/2
        height: parent.height/2


        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top

        anchors.topMargin: 10

        border.color: "black"
        border.width: 2

        color: "#Aaaaaa"

        states: [
            State {
                name: "rojoAbajo"
                PropertyChanges {
                    target: luz1
                    color : "green"
                }

                PropertyChanges {
                    target: luz2
                    color : "red"
                }

                PropertyChanges {
                    target: window
                    color : "lightyellow"
                }
            },

            State {
                name: "rojoArriva"
                PropertyChanges {
                    target: luz1
                    color : "red"
                }

                PropertyChanges {
                    target: luz2
                    color : "green"
                }

                 PropertyChanges {
                    target: window
                    color : "lightpink"
                }
            }
        ]

        state : "rojoArriva"

        transitions: [
            Transition {
                from: "rojoArriva"
                to: "rojoAbajo"

                ColorAnimation {
                    target : luz1
                  properties : "color"
                    duration : 1000
                }

                ColorAnimation {
                    target : luz2
                  properties : "color"
                    duration : 1000
                }

                ColorAnimation {
                    target : window
                  properties : "color"
                    duration : 1000
                }
            },

            Transition {
                from: "rojoAbajo"
                to: "rojoArriva"

                ColorAnimation {
                    target : luz1
                  properties : "color"
                    duration : 5000
                }

                ColorAnimation {
                    target : luz2
                  properties : "color"
                    duration : 5000
                }

                ColorAnimation {
                    target : window
                    properties : "color"
                    duration : 1000
                }
            }
        ]




        Rectangle {

            id: luz1

            width: parent.width /1.5
            height: parent.height /3

            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: height/3

            color: "red"

           radius: width/2
        }

        Rectangle {

            id: luz2

            width: parent.width /1.5
            height: parent.height /3

            anchors.top:luz1.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: height/3

            color: "green"

           radius: width/2
        }

    }

    Rectangle{

        id: button
        width: semafor.width *2
        height: semafor.height/3;

        anchors.top: semafor.bottom

        anchors.horizontalCenter: semafor.horizontalCenter

        anchors.topMargin: 50

        color: "lightgreen"

        border.color: Qt.darker(color)

        border.width: 2


        Text {
            id: name
            text: qsTr("Cambiar")
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 20

        }

        MouseArea{

            anchors.fill: parent

            onClicked: () =>{
              temporizador.start()

              semafor.state === "rojoAbajo" ? semafor.state = "rojoArriva" : semafor.state = "rojoAbajo"

                           label.text = "SEMAFORO INICIADO"

           }

        }

    }

    Text {
        id: label

        anchors.top: button.bottom
        anchors.topMargin: 20

        anchors.horizontalCenter: semafor.horizontalCenter


        text: ""
    }


    Timer{

        id: temporizador

        interval: 2000

        repeat: false

        onTriggered: () => {
            label.text = ""
            temporizador.stop()
        }
    }
}
