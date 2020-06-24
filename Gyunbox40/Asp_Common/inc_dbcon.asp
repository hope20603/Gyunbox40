<!--METADATA TYPE= "typelib"  NAME= "ADODB Type Library" FILE="C:\Program Files\Common Files\SYSTEM\ADO\msado15.dll"  -->
<%
'================================================
'Title    : 데이터 베이스 설정
'Writer   : 강승균
'Contents : 
'Date     : 2020-06-21
'================================================


'변수 정의
Dim DbConTmm
Dim g_tmm_cnt


' [ cafe24 ]
SUB open_DbConTmm()
	if g_tmm_cnt < 1  then
		Set DbConTmm = Server.CreateObject("ADODB.Connection")
		'DbConTmm.Open ("Provider=sqloledb;Data Source=10.101.34.246;Initial Catalog=moneymore;User ID=motu;Password=zxcv1602")
        'DbConTmm.Open ("Server=tcp:hope20603.cafe24.com,1433;Uid=hope20603;Pwd=gksmf1025;database=hope20603;")
		DbConTmm.open ("PROVIDER=SQLOLEDB;DATA SOURCE=hope20603.cafe24.com,1433;UID=hope20603;PWD=gksmf1025;DATABASE=hope20603")
		g_tmm_cnt = g_tmm_cnt + 1
	end if
END SUB

SUB close_DbConTmm()
	if g_tmm_cnt > 0  then
		DbConTmm.Close
		Set DbConTmm = Nothing
		g_tmm_cnt = g_tmm_cnt - 1
	end if
END SUB

%>