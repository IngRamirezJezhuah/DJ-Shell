// buscar las cosas que necesito en la de sddm
import QtQuick 2.15
import "widgets"

Window {
    id: rootBar
    visible: true
    
    x: 0
    
    y: 0

    width: Screen.width
    height: 30
    color: "transparent"
    
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Window
    
    Rectangle {
        anchors.fill: parent 
        color: "#0b0b10"
        radius: 0  
        Item {
            anchors.fill: parent
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            
            // Zona Izquierda: Hardware, Clima y Batería
            Row {
                id: leftZone
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                spacing: 12
                
                Text { text: ""; color: "#cdd6f4"; font.pixelSize:18 } //manita
                Text { text: ""; color: "#cdd6f4"; font.pixelSize:18 } //flor sakura
                Text { text: "│"; color: "#45475a"; font.pixelSize:18 } //grados centigrados
                Text { text: "󰗑  55°C "; color: "#cdd6f4"; font.pixelSize:18 }
                Text { text: "󰈸"; color: "#d4452f"; font.pixelSize:18 }
                
                Battery {
                    id: batteryModule
                }
            }
            
            // Zona Central: Reloj y Workspaces (Kanji style)
            Row {
                id: centerZone
                anchors.centerIn: parent
                spacing: 15
                
                Text { text: "0 󰂜"; color: "#fab387"; font.pixelSize: 18 }
                Clock {
                    id: clockRoot
                }
                /*
                Workspace {
                        id: workspace
                    }*/
                /*
                Column {
                    id: clock 
                    width: parent.width / 2
                    spacing: 0
                    Label {
                        id: timeLabel
                        
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        font.pointSize: root.font.pointSize * 9
                        font.bold: true
                        color: "#cdd6f4"
                        renderType: Text.QtRendering
                        
                        function updateTime() {
                            text = new Date().toLocaleTimeString(Qt.locale("es-AR"), Locale.ShortFormat)
                        }
                        Timer {
                            interval: 1000
                            repeat: true
                            running: true
                            onTriggered: {
                                timeLabel.updateTime()
                            }
                        }
                    }
                }*/
                
                Text { text: "│"; color: "#45475a"; font.pixelSize: 20 } 
                
                Row {
                    id: workspaceBar
                    spacing: 12
                    
                    
                    Text { text: "barra workspace"; color: "#dfdfdf"; font.pixelSize: 18 }
                    Text { text: "一"; color: "#f38ba8"; font.pixelSize: 16; font.bold: true }
                    Text { text: "二"; color: "#6c7086"; font.pixelSize: 16 }
                    Text { text: "三"; color: "#6c7086"; font.pixelSize: 16 }
                    Text { text: "四"; color: "#6c7086"; font.pixelSize: 16 }
                    Text { text: "五"; color: "#6c7086"; font.pixelSize: 16 }
                }
                    Rectangle {
                        
                        color: "#6c7086"
                        
                    
                }
            }
            
            // Zona Derecha: Red, Audio y Power
            Row {
                id: rightZone
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                spacing: 12
                
                Text { text: "󰀂 ^ 115.0B/s"; color: "#cdd6f4"; font.pixelSize: 18 }
                Text { text: "│"; color: "#45475a"; font.pixelSize: 18 } 
                Text { text: "󰌳 40%"; color: "#f9e2af"; font.pixelSize: 18 } 
                Text { text: "⌨️ latam"; color: "#cdd6f4"; font.pixelSize: 18 }
                Text { text: "⚡"; color: "#f38ba8"; font.pixelSize: 18 }
            }
        }
    }
}