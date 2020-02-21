<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gyunbox40.Vue.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-login">
        <div class="section section-0">
            회원가입을 통해서 나의 번호를 따로 관리해보세요!
            <h2>또그램 회원 로그인</h2>
            <div class="box-login">
                <input type="text" id="userId" v-model="userId" class="txt_wide txt_gray" placeholder="아이디 입력" />
                <input type="text" id="userPwd" v-model="userPwd" class="txt_wide txt_gray" placeholder="비밀번호 입력" />
                <span class="sp_auto">
                    <input type="checkbox" id="cb_autoLogin">자동 로그인</span>
                <span><a id="btn_login" class="btn_wide btn_black" @click="clickLogin">로그인</a></span>
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
        new Vue({
            el: '#app',
            data: {
                //message: '회원가입을 통해서 나의 번호를 따로 관리해보세요!'
                userId: '',
                userPwd: ''
            },
            methods: {
                clickLogin() {
                    let config = {
                        //headers: {
                        //    "x-api-key": "YOUR_API_KEY"
                        //}
                    }
                    let reqUrl = "http://<%=hostString%>/DDoService.asmx/UserLogin";

                    //validation check
                    var registerData = "";
                    registerData = registerData + "userId=" + document.getElementById("userId").value;
                    registerData = registerData + "&userPwd=" + document.getElementById("userPwd").value;
                    
                    
                    axios.post(reqUrl, registerData, config).then((response) => {
                        if (response.data == "OKK") {
                            alert("어서오세요");
                            location.href = "ManageNumber.aspx";
                        } else {
                            alert("로그인에 실패하였습니다.\n다시 시도해주세요.");
                        }
                    })
                }
            }
        })
    </script>
    <style>
        

        
    </style>
</asp:Content>
