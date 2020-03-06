<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Join.aspx.cs" Inherits="Gyunbox40.Vue.Join" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-join">
        <div class="section section-0">
            <span style="color: #176D64; padding-left:7px; font-weight: bold; font-size: 15pt; height:30px; line-height:30px; ">환영합니다!!</span><br />
            <span style=" padding-left:7px;">회원가입을 통해서 나의 번호를 따로 관리해보세요  :)</span>
        </div>
        <div class="section section-1">
            <h2>또그램 회원가입</h2>
            <div class="box-join">
                <ul>
                    <li>
                        <input type="text" v-model="userId"  class="txt_wide txt_gray" placeholder="아이디(이메일 주소)" />
                        <a id="btn_userIdChk" class="btn_mid btn_black" @click="clickBtn">중복확인</a>
                        <input type="hidden" v-model="dupeChk" />
                    </li>
                    <li>
                        <input type="text" v-model="userPwd" class="txt_wide txt_gray" placeholder="비밀번호 입력" /></li>
                    <li>
                        <input type="password"  v-model="userPwdAgain"  class="txt_wide txt_gray" placeholder="비밀번호 재입력" /></li>
                    <li>
                        <input type="text" v-model="userEml" class="txt_wide txt_gray" placeholder="비상용 이메일 주소 ( 비밀번호 찾기에 사용됩니다 )" /></li>
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
                setDupe(val) {
                    this.dupeChk = val;
                },

                clickBtn() {
                    if (this.userId == "") {
                        alert("사용할 아이디를 입력해주세요.");
                    } else {
                        let reqUrl = "http://<%=hostString%>/DDoService.asmx/CheckUserId?";
                        let params = "uid=" + this.userId;

                        axios({
                            method: 'GET',
                            url: reqUrl + params
                        }).then((response) => {
                            if (response.data == "OKK") {
                                alert("사용가능한 아이디입니다 :)");
                                this.setDupe("Y");
                            } else {
                                alert("사용중인 아이디입니다 :(");
                                this.userId = "";
                                this.setDupe("N");
                            }
                        }).catch((ex) => {
                            console.log("ERR!!!!! : ", ex)
                        });

                    }
                },

                register() {

                    if (this.dupeChk == "N") {
                        alert("아이디 중복체크를 해주세요 :)");
                    } else if (this.userPwd == "" || this.userPwdAgain == "") {
                        alert("비밀번호를 입력해주세요 :)");
                    } else if (this.userPwd != this.userPwdAgain) {
                        alert("입력하신 비밀번호가 서로 다릅니다 :(");
                    } else if (this.userEml == "") {
                        alert("이메일 주소를 입력해주세요 :)");
                    } else {
                        let config = {
                            //headers: {
                            //    "x-api-key": "YOUR_API_KEY"
                            //}
                        }
                        let reqUrl = "http://<%=hostString%>/DDoService.asmx/UserRegister";
                        let form = new FormData();
                        form.append('userId', this.userId);
                        form.append('userPwd', this.userPwd);
                        form.append('userEml', this.userEml);

                        axios.post(reqUrl, form, config)
                            .then((response) => {
                                if (response.data == "OKK") {
                                    alert("또그램 회원이 되신것을 환영합니다.\n좋아하는 번호를 저장해두고 관리하세요!");
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
        }
    </style>
</asp:Content>
