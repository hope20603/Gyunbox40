﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteBlog.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Gyunbox40.Views.DevHome.Board.List" %>

<%@ Register Src="~/Views/Shared/Pagenavigator.ascx" TagPrefix="uc1" TagName="Pagenavigator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainHeader" runat="server" Visible="false"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WriteHeader" runat="server">
    <header class="blog_header">
        <div class="inner">
            <h1 class="logo">
                <a href="/Views/DevHome/Board/List.aspx">블로그</a>
            </h1>
            <nav id="gnb">
                <ul>
                    <li class="btn home">
                        <a href="/">메인 홈</a>
                    </li>
                    <li class="btn write">
                        <a href="/Views/DevHome/Board/Write.aspx">글쓰기</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/board.css" rel="stylesheet" />
    <script type="text/javascript">
        function ActionPaging(tPage, boardName) {
            var pageUrl = "/Views/DevHome/Board/List.aspx?boardNum=" + boardName + "&page=" + tPage;
            location.href = pageUrl;
        }
    </script>
    <div class="section search" style="display:none;">
        <div class="logo"></div>
        <div class="search_inner_wrap">
            <asp:Literal ID="ltl_brdMnu" runat="server"></asp:Literal>
            <input type="text" id="searchText" name="searchText" value="" class="input_w600_h50"/>
            <input type="button" value="검색" onclick="javascript: alert('test');" class="btn-search"/>
        </div>
    </div>
    <table class="tbl_base list" summary="개발정보 게시판">
        <colgroup>
            <col width="5%" />
            <col width="75%" />
            <col width="10%" />
            <col width="10%" />
        </colgroup>
        <tbody>
        <asp:Repeater ID="rptBoard" runat="server">
            <ItemTemplate>
                <tr>
                    <td class="fst"><%# Eval("serial_no")%></td>
                    <td class="sec"><%# ShowReplyIcon((int)Eval("inner_id"))%><%#ShowDepth((int)Eval("depth"))%><%# ShowTitle(Eval("serial_no").ToString(),Eval("BRDNME").ToString(),Eval("title").ToString(),Eval("del_flag").ToString())%></td>
                    <td class="hide_mobile"><%# Eval("writer")%></td>
                    <td class="hide_mobile"><%# ShowDate((DateTime)Eval("reg_date"))%></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        </tbody>
    </table>
    <!-- Paging -->
    <div class="pageNotice blind" >
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
