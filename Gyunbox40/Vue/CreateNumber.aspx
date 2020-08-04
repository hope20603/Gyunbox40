<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="CreateNumber.aspx.cs" Inherits="Gyunbox40.Vue.CreateNumber" %>
<%@ Import Namespace="Gyunbox40.Common" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-createNumber">
         <div>
            <ins class="kakao_ad_area" style="display:none;" 
 data-ad-unit    = "DAN-qxtvjk0wtmpe" 
 data-ad-width   = "320" 
 data-ad-height  = "100"></ins> 
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>

        </div>
        <div class="section section-0">
            <div style="height:70px;padding-top:10px;">
                <span style="color: #176D64; float:left;  box-sizing:border-box; text-align:center; font-weight: bold; font-size: 15pt; height:30px; line-height:30px; width:100%; ">로또집사가 제공하는 추천번호 :)</span><br />
                <span style="width:100%; box-sizing:border-box; text-align:center; padding-bottom:30px; float:left;">원하는 번호를 선택한 후 번호를 생성해보세요.</span>
            </div>
            <ul  style="width:100%; height:50px;">
                <li  style="background-color:#FCFCFC; border-top:1px solid #EBEBEB; border-bottom:1px solid #EBEBEB; padding-top:20px; padding-bottom:20px;">
                    <div class="ball_wrap" id="recommendNumber">
                            <span  v-for="(item, index) in luckyNumbers" class="lottoBall ball_1" v-bind:class=item.class @click="toggleClass(index);fixNumber(item.l_num);">
                                <span class="ball_con">{{ item.l_num }}</span>
                            </span>
                    </div>
                </li>
                <li style="width: 100%; margin-top: 10px; padding-right: 20px; box-sizing: border-box;">
                    <span class="btn_green btn_small" style="float: right;">
                        <a @click="createLuckyNumber">번호생성</a>
                    </span>
                </li>
            </ul>
        </div>
        <div class="section section-2">
            <h2 style="text-align:center;">내가 만든 번호 <span>[ {{ this.createdNumbers.length }} ] 개</span></h2>
            <ul>
                <li>
                    <div class="ball_wrap">
                        <ul>
                            <li v-for="(item, index) in createdNumbers">
                                <%--<span class="createdDate">{{ item.createdDate }}</span>--%>
                                <span class="lottoBall ball_1" v-bind:class="getClass( item.number_1)"><span class="ball_con">{{ item.number_1 }}</span></span>
                                <span class="lottoBall ball_2" v-bind:class="getClass( item.number_2)"><span class="ball_con">{{ item.number_2 }}</span></span>
                                <span class="lottoBall ball_3" v-bind:class="getClass( item.number_3)"><span class="ball_con">{{ item.number_3 }}</span></span>
                                <span class="lottoBall ball_4" v-bind:class="getClass( item.number_4)"><span class="ball_con">{{ item.number_4 }}</span></span>
                                <span class="lottoBall ball_5" v-bind:class="getClass( item.number_5)"><span class="ball_con">{{ item.number_5 }}</span></span>
                                <span class="lottoBall ball_6" v-bind:class="getClass( item.number_6)"><span class="ball_con">{{ item.number_6 }}</span></span>
                                <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                                <span class="last lottoBall ball_7" v-bind:class="getClass( item.number_7)"><span class="ball_con">{{ item.number_7 }}</span></span>
                                <a @click=deleteNumber(index) title="삭제"><span class="lottoBall btn_del"></span></a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="section section-4">
            <!-- 로그인 된 상태에서만 저장버튼 노출 -->
            <div class="btn_wide btn_red" style="width:49%; float:left;"  @click="deleteNumberList();">
                모두 삭제
            </div>
            <div class="btn_wide btn_black" style="width:49%; float:right;" @click="saveNumberList();">
                내 번호로 저장
            </div>
            <div class="btn_wide btn_green" style="margin-top:20px;" @click="goManage();">
                내가 저장한 번호 보기
            </div>
        </div>
        <div class="section">
            <ins class="kakao_ad_area" style="display:none;" 
 data-ad-unit    = "DAN-s16362oxdjqx" 
 data-ad-width   = "320" 
 data-ad-height  = "100"></ins> 
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
        </div>
        <div class="hidden-place">
            <input type="text" value="<%=IsLogin%>" ref="isLogin" />
        </div>
    </div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
        var app = new Vue({
            el: '#app',
            data: {
                //message: '고정할 번호를 선택하세요.',

                luckyNumbers: [
                    { l_num: 1, class: "" },
                    { l_num: 2, class: "" },
                    { l_num: 3, class: "" },
                    { l_num: 4, class: "" },
                    { l_num: 5, class: "" },
                    { l_num: 6, class: "" },
                    { l_num: 7, class: "" }
                ],

                createdNumbers: [],

                fixedNumbers : []
            },
            created: function() {
                this.setLuckyNumber();
                //this.createLuckyNumber();
            },
            mounted: function(){
                $(document).ready(function () {
                    $("#recommendNumber .lottoBall").click(function () {
                        if ($(this).attr("class").indexOf("active") < 0) {
                            $(this).animate({ marginTop: "-10px" }, 300);
                            $(this).addClass("active");
                        } else {
                            $(this).animate({ marginTop: "0px" }, 300);
                            $(this).removeClass("active");
                        }

                        //$(this).animate({
                        //    
                        //}, 5000, function () {
                        //    // Animation complete.
                        //});
                    });
                });
            },
            methods: {
                setLuckyNumber: function() {
                    var arrLucky = [<%=datas[0]%> ,<%=datas[1]%> ,<%=datas[2]%> ,<%=datas[3]%> ,<%=datas[4]%> ,<%=datas[5]%> ,<%=datas[6]%> ];
                    for (var i = 0; i < arrLucky.length; i++) {
                        this.luckyNumbers[i].l_num = arrLucky[i];
                        this.luckyNumbers[i].class = this.getBallColor(arrLucky[i]);
                        //console.log(this.luckyNumbers[i]);
                    }
                },
                getClass: function (ballNumber) {
                    return this.getBallColor(ballNumber);

                },
                getBallColor: function (ballNum) {
                    if (ballNum <= 10) {
                        return "ball_color-1";
                    } else if (ballNum <= 20) {
                        return "ball_color-2";
                    } else if (ballNum <= 30) {
                        return "ball_color-3";
                    } else if (ballNum <= 40) {
                        return "ball_color-4";
                    } else {
                        return "ball_color-5";
                    }
                },
                createLuckyNumber: function() {
                    let newNumber =
                    {
                        createdDate: getToday(),
                        number_1: "",
                        number_2: "",
                        number_3: "",
                        number_4: "",
                        number_5: "",
                        number_6: "",
                        number_7: ""
                    };

                    let jsonArr = JSON.stringify({ pArrParams: this.fixedNumbers });
                    //console.log(jsonArr);
                    //let reqUrl = "http://<%=(new CommonController()).hostString%>/DDoService.asmx/GetNewNumber";
                    let reqUrl = "/DDoService.asmx/GetNewNumber";
                    //let reqUrl = "http://<%=(new CommonController()).hostString%>/DDoService.asmx/UserLogin";
                    //console.log(reqUrl);

                    axios({
                        url: reqUrl,
                        method: 'post',
                        data: jsonArr
                    }).then(function (response) {
                        if (response.data.length == 7) {
                            for (let i = 0; i < 7; i++) {
                                eval("newNumber.number_" + (i + 1) + "=response.data[" + i + "];");
                            }
                        }
                    });

                    this.createdNumbers.push(newNumber);

                    //axios.post(reqUrl, {
                    //    data: jsonArr
                    //}).then(function (response) {
                    //    console.log(response);
                    //});
                    
                    //Db에 axios로 고정된 번호를 서버로 전송함.
                    //고정된 번호가 없으면 그냥 랜덤으로 번호 생성함..
                    //이미 리스트에 있는 번호가 생성되는 경우도 있을듯...
                    //로그인이 되어 있지 않은 상태면 생성된 번호를 list에만 추가해주고 새로고침할 경우 모두 사라짐
                },
                deleteNumber: function (index) {
                    this.createdNumbers.splice(index, 1);
                    //로그인이 되어 있는 경우 - axios로 해당번호의 정보를 전송해서 DB에서 삭제함
                    //로그인이 되어 있지 않은 경우 - 뷰리스트에서만 삭제함 ( 리스트 뿌릴때 이미 로그인 된 경우와 아닌 경우를 구분해서 뿌려야 함... )
                },
                fixNumber: function (fixedNumber) {
                    if (this.fixedNumbers.indexOf(fixedNumber) > -1) {
                        this.fixedNumbers.splice(this.fixedNumbers.indexOf(fixedNumber), 1);
                    } else {
                        this.fixedNumbers.push(fixedNumber);
                    }
                },
                toggleClass: function (index) {
                    //this.luckyNumbers[index].class = (this.luckyNumbers[index].class.indexOf("active") > -1) ? this.luckyNumbers[index].class.replace(" active", "") : this.luckyNumbers[index].class + " active";
                },
                saveNumberList: function () {
                    
                    //1. 로그인 체크
                    
                    if (this.$refs.isLogin.value == "N") {
                        alert("로그인 후 이용해주세요!!");
                    } else {
                        //2. 로그인이 되어 있는 경우, 해당아이디로 로또번호 저장
                        let jsonSaveArr = JSON.stringify({ pArrParams: this.createdNumbers });
                        let reqSaveUrl = "/DDoService.asmx/SaveNewNumbers";

                        axios({
                            url: reqSaveUrl,
                            method: 'post',
                            data: jsonSaveArr
                        }).then(function (response) {
                            if (response.data.Result == "OKK") {
                                alert(response.data.OkCount + "개가 저장되었습니다.");
                                location.reload();
                            } else {
                                alert("저장 중 문제가 발생하였습니다.\n다시한번 시도해주세요.");
                            }
                        });
                    }
                },
                deleteNumberList: function () {
                    this.createdNumbers = [];
                },
                goManage: function () {
                    if (this.createdNumbers.length > 0) {
                        if (confirm("저장하지 않은 번호들은 모두 삭제됩니다.\n이동 하시겠습니까?")) {
                            location.href = "ManageNumber.aspx";
                        }
                    } else {
                        location.href = "ManageNumber.aspx";
                    }
                }
            }
        })
    </script>
</asp:Content>
