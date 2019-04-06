<%@ Page Title="" Language="C#" MasterPageFile="~/SiteBlog.Master" AutoEventWireup="true" CodeBehind="Write.aspx.cs" Inherits="Gyunbox40.Views.DevHome.Board.Write" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/board.css" rel="stylesheet" />
    <script src="/Content/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="text/javascript" src="/Content/se2/js/service/HuskyEZCreator.js"></script>
    <div class="se2Wrap">
        <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
        <%--<input type="button" id="btnSave" value="저장" onclick="submitContents(this);"/>--%>
        <asp:Button ID="Button1" OnClientClick="submitContents(this);" Text="Button" runat="server" />
        <script type="text/javascript">
            var oEditors = [];
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: oEditors,
                elPlaceHolder: "ir1",
                sSkinURI: "/Content/se2/SmartEditor2Skin.html",
                fCreator: "createSEditor2"
            });
        </script>
        <script type="text/javascript">


            $(document).ready(function () {

            });
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
</asp:Content>
