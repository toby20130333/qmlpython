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
            color:index %2 == 0 ?"#148FEE":"#FFFFFF"
            Text {
                id:coinId
                text:  ts_code
                font.pointSize: 14
                color: "black"
                width: root.width/4
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 10
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
            Text {
                text: trade_date
                font.pointSize: 14
                color: "black"
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
                text: close
                font.pointSize: 14
                color:close<open? "green":"red"
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                width: 50
                anchors.right: cnName2.left
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.bottom: parent.bottom
            }//
            Text {
                id:cnName2
                text:  pct_chg
                font.pointSize: 16
                color: pct_chg>0?"red":"green"
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                width: 100
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.bottom: parent.bottom
            }//
        }
    }
}
