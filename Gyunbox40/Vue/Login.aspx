<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gyunbox40.Vue.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-login">
        <div class="section section-0">
            <span style="color: #176D64; padding-left:7px; font-weight: bold; font-size: 15pt; height:30px; line-height:30px; ">로그인 해주세요.</span><br />
            <span style=" padding-left:7px;">로그인 후 나의 번호를 관리해보세요!!</span>
        </div>
        <div class="section section-1">
            <h2>로또집사 회원 로그인</h2>
            <div class="box-login">
                <input type="text" id="userId" v-model="userId" class="txt_wide txt_gray" placeholder="아이디 입력" />
                <input type="password" id="userPwd" v-model="userPwd" class="txt_wide txt_gray" placeholder="비밀번호 입력" />
                <span><a id="btn_login" class="btn_wide btn_black" @click="clickLogin" style="margin-top:30px;">로그인</a></span>
                <span><a id="btn_test_login" class="btn_wide btn_green" @click="guestLogin" style="margin-top:20px;">게스트 로그인</a></span>
            </div>
        </div>
    </div>
<!-- IE 에러 대비 -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
        new Vue({
            el: '#app',
            data: {
                //message: '회원가입을 통해서 나의 번호를 따로 관리해보세요!'
                userId: '',
                userPwd: ''
                
            },
            methods: {
                clickLogin: function () {
                    var self = this;
                    let config = {
                        //headers: {
                        //    "x-api-key": "YOUR_API_KEY"
                        //}
                    }

                    if (self.userId == "" || self.userPwd == "") {
                        alert("아이디 또는 패스워드를 다시 입력해주세요.");
                    } else {
                        let reqUrl = "/DDoService.asmx/UserLogin";
                        let form = new FormData();
                        form.append('userId', self.userId);
                        form.append('userPwd', self.userPwd);

                        axios.post(reqUrl, form, config)
                            .then(function(response) {
                                if (response.data == "OKK") {
                                    alert("어서오세요");
                                    location.href = "ManageNumber.aspx";
                                } else {
                                    alert("로그인에 실패하였습니다.\n다시 시도해주세요.");
                                }
                            });
                    }
                },
                guestLogin:function() {
                    this.userId = "GUEST";
                    this.userPwd = "1004";
                    this.clickLogin();
                }
            }
        })
    </script>
    <style>
        
        #wrap{
            background-color:#ffffff;
            padding-bottom:60px;
        }
        
    </style>
</asp:Content>
