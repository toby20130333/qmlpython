import QtQuick 2.4

Rectangle {
    id: rect
    width: 200; height:40
    color: "#21be2b"
    opacity: 0
    radius: 5
    visible: false
    FontMetrics {
        id: fontMetrics
        font.family: "微软雅黑"
        font.pixelSize: 16
    }
    Text {
        id:coinId
        font.pointSize: 16
        color: "white"
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    SequentialAnimation {
        id:ani
        running: false
        NumberAnimation { target: rect; property: "opacity"; to: 1; duration: 500 }
        PauseAnimation { duration: 1000 }
        NumberAnimation { target: rect; property: "opacity"; to: 0; duration: 500 }
    }
    function setTooltips(tooltips){
        var rectS = fontMetrics.boundingRect(tooltips);
        coinId.text = tooltips;
        rect.width = rectS.width+40;
        rect.height = rectS.height+10;
    }
    function start(){
        ani.start()
    }
    function stop(){
        ani.stop();
    }
}
