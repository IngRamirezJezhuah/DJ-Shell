/*
======================================================================
Nota DJ
para quee funcione este reloj es necesario importar la variable del 
reloj al env como
env = QML_XHR_ALLOW_FILE_READ,1
y ademas si no usas una lap Asus gamer 
poner BAT0 en vez de BAT1 en las rutas de lectura
======================================================================
*/

import QtQuick

Item {
    id: batteryRoot
    width: batteryRow.width
    height: 30

    property int batteryLevel: 0
    property bool isCharging: false
    
    Timer {
        id: updateTimer
        interval: 5000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            batteryLevel= batteryReader.readCapacity()
            isCharging = batteryReader.readStatus()
        }
    }

    //Helper de lectura con js/qml oh mapeado
    
    QtObject {
        id: batteryReader

        
        function readCapacity() {
            var request = new XMLHttpRequest();
            // AJUSTADO QUIRÚRGICAMENTE A BAT1
            request.open("GET", "file:///sys/class/power_supply/BAT1/capacity", false)
            try {
                request.send(null);
                var value = parseInt(request.responseText.trim());
                return isNaN(value) ? 100 : value;
            } catch (e) {
                console.error("Error reading battery capacity: " + e);
                return 100; 
            }
        }
        
        function readStatus() {
            var request = new XMLHttpRequest();
            // AJUSTADO QUIRÚRGICAMENTE A BAT1
            request.open("GET", "file:///sys/class/power_supply/BAT1/status", false)
            try {
                request.send(null);
                return request.responseText.trim() === "Charging";
            } catch (e) {
                console.error("Error reading battery status: " + e);
                return false; 
            }
        }
    }
    
    //parte viual del widget
    Row {
        id: batteryRow
        spacing: 6
        
        anchors.verticalCenter: parent.verticalCenter
        
        Text { 
            text: {
                if (batteryRoot.isCharging) return "󰂄" ; 
                // 󰂃 0 ,󰁺 1 , 󰁻 2, 󰁼 3, 󰁽 4,󰁾 5 ,󰁿 6,󰂀 7, 󰂁 8, 󰂂 9, 󱈏 10 healt, 󰂄cahrgin
                var icons = [
                    {limit: 100, icon: "󱈏 " },
                    {limit: 90, icon: "󰂂" },
                    {limit: 80, icon: "󰂁" },
                    {limit: 70, icon: "󰂀" },
                    {limit: 60, icon: "󰁿" },
                    {limit: 50, icon: "󰁾" },
                    {limit: 40, icon: "󰁽" },
                    {limit: 30, icon: "󰁼" },
                    {limit: 20, icon: "󰁻" },
                    {limit: 10, icon: "󰁺" },
                ]
                
                for (var i = 0; i < icons.length; i++) {
                    if (batteryRoot.batteryLevel >= icons[i].limit) {
                        return icons[i].icon;
                    }
                }
                return "󰂃"; // Icono para batería baja
            }
            font.pixelSize: 18
            font.bold: true
            font.family: "JetBrains Mono NF"

            
            color: batteryRoot.isCharging ? "#00ff66" : 
            (batteryRoot.batteryLevel <= 15 ? "#ff0055" : "#ffffff")

            //comportamiento visual del parpadeo si esta a nivel critico
            SequentialAnimation on opacity {
                loops: Animation.Infinite
                running: batteryRoot.batteryLevel <= 15 && !batteryRoot.isCharging
                NumberAnimation { to: 0.53; duration: 800 }
                NumberAnimation { to: 1.0 ; duration: 800 }
            }
        }
        
        // porcentaje de bateria
        Text {
            text: batteryRoot.batteryLevel + "%"
            font.pixelSize: 14
            font.bold: true
            font.family: "JetBrains Mono NF"
            color: batteryRoot.batteryLevel <= 15 && !batteryRoot.isCharging ? "#FF0055" : "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}