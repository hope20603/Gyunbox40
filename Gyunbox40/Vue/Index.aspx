<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Gyunbox40.Vue.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-index">
        <div class="section section-0">
            {{ message }}
        </div>
        <div class="section section-1">
            <div class="box-1"><a href="CreateNumber.aspx">번호 생성</a></div>
            <div class="box-2"><a href="ManageNumber.aspx">내 번호관리</a></div>
        </div>
        <div class="section section-2">
            <h2>행운번호</h2>
            <ul>
                <li>
                    <span>1</span>
                    <span>2</span>
                    <span>3</span>
                    <span>4</span>
                    <span>5</span>
                    <span>6</span>
                    <span>7</span>
                    <span class="last">8</span>
                </li>
            </ul>
        </div>
        <div class="section section-3">
            <h2>지난당첨번호</h2>
             <ul>
                <li>
                    <span>1</span>
                    <span>2</span>
                    <span>3</span>
                    <span>4</span>
                    <span>5</span>
                    <span>6</span>
                    <span>7</span>
                    <span class="last">8</span>
                </li>
            </ul>
        </div>
        <div class="section section-4">광고</div>
    </div>
    <script>
        var app = new Vue({
            el: '#app',
            data: {
                message: '나의 로또 일상을 저장하는 로"또그램\"'
            }
        })
    </script>
    <style>
        

        
    </style>
</asp:Content>
