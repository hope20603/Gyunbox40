<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="Gyunbox40.Views.DevHome.Board.Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <asp:Button ID="btnList" runat="server" Text="목록" OnClick="btnList_Click"  />
        <asp:Button ID="btnModify" runat="server" Text="수정" OnClick="btnModify_Click" />
        <asp:Button ID="btnDelete" runat="server" Text="삭제" OnClick="btnDelete_Click" />
        <asp:Literal ID="ltl_Content" runat="server"></asp:Literal>
    </form>
</asp:Content>
