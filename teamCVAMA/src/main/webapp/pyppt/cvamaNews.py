import datetime
import json
import urllib.request
import cx_Oracle
# -*- coding: utf-8 -*-

client_id = "w03YNylkaZDCgdPTA87C"
client_secret = "jDFyxLZh2_"
encText = urllib.parse.quote("코로나")

url = "https://openapi.naver.com/v1/search/news.json?start=1&display=5&query=" + encText # json 결과

request = urllib.request.Request(url)
request.add_header("X-Naver-Client-Id", client_id)
request.add_header("X-Naver-Client-Secret", client_secret)
response = urllib.request.urlopen(request)
rescode = response.getcode()

if(rescode == 200):
    response_body = response.read()
    result = response_body.decode('utf-8')
else:
    print("Error Code:" + rescode)

source = json.loads(result)

con = cx_Oracle.connect("c##teamCVAMA/teamCVAMA@402-oracle:1521/orcl")
cur = con.cursor()

query = "delete cnews"
cur.execute(query)

for dic in source['items']:
    title = dic['title']
    content = dic['description']
    newsLink = dic['link']
    pubDate = dic['pubDate'][5:].replace(' +0900', '')
    pubDate = str(datetime.datetime.strptime(pubDate, "%d %b %Y %H:%M:%S"))

    pubDate = pubDate.replace('-', '/')

    title = title.replace('<b>코로나</b>', '코로나').replace('&quot', ' ').replace(';', '')
    title = title.replace(',', ' ').replace('\'', '"').replace('&lt;', '<').replace('&gt;', '>')
    title = title.replace('\xa0', ' ').replace('\u2027', ' ').replace('\u200b', ' ')

    content = content.replace('<b>코로나</b>', '코로나').replace('&quot', ' ').replace(';', '')
    content = content.replace(',', ' ').replace('\'', '"').replace('&lt;', '<').replace('&gt;', '>')
    content = content.replace('\xa0', ' ').replace('\u2027', ' ').replace('\u200b', ' ')

    query = " insert into CNews(no, title, content, newsLink, pubDate) " \
            " values(CNews_seq.nextval, '" + title + "', '" + content + "', '" \
            + newsLink + "', TO_DATE('" + pubDate + "', 'YYYY/MM/DD HH24:mi:SS'))"

    cur.execute(query)

con.commit()
con.close()
