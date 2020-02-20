<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gyunbox40.Vue.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-login">
        <div class="section section-0">
            {{ message }}
            <h2>또그램 회원 로그인</h2>
            <div class="box-login">
                <input type="text" id="userId" class="txt_wide txt_gray" placeholder="아이디 입력" />
                <input type="text" id="userPwd" class="txt_wide txt_gray" placeholder="비밀번호 입력" />
                <span class="sp_auto">
                    <input type="checkbox" id="cb_autoLogin">자동 로그인</span>
                <span><a id="btn_login" class="btn_wide btn_black" onclick="javascript:alert('로그인');">로그인</a></span>
                <div class="box_findId">
                    <ul>
                        <li><a onclick="javascript:alert('준비중입니다.');">아이디 찾기</a></li>
                        <li><a onclick="javascript:alert('준비중입니다.');;">비밀번호 찾기</a></li>
                        <li class="last"><a href="Join.aspx">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script>
        var app = new Vue({
            el: '#app',
            data: {
                message: '회원가입을 통해서 나의 번호를 따로 관리해보세요!'
            }
        })
    </script>
    <style>
        

        
    </style>
</asp:Content>
