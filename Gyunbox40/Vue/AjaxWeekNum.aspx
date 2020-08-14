<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Ajax.Master" AutoEventWireup="true" CodeBehind="AjaxWeekNum.aspx.cs" Inherits="Gyunbox40.Vue.AjaxWeekNum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="week_wrap">
        <a href="javascript;" onclick="movePage();">prev</a>
        <div class="week_con">
            <div class="con_tit"></div>
            <div class="con_con">
                <div class="prizeresult">
                    <div class="num clr<%=model.COL1%>"><span><%=model.NUM1%></span></div>
                    <div class="num clr<%=model.COL2%>"><span><%=model.NUM2%></span></div>
                    <div class="num clr<%=model.COL3%>"><span><%=model.NUM3%></span></div>
                    <div class="num clr<%=model.COL4%>"><span><%=model.NUM4%></span></div>
                    <div class="num clr<%=model.COL5%>"><span><%=model.NUM5%></span></div>
                    <div class="num clr<%=model.COL6%>"><span><%=model.NUM6%></span></div>
                    <div class="num bonus clr<%=model.COL7%>""><span><%=model.NUM7%></span></div>
                </div>
            </div>
        </div>
        <a href="javascript;" onclick="movePage();">next</a>
    </div>
    <script>

    </script>
</asp:Content>
