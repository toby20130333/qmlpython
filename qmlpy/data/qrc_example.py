import pyotherside
import os.path
import sys
import tushare as ts
from io import StringIO
print('='*30)

def getstockbase():
    print('start=====SSE=========')
    ts.set_token('e53a32fc435f5fc25abc450333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.stock_basic(exchange_id='SSE', list_status='L', fields='ts_code,symbol, name,area,industry,fullname, enname, market,exchange, curr_type, list_status, list_date, delist_date,is_hs')
    return (df.to_json(orient='index'))

def getcoinlist():
    ts.set_token('e53a32fc435f5fc25ab4c50333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df1 = pro.coinlist(start_date='20080101', end_date='20141231')
    return (df1.to_json(orient='index'))

def coinexchanges():
    ts.set_token('e53a32fc435f5fc25ab45c0333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df1 = pro.coinexchanges(area_code='us')
    df1 = df1.sort('pairs', ascending=False)
    return (df1.to_json(orient='index'))

def dailyK():
    ts.set_token('e53a32fc435f5fc25ab45c0333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.daily(ts_code='000001.SZ', start_date='20180701', end_date='20190518')
    return (df.to_json(orient='index'))

def new_share():
    ts.set_token('e53a32fc435f5fc25ab45c0333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.new_share(start_date='20180901', end_date='20190618')
    return (df.to_json(orient='index'))

def coinexchanges():
    ts.set_token('e53a32fc435f5fc25ab45c0333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.coinexchanges()
    return (df.to_json(orient='index'))

def jinse():
    ts.set_token('e53a32fc435f5fc25ab45c0333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.jinse(start_date='2019-05-17 16:00:00', end_date='2019-06-04 18:00:00', \
                    fields='title, type, datetime')
    return (df.to_json(orient='index'))
print('='*30)
