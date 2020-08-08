<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Join.aspx.cs" Inherits="Gyunbox40.Vue.Join" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-join">
        <div class="section section-0">
            <span style="color: #176D64; padding-left:7px; font-weight: bold; font-size: 15pt; height:30px; line-height:30px; ">환영합니다!!</span><br />
            <span style=" padding-left:7px;">회원가입을 통해서 나의 번호를 따로 관리해보세요  :)</span><br />
            <span style=" padding-left:7px;color:#C00000;">* 민감한 개인정보는 입력하지 말아주세요.</span><br />
            <span style=" padding-left:7px;color:#C00000;">* 이메일 주소는 아이디 찾기에만 사용됩니다.</span>
        </div>
        <div class="section section-1">
            <h2>로또집사 회원가입</h2>
            <div class="box-join">
                <ul>
                    <li>
                        <input type="text" v-model="userId"  class="txt_wide txt_gray" placeholder="아이디" />
                        <a id="btn_userIdChk" class="btn_mid btn_black" @click="clickBtn">중복확인</a>
                        <input type="hidden" v-model="dupeChk" />
                    </li>
                    <li>
                        <input type="password" v-model="userPwd" class="txt_wide txt_gray" placeholder="비밀번호 입력"  style="margin-top:50px;" /></li>
                    <li><input type="password"  v-model="userPwdAgain"  class="txt_wide txt_gray" placeholder="비밀번호 재입력" style="margin-top:10px;"/></li>
                    <li style="margin-top:30px;">* 비상용 이메일은 입력하지 않으셔도 가입가능합니다. <br />&nbsp;&nbsp;다만 패스워드를 잃어버렸을 경우에는 재가입하셔야 합니다.</li>
                    <li><input type="text" v-model="userEml" class="txt_wide txt_gray" placeholder="비상용 이메일 주소 ( 비밀번호 찾기에 사용됩니다 )" style="margin-top:10px;"/></li>
                    <li><span><a id="btn_login" class="btn_wide btn_black" @click="register">회원가입</a></span></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- IE 에러 대비 -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>

        var app = new Vue({
            el: '#app',
            data: {
                userId: '',
                userPwd: '',
                userPwdAgain: '',
                userEml: '',
                dupeChk: 'N'
            },
            methods: {
                setDupe: function (val) {
                    var self = this;
                    self.dupeChk = val;
                },

                clickBtn: function () {
                    var self = this;
                    if (self.userId == "") {
                        alert("사용할 아이디를 입력해주세요.");
                    } else {
                        let reqUrl = "/DDoService.asmx/CheckUserId?";
                        let params = "uid=" + self.userId;

                        axios({
                            method: 'GET',
                            url: reqUrl + params
                        }).then(function(response){
                            if (response.data == "OKK") {
                                alert("사용가능한 아이디입니다 :)");
                                self.setDupe("Y");
                            } else {
                                alert("사용중인 아이디입니다 :(");
                                self.userId = "";
                                self.setDupe("N");
                            }
                        }).catch(function(ex){
                            console.log("ERR!!!!! : ", ex)
                        });

                    }
                },

                register: function() {
                    var self = this;
                    if (self.dupeChk == "N") {
                        alert("아이디 중복체크를 해주세요 :)");
                    } else if (self.userPwd == "" || self.userPwdAgain == "") {
                        alert("비밀번호를 입력해주세요 :)");
                    } else if (self.userPwd != self.userPwdAgain) {
                        alert("입력하신 비밀번호가 서로 다릅니다 :(");
                    }

                    //else if (self.userEml == "") {
                    //    alert("이메일 주소를 입력해주세요 :)");
                    //}

                    else {
                        let config = {
                            //headers: {
                            //    "x-api-key": "YOUR_API_KEY"
                            //}
                        }
                        let reqUrl = "/DDoService.asmx/UserRegister";
                        let form = new FormData();
                        form.append('userId', self.userId);
                        form.append('userPwd', self.userPwd);
                        form.append('userEml', self.userEml);

                        axios.post(reqUrl, form, config)
                            .then(function(response){
                                if (response.data == "OKK") {
                                    alert("로또집사 회원이 되신것을 환영합니다.\n좋아하는 번호를 저장해두고 관리하세요!");
                                    location.href = "ManageNumber.aspx";
                                } else {
                                    alert("죄송합니다.\n가입중 문제가 생겼습니다.\n다시한번 시도해주세요.");
                                    location.href = "Join.aspx";
                                }
                            });
                    }
                }
            }
        })
    </script>
    <style>
        #wrap {
            background-color: #ffffff;
            padding-bottom:50px;
        }
    </style>
</asp:Content>
