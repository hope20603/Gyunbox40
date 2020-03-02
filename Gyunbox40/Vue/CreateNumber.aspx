﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="CreateNumber.aspx.cs" Inherits="Gyunbox40.Vue.CreateNumber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-createNumber">
        <div class="section section-0">
            <h2 style="width: 100%; text-align: center;">{{ message }}</h2>
            <ul>
                <li>
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
            <h2>내가 만든 번호</h2>
            <ul>
                <li>
                    <div class="ball_wrap">
                        <ul>
                            <li v-for="(item, index) in createdNumbers">
                                <span class="createdDate">{{ item.createdDate }}</span>
                                <span class="lottoBall ball_1" v-bind:style="styleA"><span class="ball_con">{{ item.number_1 }}</span></span>
                                <span class="lottoBall ball_2" v-bind:style="styleB"><span class="ball_con">{{ item.number_2 }}</span></span>
                                <span class="lottoBall ball_3" v-bind:style="styleC"><span class="ball_con">{{ item.number_3 }}</span></span>
                                <span class="lottoBall ball_4" v-bind:style="styleD"><span class="ball_con">{{ item.number_4 }}</span></span>
                                <span class="lottoBall ball_5" v-bind:style="styleE"><span class="ball_con">{{ item.number_5 }}</span></span>
                                <span class="lottoBall ball_6" v-bind:style="styleF"><span class="ball_con">{{ item.number_6 }}</span></span>
                                <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                                <span class="last lottoBall ball_7" v-bind:style="styleG"><span class="ball_con">{{ item.number_7 }}</span></span>
                                <a @click=deleteNumber(index) title="삭제"><span class="lottoBall btn_del"></span></a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="section section-4">
            <li v-for="item in fixedNumbers">
                {{ item }}
            </li>
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

                luckyNumbers: [
                    { l_num: 1, class: "" },
                    { l_num: 2, class: "" },
                    { l_num: 3, class: "" },
                    { l_num: 4, class: "" },
                    { l_num: 5, class: "" },
                    { l_num: 6, class: "" },
                    { l_num: 7, class: "" }
                ],

                createdNumbers: [
                    //{
                    //    createdDate: getToday(),
                    //    number_1: 0,
                    //    number_2: 0,
                    //    number_3: 0,
                    //    number_4: 0,
                    //    number_5: 0,
                    //    number_6: 0,
                    //    number_7: 0
                    //}
                ],

                fixedNumbers : [],

                isActive: false
            },
            created() {
                this.setLuckyNumber();
                this.createLuckyNumber();
            },
            methods: {
                setLuckyNumber() {
                    var arrLucky = [1, 10, 11, 21, 31, 41, 45];
                    for (var i = 0; i < arrLucky.length; i++) {
                        this.luckyNumbers[i].l_num = arrLucky[i];
                        this.luckyNumbers[i].class = this.getBallColor(arrLucky[i]);
                        console.log(this.luckyNumbers[i]);
                    }
                },
                getBallColor(ballNum) {
                    if (ballNum < 10) {
                        return "ball_color-1";
                    } else if (ballNum < 20) {
                        return "ball_color-2";
                    } else if (ballNum < 30) {
                        return "ball_color-3";
                    } else if (ballNum < 40) {
                        return "ball_color-4";
                    } else {
                        return "ball_color-5";
                    }
                },
                createLuckyNumber() {
                    let newNumber =
                    {
                        createdDate: getToday(),
                        number_1: 1,
                        number_2: 2,
                        number_3: 3,
                        number_4: 4,
                        number_5: 5,
                        number_6: 6,
                        number_7: 7
                    };

                    this.createdNumbers.push(newNumber);
                    //Db에 axios로 고정된 번호를 서버로 전송함.
                    //서버에서 랜덤번호 생성 후 로그인이 되어 있는 상태면 생성된 번호를 DB에 해당 아이디와 함께 저장함.
                    //고정된 번호가 없으면 그냥 랜덤으로 번호 생성함..
                    //이미 리스트에 있는 번호가 생성되는 경우도 있을듯...
                    //로그인이 되어 있지 않은 상태면 생성된 번호를 list에만 추가해주고 새로고침할 경우 모두 사라짐
                },
                deleteNumber(index) {
                    this.createdNumbers.splice(index, 1);
                    //로그인이 되어 있는 경우 - axios로 해당번호의 정보를 전송해서 DB에서 삭제함
                    //로그인이 되어 있지 않은 경우 - 뷰리스트에서만 삭제함 ( 리스트 뿌릴때 이미 로그인 된 경우와 아닌 경우를 구분해서 뿌려야 함... )
                },
                fixNumber(fixedNumber) {
                    if (this.fixedNumbers.indexOf(fixedNumber) > -1) {
                        this.fixedNumbers.splice(this.fixedNumbers.indexOf(fixedNumber), 1);
                    } else {
                        this.fixedNumbers.push(fixedNumber);
                    }
                },
                toggleClass(index) {
                    this.luckyNumbers[index].class = (this.luckyNumbers[index].class.indexOf("active") > -1) ? this.luckyNumbers[index].class.replace(" active", "") : this.luckyNumbers[index].class + " active";
                }
            }
        })
    </script>
    <style>
        

        
    </style>
</asp:Content>
