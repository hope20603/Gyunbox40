<%@ Page Title="" Language="C#" MasterPageFile="~/SiteBlog.Master" AutoEventWireup="true" CodeBehind="Write.aspx.cs" Inherits="Gyunbox40.Views.DevHome.Board.Write" ValidateRequest="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainHeader" runat="server" Visible="false"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="WriteHeader" runat="server">
    <header class="blog_header">
        <h1 class="logo"></h1>
        <nav>
            <ul class="gnb">
                <li class="btn write"><a href="/Views/DevHome/Board/List.aspx">목록</a></li>
            </ul>
        </nav>
    </header> 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/board.css" rel="stylesheet" />
    <script src="/Content/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="text/javascript" src="/Content/se2/js/service/HuskyEZCreator.js"></script>
    <div class="container write">
        <div class="con_top">
            <input type="text" id="title" name="title" value="" placeholder="제목" class="input_type1" />
        </div>
        <div class="con_mid">
            <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
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
        <div class="con_bot">
            <asp:Button ID="Button1" OnClientClick="submitContents(this);" Text="저장" runat="server" cssClass="btn save"/>
        </div>






    </div>
</asp:Content>
