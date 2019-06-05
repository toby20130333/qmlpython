#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      pc
#
# Created:     03/06/2019
# Copyright:   (c) pc 2019
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import tushare as ts
from io import StringIO

def getstockbase(code):
    print('start=====SSE=========')
    ts.set_token('e53a32fc435f5fc25ab450333bda9d545856f1dfa1afc3d11699edcc')
    pro = ts.pro_api()
    df = pro.stock_basic(exchange_id='SSE', list_status='L', fields='ts_code,symbol, name,area,industry,fullname, enname, market,exchange, curr_type, list_status, list_date, delist_date,is_hs')
    print('end===SSE===========')
    df.to_csv('SSE.csv')
    #df.to_excel('601688.xlsx')

    code = '000001.SZ'
    df1 = pro.coinlist(start_date='20080101', end_date='20181231')
    return (df1.to_json(orient='index'))
# 股票的基本信息，这里面有三个股票的基本信息，地区(area)，工业类别(industry)，市场(market)

getstockbase('000001.SZ')
