<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormIndex.aspx.cs" Inherits="Gyunbox40.Views.Erp.FormIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <link href="../../Content/css/reset.css" rel="stylesheet" />
    <link href="../../Content/css/erp.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div class="FormIndexWrap">
            <ul>
                <a href="WriteForm.aspx?mode=DOC0001">
                    <li>
                        <img src="../../images/docimg/doc-icon.png" style="width: 70px;" /><span>기안문</span></li>
                </a>
                <a href="WriteForm.aspx?mode=DOC0002">
                    <li>
                        <img src="../../images/docimg/doc-icon.png" style="width: 70px;" /><span>지급품의서</span></li>
                </a>
                <a href="WriteForm.aspx?mode=DOC0003">
                    <li>
                        <img src="../../images/docimg/doc-icon.png" style="width: 70px;" /><span>휴가원</span></li>
                </a>
                <a href="WriteForm.aspx?mode=DOC0004">
                    <li>
                        <img src="../../images/docimg/doc-icon.png" style="width: 70px;" /><span>계약품의서</span></li>
                </a>
            </ul>
        </div>
    </form>
</body>
</html>
