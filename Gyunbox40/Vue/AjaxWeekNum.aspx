<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Ajax.Master" AutoEventWireup="true" CodeBehind="AjaxWeekNum.aspx.cs" Inherits="Gyunbox40.Vue.AjaxWeekNum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="week_wrap">
        <div class="section_title">
            <h2><strong class="round key_clr1" id="lottoDrwNo"><%=model.SEQ%>회</strong> 당첨번호</h2>
            <span class="date" id="drwNoDate"><%=model.WIN_DATE%> 기준</span>
        </div>
        <div class="week_con">
            <a href="javascript:;" onclick="changeWeekAjax(<%=model.PREVNO%>);" class="btn btn_prev">
                <img src="../images/icon/icon-prev.png" alt="이전" />
            </a>
            <div class="con_con">
                <div class="prizeresult">
                    <div class="num clr<%=model.COL1%>"><span><%=model.NUM1%></span></div>
                    <div class="num clr<%=model.COL2%>"><span><%=model.NUM2%></span></div>
                    <div class="num clr<%=model.COL3%>"><span><%=model.NUM3%></span></div>
                    <div class="num clr<%=model.COL4%>"><span><%=model.NUM4%></span></div>
                    <div class="num clr<%=model.COL5%>"><span><%=model.NUM5%></span></div>
                    <div class="num clr<%=model.COL6%>"><span><%=model.NUM6%></span></div>
                    <div class="num bonus clr<%=model.COL7%>"><span><%=model.NUM7%></span></div>
                </div>
            </div>
            <a href="javascript:;" onclick="changeWeekAjax(<%=model.NEXTNO%>);" class="btn btn_next">
                <img src="../images/icon/icon-next.png" alt="다음" />
            </a>
        </div>
    </div>
</asp:Content>
