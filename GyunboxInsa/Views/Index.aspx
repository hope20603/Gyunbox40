<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="GyunboxInsa.Views.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:Label ID="lbl_1" runat="server">Label1</asp:Label></asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="lbl_2" runat="server">Label2</asp:Label></asp:View>
        <asp:View ID="View3" runat="server">
            <asp:Label ID="lbl_3" runat="server">Label3</asp:Label></asp:View>
    </asp:MultiView>
</asp:Content>
