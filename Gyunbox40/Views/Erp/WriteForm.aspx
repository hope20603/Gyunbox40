<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WriteForm.aspx.cs" Inherits="Gyunbox40.Views.Erp.WriteForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>
<script src="/Content/js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="display:none;">
            <asp:DropDownList ID="ddlDoc" runat="server"></asp:DropDownList>
        </div>
        <link href="/Content/css/board.css" rel="stylesheet" />
    <script src="/Content/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="text/javascript" src="/Content/se2/js/service/HuskyEZCreator.js"></script>
    <style>
        .container.write{width:1230px;}
    </style>
    <div class="container write">
        <div class="con_cat">
<%--            <asp:DropDownList ID="ddl_category" runat="server"></asp:DropDownList>--%>
            <asp:Literal ID="ltl_test" runat="server"></asp:Literal>
        </div>
        <div class="con_top">
            <input type="text" id="title" name="title" value="" placeholder="제목" class="input_type1"  runat="server"/>
        </div>
        <div class="con_mid">
            <textarea name="ir1" id="ir1" rows="10" cols="90" value=""></textarea>
            <script type="text/javascript">
                var oEditors = [];
                nhn.husky.EZCreator.createInIFrame({
                    oAppRef: oEditors,
                    elPlaceHolder: "ir1",
                    sSkinURI: "/Content/se2/SmartEditor2Skin.html",
                    fCreator: "createSEditor2",
                    fOnAppLoad: function () {
                        oEditors.getById["ir1"].exec("PASTE_HTML", ["<%=txtContent%>"]);
                    }
                    
                });

                
            </script>
            <script type="text/javascript">

                // ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
                function submitContents(elClickedObj) {
                    // 에디터의 내용이 textarea에 적용된다.
                    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
                    //document.getElementById("ir1").value);
                    try {
                        //elClickedObj.form.submit();

                    } catch (e) {
                    }
                }
            </script>
        </div>
        <div class="con_bot">
            <asp:Button ID="Button1" OnClientClick="submitContents(this);" Text="저장" runat="server" cssClass="btn save"/>
        </div>
    </div>
    </form>
</body>
</html>
