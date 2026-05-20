import QtQuick

Item {
    id: clock
    width: clockRow.width
    height: 30
    
    
    property string timeString: "00:00:00"
    
    property string dateString: "00/00/0000"
    
    
    
    Timer {
        id: clockTimer
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            var currentDate = new Date();
            timeString = currentDate.toLocaleTimeString(Qt.locale("es-MX"), Locale.ShortFormat);
            dateString = currentDate.toLocaleDateString(Qt.locale("es-MX"), Locale.ShortFormat);
        }
    }
    Row {
        id: clockRow
        spacing: 8
        anchors.verticalCenter: parent.verticalCenter
        
        Text { 
            text: "󰅐"
            color: "#e9ecff" 
            font.bold: true
            font.pixelSize: 16 
            font.family: "JetBrains Mono NF"
            
            
            anchors.verticalCenter: parent.verticalCenter
            }
        Text { 
            text: clockRoot.timeString
            
            color: "#e9edf9"
            font.pixelSize: 16
            font.bold: true
            font.family: "JetBrains Mono NF"
            anchors.verticalCenter: parent.verticalCenter
        }
        Text { 
            text: "│"
            color: "#efefef"
            font.pixelSize: 16
            font.family: "JetBrains Mono NF"
            anchors.verticalCenter: parent.verticalCenter
        }
        Text { 
            text: clockRoot.dateString
            color: "#cdd6f4"
            font.pixelSize: 16
            font.family: "JetBrains Mono NF"
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}