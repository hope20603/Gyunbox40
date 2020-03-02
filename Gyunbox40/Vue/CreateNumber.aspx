<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="CreateNumber.aspx.cs" Inherits="Gyunbox40.Vue.CreateNumber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-createNumber">
        <div class="section section-0">
            <h2 style="width: 100%; text-align: center;">{{ message }}</h2>
            <ul>
                <li>
                    <div class="ball_wrap" id="recommendNumber">
                        
                            <span  v-for="(item, index) in fixedNumbers" class="lottoBall ball_1" v-bind:class=item.class @click=toggleClass(index)>
                                <span class="ball_con" >{{ item.l_num }}</span>
                            </span>
                        
                        <%--<span class="lottoBall ball_1" id="ball_1"  @click="fixNumber(drwtNo1, styleA)" v-bind:style="styleA" :class="{ active: isActive }"><span class="ball_con">{{ drwtNo1 }}</span></span>
                        <span class="lottoBall ball_2" id="ball_2"  @click="fixNumber(drwtNo2, ball_2)" v-bind:style="styleB" :class="{ active: isActive }"><span class="ball_con">{{ drwtNo2 }}</span></span>
                        <span class="lottoBall ball_3" id="ball_3"  @click="fixNumber(drwtNo3, ball_3)" v-bind:style="styleC" :class="{ active: isActive }"><span class="ball_con">{{ drwtNo3 }}</span></span>
                        <span class="lottoBall ball_4" id="ball_4"  @click="fixNumber(drwtNo4, ball_4)" v-bind:style="styleD" :class="{ active: isActive }"><span class="ball_con">{{ drwtNo4 }}</span></span>
                        <span class="lottoBall ball_5" id="ball_5"  @click="fixNumber(drwtNo5, ball_5)" v-bind:style="styleE" :class="{ active: isActive }"><span class="ball_con">{{ drwtNo5 }}</span></span>
                        <span class="lottoBall ball_6" id="ball_6"  @click="fixNumber(drwtNo6, ball_6)" v-bind:style="styleF" :class="{ active: isActive }"><span class="ball_con">{{ drwtNo6 }}</span></span>
                        <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                        <span class="last lottoBall ball_7" id="ball_7" @click="fixNumber(drwtNo7 , ball_7)" v-bind:style="styleG"  :class="{ active: isActive }"><span class="ball_con">{{ drwtNo7 }}</span></span>--%>
                        
                    </div>
                </li>
                <li style="width: 100%; margin-top: 10px; padding-right: 20px; box-sizing: border-box;">
                    <span class="btn_green btn_small" style="float: right;">
                        <%--<a onclick="javascript:alert('test');">번호생성</a>--%>
                        <a @click="createLuckyNumber">번호생성</a>
                    </span>
                </li>
            </ul>
        </div>
        <div class="section section-2">
            <h2>내가 만든 번호</h2>
            <ul>
                <li>
                    <div class="ball_wrap">
                        <ul>
                            <li>
                                <span class="createdDate">2019-01-01</span>
                                <span class="lottoBall ball_1" v-bind:style="styleA"><span class="ball_con">{{ drwtNo1 }}</span></span>
                                <span class="lottoBall ball_2" v-bind:style="styleB"><span class="ball_con">{{ drwtNo2 }}</span></span>
                                <span class="lottoBall ball_3" v-bind:style="styleC"><span class="ball_con">{{ drwtNo3 }}</span></span>
                                <span class="lottoBall ball_4" v-bind:style="styleD"><span class="ball_con">{{ drwtNo4 }}</span></span>
                                <span class="lottoBall ball_5" v-bind:style="styleE"><span class="ball_con">{{ drwtNo5 }}</span></span>
                                <span class="lottoBall ball_6" v-bind:style="styleF"><span class="ball_con">{{ drwtNo6 }}</span></span>
                                <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                                <span class="last lottoBall ball_7" v-bind:style="styleG"><span class="ball_con">{{ drwtNo7 }}</span></span>
                                <a onclick="javascript:alert('삭제');" title="삭제"><span class="lottoBall btn_del"></span></a>
                            </li>
                            <li class="li_devider"></li>
                            <li>
                                <span class="createdDate">2019-01-02</span>
                                <span class="lottoBall ball_1" v-bind:style="styleA"><span class="ball_con">{{ drwtNo1 }}</span></span>
                                <span class="lottoBall ball_2" v-bind:style="styleB"><span class="ball_con">{{ drwtNo2 }}</span></span>
                                <span class="lottoBall ball_3" v-bind:style="styleC"><span class="ball_con">{{ drwtNo3 }}</span></span>
                                <span class="lottoBall ball_4" v-bind:style="styleD"><span class="ball_con">{{ drwtNo4 }}</span></span>
                                <span class="lottoBall ball_5" v-bind:style="styleE"><span class="ball_con">{{ drwtNo5 }}</span></span>
                                <span class="lottoBall ball_6" v-bind:style="styleF"><span class="ball_con">{{ drwtNo6 }}</span></span>
                                <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                                <span class="last lottoBall ball_7" v-bind:style="styleG"><span class="ball_con">{{ drwtNo7 }}</span></span>
                                <a onclick="javascript:alert('삭제');" title="삭제"><span class="lottoBall btn_del"></span></a>
                            </li>
                            <li class="li_devider"></li>
                            <li>
                                <span class="createdDate">2019-01-02</span>
                                <span class="lottoBall ball_1" v-bind:style="styleA"><span class="ball_con">{{ drwtNo1 }}</span></span>
                                <span class="lottoBall ball_2" v-bind:style="styleB"><span class="ball_con">{{ drwtNo2 }}</span></span>
                                <span class="lottoBall ball_3" v-bind:style="styleC"><span class="ball_con">{{ drwtNo3 }}</span></span>
                                <span class="lottoBall ball_4" v-bind:style="styleD"><span class="ball_con">{{ drwtNo4 }}</span></span>
                                <span class="lottoBall ball_5" v-bind:style="styleE"><span class="ball_con">{{ drwtNo5 }}</span></span>
                                <span class="lottoBall ball_6" v-bind:style="styleF"><span class="ball_con">{{ drwtNo6 }}</span></span>
                                <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                                <span class="last lottoBall ball_7" v-bind:style="styleG"><span class="ball_con">{{ drwtNo7 }}</span></span>
                                <a onclick="javascript:alert('삭제');" title="삭제"><span class="lottoBall btn_del"></span></a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="section section-4">
            <%--<li v-for="fixNumber in fixedNumbers">
                {{ fixNumber }}
            </li>--%>
        </div>
        
    </div>
    <script>
        var app = new Vue({
            el: '#app',
            data: {
                message: '고정할 번호를 선택하세요.',

                //추천행운번호
                drwtNo1: '1',
                drwtNo2: '2',
                drwtNo3: '3',
                drwtNo4: '4',
                drwtNo5: '5',
                drwtNo6: '6',
                drwtNo7: '7',

                //로또볼 색 정의
                styleA: "background-color:#A7A2DE",
                styleB: "background-color:#A7A2DE",
                styleC: "background-color:#A7A2DE",
                styleD: "background-color:#A7A2DE",
                styleE: "background-color:#A7A2DE",
                styleF: "background-color:#A7A2DE",
                styleG: "background-color:#A7A2DE",

                fixedNumbers: [
                    { l_num: 1, class: "" },
                    { l_num: 2, class: "" },
                    { l_num: 3, class: "" },
                    { l_num: 4, class: "" },
                    { l_num: 5, class: "" },
                    { l_num: 6, class: "" },
                    { l_num: 7, class: "" }

                ],
                
                isActive: false
            },
            created() {
                this.setLuckyNumber();
            },
            methods: {
                setLuckyNumber() {
                    console.log("setLuckyNumber");
                    var arrLucky = [1, 10, 11, 21, 31, 41, 45];
                    for (var i = 0; i < arrLucky.length; i++) {
                        this.fixedNumbers[i].l_num = arrLucky[i];
                        if (arrLucky[i] < 10) {
                            this.fixedNumbers[i].class = "ball_color-1";
                        } else if(arrLucky[i] < 20) {
                            this.fixedNumbers[i].class = "ball_color-2";
                        } else if(arrLucky[i] < 30) {
                            this.fixedNumbers[i].class = "ball_color-3";
                        } else if(arrLucky[i] < 40) {
                            this.fixedNumbers[i].class = "ball_color-4";
                        } else {
                            this.fixedNumbers[i].class = "ball_color-5";
                        }
                        console.log(this.fixedNumbers[i]);
                    }
                },
                createLuckyNumber() {
                    console.log("createNumber");
                    //Db에 axios로 고정된 번호를 서버로 전송함.
                    //서버에서 랜덤번호 생성 후 로그인이 되어 있는 상태면 생성된 번호를 DB에 해당 아이디와 함께 저장함.
                    //고정된 번호가 없으면 그냥 랜덤으로 번호 생성함..
                    //이미 리스트에 있는 번호가 생성되는 경우도 있을듯...
                    //로그인이 되어 있지 않은 상태면 생성된 번호를 list에만 추가해주고 새로고침할 경우 모두 사라짐
                },
                deleteMyNumber() {
                    console.log("delteNumber");
                    //로그인이 되어 있는 경우 - axios로 해당번호의 정보를 전송해서 DB에서 삭제함
                    //로그인이 되어 있지 않은 경우 - 뷰리스트에서만 삭제함 ( 리스트 뿌릴때 이미 로그인 된 경우와 아닌 경우를 구분해서 뿌려야 함... )
                },
                fixNumber(fixedNumber) {
                    //중복된 번호는 삭제해줌
                    let idx = this.fixedNumbers.indexOf(fixedNumber);

                    if (idx > -1) {
                        this.fixedNumbers.splice(idx, 1);
                    } else {
                        this.fixedNumbers.push(fixedNumber);
                    }
                },
                toggleClass(index) {
                    this.fixedNumbers[index].class = (this.fixedNumbers[index].class.indexOf("active") > -1) ? this.fixedNumbers[index].class.replace(" active","") : this.fixedNumbers[index].class +" active";
                }
            }
        })
    </script>
    <style>
        

        
    </style>
</asp:Content>
