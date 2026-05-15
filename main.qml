import QtQuick 

Window {
    width: 640
    height: 480
    visible: true
    title: "DJ-Shell -ciclo 1"
    color: "#1e1e2e"

    
    Rectangle {
        
        anchors.centerIn: parent
        width: 320
        height: 120
        color: "#313244"
        radius: 12
        border.color: "#cba6f7"
        border.width: 2

        Text {
            anchors.centerIn: parent
            text: "! DJ-Shell esta vivo !"
            color: "#cdd6f4"
            font.pixelSize: 16
            font.bold: true
        }
    }
    
}
