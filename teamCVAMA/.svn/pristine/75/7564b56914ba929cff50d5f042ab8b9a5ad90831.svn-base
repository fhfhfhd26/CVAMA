import requests
from bs4 import BeautifulSoup
import time
import cx_Oracle

for page in range(1):
    time.sleep(1)
    pageurl = "https://coronaboard.kr/"
    recvd = requests.get(pageurl)
    dom = BeautifulSoup(recvd.text, 'lxml') # 'lxml'은 html 태그가 개판인경우 정리해서 저장
    table = dom.find('table', {'class': 'minisize'})
    trs = table.find_all('td')
    print(trs)
    fn = 'd:\\study\\cvama\\data\\cworld.csv'
    trs2 = []
    for tr in trs:
        tr2 = tr.text.replace(',','')
        trs2.append(tr2)

con = cx_Oracle.connect("c##teamCVAMA/teamCVAMA@402-oracle:1521/orcl")
cur = con.cursor()

query = "insert into ckorea(no, testtotal, testtoday, coronatrue, coronafalse, death, safe, care)" \
        " values(CKorea_seq.nextval, "+trs2[7]+", "+trs2[6]+", "+trs2[3]+", "+trs2[4]+", "+trs2[2]+", "+trs2[1]+", "+trs2[0]+")"
cur.execute(query)
con.commit()
con.close()


