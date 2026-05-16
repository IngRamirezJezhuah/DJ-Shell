import QtQuick 
//import QtQuick.QtQuick.Controls

Window {
    id: rootBar
    visible: true
    
    x: 0
    y: 0
    width: Screen.width
    height: 45
    color: "transparent"
    //flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Window
    
    property bool isFloating: true

    //Barra de tareas con qml
    
    Rectangle {
        
        //margenes de qml con la heredacion de anchors para que se adapte a cualquier resolucion

        anchors.fill: parent 
        color: "transparent"

        anchors.margins: rootBar.isFloating ? 5 : 0
        radius: rootBar.isFloating ? 8 : 0

        Item {
            
            anchors.fill: parent
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            
            //Zona Izq 
            
            Row {
                id: leftZone
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                //Aqui van los modulos de hyprland workspaces
                Text {
                    anchors.centerIn: parent
                    text: " izquierda "
                    color: "#cdd6f4"
                    font.pixelSize: 12
                    font.bold: true
                }
                Rectangle { width: 30; height: 20; color: "#390099"; radius: 4 }
                Rectangle { width: 30; height: 20; color: "#9e0059"; radius: 4 }
            }
            //Zona central
            Row {
                id: centerZone
                anchors.centerIn: parent
                anchors.top: parent.top

                spacing: 10
                //reloj digital
                
                Text {
                    anchors.centerIn: parent
                    text: " Centro "
                    color: "#cdd6f4"
                    font.pixelSize: 12
                    font.bold: true
                }
            }
            //Zona derc
            Row {
                id: rightZone
                
                anchors.right: parent.right
                spacing: 10
                //Aqui van los indicadores de sistema como volumen, bateria, wifi, etc
                Text {
                    anchors.centerIn: parent
                    text: " derecha "
                    color: "#cdd6f4"
                    font.pixelSize: 12
                    font.bold: true
                }
                Rectangle { width: 25; height: 25; color: "#ff5400"; radius: 12 }
                Rectangle { width: 25; height: 25; color: "#ffbd00"; radius: 12 }
            }
        }

    }
}
