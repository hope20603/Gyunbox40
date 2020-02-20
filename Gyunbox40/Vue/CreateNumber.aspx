<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="CreateNumber.aspx.cs" Inherits="Gyunbox40.Vue.CreateNumber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-createNumber">
        <div class="section section-0">
            <h2>{{ message }}</h2>
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
        <div class="section section-1">
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
        <div class="section section-2">
            <span><a onclick="javascript:alert('test');">번호생성</a></span>
        </div>
        <div class="section section-3">
            <h2>내가 만든 번호</h2>
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
                message: '고정할 번호를 선택하세요.'
            }
        })
    </script>
    <style>
        

        
    </style>
</asp:Content>
