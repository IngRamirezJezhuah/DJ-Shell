/*
    Desarrollo de las navegacion
    entre workspaces para lo que es 
    las vistas de escritorio
*/
import QtQuick

Item {
    id: workspace
    width: workspaceRow.width
    height: 30
    
    property int workspaceIndex: 1
    
    
    readonly property var katakanas: [ 
        "ゼロ" , "イチ", 
        "ニ", "サン", 
        "シ", "ゴ", 
        "ロク", "シチ", 
        "ハチ", "キュウ", 
        "ジュウ" 
        ]
    
    
    function getVisibleWorkspace() {

        var current = activeWorkspace;
        var starts = 1;

        if (current >= 3 ) {
            start = 1;
        } else {
            start = current - 3;
        }
        return [start, start +1, start + 2, start + 3];
    }
    
    Row {
        id: workspaceRow
        spacing: 14
        anchors.verticalCenter: parent.verticalCenter
        
        Repeater {

            model: workspace.getVisibleWorkspace()

            delegate: Text {
                
                readonly property int wsId: modelData
                text: (wsId - 1 < workspace.katakanas.length) ? workspace.katakanas[wsId - 1] : wsId.toString()
                font.pixelSize: 16

                font.bold: WsId === workspace.activeWorkspace
                
                color: (wsId === workspace.activate) ? "#f38ba8" : "#6c7086"
                
                Behavior on color { ColorAnimation { duration: 150 } }
            }   
        }
    }
}