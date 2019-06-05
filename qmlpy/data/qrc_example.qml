import QtQuick 2.0
import io.thp.pyotherside 1.3
import QtQuick.Controls 2.3

Rectangle {
    id:root
    width: 600
    height: 800
    property bool loading: false
    property bool hasError: false
    PythonBusyIndicator {
        running: loading
        anchors.centerIn: parent
    }
    DDuiAnimationTips{
        id:aniId
        anchors.centerIn: parent
    }
    SwipeView {
        id: view
        currentIndex: 0
        anchors.fill: parent
        DDuiCoinList {
            id: firstPage
        }
        DDuiStockList {
            id: secondPage
        }
        DDuiDailyKLine {
            id: thirdPage
        }
        DDuiNewShare {
            id: fourPage
        }
        DDuiExchange {
            id: fivePage
        }
        DDuiCoinNews {
            id: sixPage
        }
    }
    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onCurrentIndexChanged: {
            loading = true;
            if(currentIndex == 0){
                getCoinlist("getcoinlist",firstPage);
            }else if(currentIndex == 1){
                getCoinlist("getstockbase",secondPage);
            }else if(currentIndex == 2){
                getCoinlist("dailyK",thirdPage);
            }else if(currentIndex == 3){
                getCoinlist("new_share",fourPage);
            }else if(currentIndex == 4){
                getCoinlist("coinexchanges",fivePage);
            }else if(currentIndex == 5){
                getCoinlist("jinse",sixPage);
            }
        }
    }

    Python {
        id: py
        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('.'));
            importModule('qrc_example', function (success) {
                console.log('module imported: ' + success);
                getCoinlist("getcoinlist",firstPage);
            });
        }
    }
    function getCoinlist(functionName,pageId){
        loading = true;
        var functionId = 'qrc_example.'+functionName;
        py.call(functionId, '', function(result) {
            // Load the received data into the list model
            //console.log("pageId"+pageId+ "result: " + result.length);
            loading = false;
            try{
            var obj = JSON.parse(result);
            if(typeof obj ==='object'){
                for(var i in obj) {
                    //if(obj[i].cn_name == null)continue;
                    pageId.myModel.append(obj[i]);
                }
            }
            }
            catch(e){
                console.log("============error=====");
                aniId.visible = true;
                aniId.setTooltips("接口出错啦............");
                aniId.start();
            }
        });
    }
}
