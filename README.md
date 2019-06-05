# qmlpython
Mixed programming based on QtQuick and Python

### 主要展示Qt与Python的结合

* 主要依赖于pyotherside[第三方库](http://github.com/thp/pyotherside/)
* 结合Python3.0
* 结合QtQuick插件式开发
* 结合第三方[Python功能库](https://tushare.pro/document/2)进行功能开发

### 展示效果
  全球数字货币
![1](http://qtddui.b0.upaiyun.com/py/1.png)

  A股上市公司一览
![2](http://qtddui.b0.upaiyun.com/py/2.png)

 某股日线数据
![3](http://qtddui.b0.upaiyun.com/py/3.png)

 新股上市一览
![14](http://qtddui.b0.upaiyun.com/py/4.png)

 全球数字货币交易所
![5](http://qtddui.b0.upaiyun.com/py/5.png)

### 展示代码

```
    ///获取金融相关数据
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
```

```
# Python 代码
import pyotherside
import os.path
import sys
import tushare as ts
from io import StringIO
print('Hello from module!')
print(sys.path)

print('='*30)
def getstockbase():
    print('start=====SSE=========')
    ts.set_token('e53a32fc435f5fc25ab450333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.stock_basic(exchange_id='SSE', list_status='L', fields='ts_code,symbol, name,area,industry,fullname, enname, market,exchange, curr_type, list_status, list_date, delist_date,is_hs')
    return (df.to_json(orient='index'))

def getcoinlist():
    ts.set_token('e53a32fc435f5fc25ab450333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df1 = pro.coinlist(start_date='20080101', end_date='20141231')
    return (df1.to_json(orient='index'))

def coinexchanges():
    ts.set_token('e53a32fc435f5fc25ab450333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df1 = pro.coinexchanges(area_code='us')
    df1 = df1.sort('pairs', ascending=False)
    return (df1.to_json(orient='index'))

def dailyK():
    ts.set_token('e53a32fc435f5fc25ab450333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.daily(ts_code='000001.SZ', start_date='20180701', end_date='20190518')
    return (df.to_json(orient='index'))

def new_share():
    ts.set_token('e53a32fc435f5fc25ab450333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.new_share(start_date='20180901', end_date='20190618')
    return (df.to_json(orient='index'))

def coinexchanges():
    ts.set_token('e53a32fc435f5fc25ab450333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.coinexchanges()
    return (df.to_json(orient='index'))

def jinse():
    ts.set_token('e53a32fc435f5fc25ab450333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.jinse(start_date='2019-05-17 16:00:00', end_date='2019-06-04 18:00:00', \
                    fields='title, type, datetime')
    return (df.to_json(orient='index'))
print('='*30)

```


## 憧憬

* 实现国内针对QtQuick与Python结合
* 扩大QtQuick在Python领域的使用
* 让Python库成为Qt的一个强力的类库


## 贡献

* [寒山-居士](https://github.com/toby20130333)
* [toby520](http://www.heilqt.com)
* [cms多多指教](http://cms.heilqt.com/)