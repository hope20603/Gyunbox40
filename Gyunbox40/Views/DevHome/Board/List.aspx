<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Gyunbox40.Views.DevHome.Board.List" %>

<%@ Register Src="~/Views/Shared/Pagenavigator.ascx" TagPrefix="uc1" TagName="Pagenavigator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/board.css" rel="stylesheet" />
    <script type="text/javascript">
        function ActionPaging(tPage, boardName) {
            var pageUrl = "/Views/DevHome/Board/List.aspx?boardNum=" + boardName + "&page=" + tPage;
            location.href = pageUrl;
        }
    </script>
    <table class="tbl_base">
        <asp:Repeater ID="rptBoard" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%# Eval("serial_no")%></td>
                    <td><%# ShowReplyIcon((int)Eval("inner_id"))%><%#ShowDepth((int)Eval("depth"))%><%# ShowTitle(Eval("serial_no").ToString(),Eval("title").ToString(),Eval("del_flag").ToString())%></td>
                    <td><%# Eval("writer")%></td>
                    <td><%# ShowDate((DateTime)Eval("reg_date"))%></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <!-- Paging -->
    <div class="pageNotice">
        <p class="page">
            <b><span class="sp_num">
                <asp:Label ID="lb_total" runat="server"></asp:Label></span></b> 페이지 / 총 <b>
                    <span class="sp_num">
                        <asp:Label ID="lb_cur" runat="server"></asp:Label></span></b> 페이지
        </p>
        <div class="paging">
            <uc1:Pagenavigator ID="PageNavigator" runat="server"></uc1:Pagenavigator>
        </div>
    </div>
    <!-- Paging //-->
</asp:Content>
