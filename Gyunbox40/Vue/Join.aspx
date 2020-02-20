<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Join.aspx.cs" Inherits="Gyunbox40.Vue.Join" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-join">
        <div class="section section-0">
            <p>회원가입을 통해서 나의 번호를 따로 관리해보세요!</p>
            <h2>또그램 회원가입</h2>
            <div class="box-join">
                <ul>
                    <li>
                        <input type="text"  id="userId" v-model="userId"  class="txt_wide txt_gray" placeholder="아이디(이메일 주소)"/>
                        <input type="hidden" id="hid_chk" v-model="hid_chk" value="N" />
                        <%--<a id="btn_userIdChk" class="btn_mid btn_black" onclick="javascript:alert('중복확인');">중복확인</a>--%>
                        <a id="btn_userIdChk" class="btn_mid btn_black" v-on:click="clickBtn">중복확인</a>
                    </li>
                    <li>
                        <input type="text" id="userPwd" v-model="userPwd" class="txt_wide txt_gray" placeholder="비밀번호 입력" /></li>
                    <li>
                        <input type="text" id="userPwdChk" class="txt_wide txt_gray" placeholder="비밀번호 재입력" /></li>
                    <li>
                        <input type="text" id="userEml" v-model="userEml" class="txt_wide txt_gray" placeholder="비상용 이메일 주소 ( 비밀번호 찾기에 사용됩니다 )" /></li>
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
        new Vue({
            el: '#app',
            data() {
                return {
                    userId: '',
                    userPwd: '',
                    userEml: ''

                }
            },
            methods: {
                clickBtn() {
                    let reqUrl = "http://localhost:11111/DDoService.asmx/CheckUserId?";
                    let params = "uid=" + document.getElementById("userId").value;
                    
                    axios.get(reqUrl + params)
                        .then(function (response) {
                            if (response.data == "OKK") {
                                alert("사용가능한 아이디입니다.");
                                this.hid_chk.value = "Y";
                            } else {
                                alert("사용중인 아이디입니다.");
                                this.userId.value = "";
                                this.hid_chk.value = "N";
                            }
                        });
                },
                register() {
                    let config = {
                        //headers: {
                        //    "x-api-key": "YOUR_API_KEY"
                        //}
                    }
                    let reqUrl = "http://localhost:11111/DDoService.asmx/UserRegister";
                    
                    //validation check
                    var registerData = ""; 
                    registerData = registerData + "userId=" + document.getElementById("userId").value;
                    registerData = registerData + "&userPwd=" + document.getElementById("userPwd").value;
                    registerData = registerData + "&userEml=" + document.getElementById("userEml").value;

                    console.log(registerData)

                    axios.post(reqUrl, registerData, config).then((response) => {
                        if (response.data == "OKK") {
                            alert("또그램 회원이 되신것을 환영합니다.\n좋아하는 번호를 저장해두고 관리하세요!");
                            location.href = "ManageNumber.aspx";
                        } else {
                            alert("죄송합니다.\n가입중 문제가 생겼습니다.\n다시한번 시도해주세요.");
                            location.href = "Join.aspx";
                        }
                    })

                    
                }
            }
        })
    </script>
    <style>
        

        
    </style>
</asp:Content>
