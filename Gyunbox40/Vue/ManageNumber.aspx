<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="ManageNumber.aspx.cs" Inherits="Gyunbox40.Vue.ManageNumber" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="app" class="app-manageNumber">
        <div class="section section-0">
            {{ message }}
        </div>
        <div class="section section-1">
            <h2>행운번호</h2>
            <ul>
                <li>
                    <span class="lottoBall">1</span>
                    <span class="lottoBall">2</span>
                    <span class="lottoBall">3</span>
                    <span class="lottoBall">4</span>
                    <span class="lottoBall">5</span>
                    <span class="lottoBall">6</span>
                    <span class="lottoBall">7</span>
                    <span class="last lottoBall">8</span>
                </li>
            </ul>
            <ul>
                <li>
                    <span class="lottoBall">1</span>
                    <span class="lottoBall">2</span>
                    <span class="lottoBall">3</span>
                    <span class="lottoBall">4</span>
                    <span class="lottoBall">5</span>
                    <span class="lottoBall">6</span>
                    <span class="lottoBall">7</span>
                    <span class="last lottoBall">8</span>
                </li>
            </ul>
            <ul>
                <li>
                    <span class="lottoBall">1</span>
                    <span class="lottoBall">2</span>
                    <span class="lottoBall">3</span>
                    <span class="lottoBall">4</span>
                    <span class="lottoBall">5</span>
                    <span class="lottoBall">6</span>
                    <span class="lottoBall">7</span>
                    <span class="last lottoBall">8</span>
                </li>
            </ul>
            <ul>
                <li>
                    <span class="lottoBall">1</span>
                    <span class="lottoBall">2</span>
                    <span class="lottoBall">3</span>
                    <span class="lottoBall">4</span>
                    <span class="lottoBall">5</span>
                    <span class="lottoBall">6</span>
                    <span class="lottoBall">7</span>
                    <span class="last lottoBall">8</span>
                </li>
            </ul>
        </div>
        <div class="section section-4">광고</div>
    </div>
    <script>
        var app = new Vue({
            el: '#app',
            data: {
                message: '내가 좋아하는 번호들을 관리하세요.\n이번엔 당첨 될 수도 있습니다!!'
            }
        })
    </script>
    <style>
        

        
    </style>
</asp:Content>
