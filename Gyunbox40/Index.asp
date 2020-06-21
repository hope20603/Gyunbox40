<% @ LANGUAGE ="VBSCRIPT" CODEPAGE="65001"%>
<%
Option Explicit
Response.Buffer = True
Response.Expires = -1
Response.AddHeader "Pragma","no-cache"
%>
<!--#include virtual ="/Asp_Common/inc_dbcon.asp"//-->
<!--#include virtual ="/Asp_Common/Class/inc_class_ddo.asp"//-->

<%
Dim arrMember, cDdo
Set cDdo = new clsDdo

Call open_DbConTmm()

arrMember = cDdo.GetMember(DbConTmm)

if IsArray(arrMember) Then
    Dim i
    for i=0 to Ubound(arrMember,2) -1 step 1
        Response.Write arrMember(0,i) & "/" & arrMember(1,i) & "/" & arrMember(2,i)& "/" & arrMember(3,i)& "/" & arrMember(4,i)& "/" & arrMember(5,i) & "<br>"
    Next
End If

Call close_DbConTmm()
Set arrMember = Nothing

%>