<% @ LANGUAGE ="VBSCRIPT" CODEPAGE="65001"%>
<%
Option Explicit
Response.CharSet = "utf-8"
Response.Buffer = True
Response.Expires = -1
Response.AddHeader "Pragma","no-cache"
%>
<!--#include virtual ="/Asp_Common/inc_dbcon.asp"//-->
<%
Dim gub, arrNumber
gub = request("gub")

Call open_DbConTmm()

if Not IsEmpty(gub) Then

    if gub ="KW" Then
        '[getDDONumberCnt]
        Dim spName : spName = "hope20603.SP_INSERT_MEMBER"

        arrNumber = execProc(DbConTmm,spName)

        if err.number = 0 then
            RESPONSE.WRITE "0"
        Else
            RESPONSE.WRITE "1"
        END IF

    End if
Else
    Response.Write "파라미터가 없습니다."

End if

Call close_DbConTmm()



' 프로시저 호출
public Function execProc(dbcon , spName)
		dim sql, rs, adDBCmd, arrReturn
		
		Set adDBCmd = Server.CreateObject("ADODB.Command")
		Set adDBCmd.ActiveConnection = dbcon
		
		with adDBCmd
			.CommandText = spName
			.CommandType = adCmdStoredProc 
			.Parameters.Append adDBCmd.CreateParameter("@LOOP_NUM"    	  , adInteger, adParamInput, 0, 10000)
			'.Parameters.Append adDBCmd.CreateParameter("@iCNo"    	  , adInteger, adParamInput, 0,  iCNo)
			set rs=.execute
		end with
		
        if not rs.bof and not rs.eof then arrReturn = rs.getRows()
        Set adDBCmd = Nothing
        rs.close : Set rs = Nothing
	
	    execProc = arrReturn
end Function


%>