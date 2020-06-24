<%

Class clsDdo

    Public Function GetMember (dbCon)
        Dim strSql, rs ,arRet
        strSql = "select * from hope20603.member;"
    
       	set rs=dbCon.execute(strSql)
    	if not rs.bof and not rs.eof then	arRet = rs.getRows()
    	rs.close : set rs=nothing

    	GetMember = arRet
    End Function

End class

%>