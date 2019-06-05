import QtQuick 2.0

Item {
    property var myModel: listModel
    ListView {
        anchors.fill: parent
        model: ListModel {
            id: listModel
        }
        delegate: Rectangle{
            width: root.width
            height: 40
            color:Qt.rgba(Math.random(),Math.random(),Math.random(),0.8)
            Text {
                id:coinId
                text: title
                font.pointSize: 18
                color: "black"
                width: root.width/3
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 10
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
            Text {
                text: type
                font.pointSize: 14
                color: "white"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: coinId.right
                anchors.right: cnName.left
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                elide: Text.ElideMiddle
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }//cn_name
            Text {
                id:cnName
                text: datetime
                font.pointSize: 16
                color: "green"
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                width: root.width/4
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.bottom: parent.bottom
            }//
        }
    }
}
