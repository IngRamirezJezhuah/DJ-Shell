import QtQuick 

Window {
    id: panel
    width: 1920
    height: 50
    visible: true
    title: "DJ-Shell-panel"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Window
    color: "transparent"

    //Barra de tareas con qml
    Rectangle {
        //margenes de qml con la heredacion de anchors para que se adapte a cualquier resolucion
        anchors.fill: parent 
        anchors.margins: 4
        
        color: "#c51e1e2e"
        radius: 10
        border.color: "#45495a"
        border.width: 1

        Text {
            anchors.centerIn: parent
            text: " DJ-Shell | Ciclo 2: wayland Panel"
            color: "#cdd6f4"
            font.pixelSize: 12
            font.bold: true
        }
    }
    
}
