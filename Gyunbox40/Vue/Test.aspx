<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Gyunbox40.Vue.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app">
        <div class="section section-3">
            <h2 style="width: 100%; text-align: center; padding-bottom: 30px;">
                <span style="color: #B40000; font-size: 15pt;">{{ message }}회 </span><span style="color: #514856; font-size: 15pt;">당첨결과</span>
                <span style="width: 100%; line-height: 20px; float: left; font-size: 10pt; color: #A5A5A5; height: 20px; margin-top: -5px;">( {{ nowDate }}일 추첨 )</span>
            </h2>
            <ul>
                <li>
                    <div class="ball_wrap">
                        <span class="lottoBall ball_1" v-bind:style="pre_styleA"><span class="ball_con">{{ pre_drwtNo1 }}</span></span>
                        <span class="lottoBall ball_2" v-bind:style="pre_styleB"><span class="ball_con">{{ pre_drwtNo2 }}</span></span>
                        <span class="lottoBall ball_3" v-bind:style="pre_styleC"><span class="ball_con">{{ pre_drwtNo3 }}</span></span>
                        <span class="lottoBall ball_4" v-bind:style="pre_styleD"><span class="ball_con">{{ pre_drwtNo4 }}</span></span>
                        <span class="lottoBall ball_5" v-bind:style="pre_styleE"><span class="ball_con">{{ pre_drwtNo5 }}</span></span>
                        <span class="lottoBall ball_6" v-bind:style="pre_styleF"><span class="ball_con">{{ pre_drwtNo6 }}</span></span>
                        <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                        <span class="last lottoBall ball_7" v-bind:style="pre_styleG"><span class="ball_con">{{ pre_drwtNo7 }}</span></span>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script src="../lib/vue/vue.js"></script>
    <script src="../lib/axios/axios.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.min.js"></script>
    <script>
        var app = new Vue({
            el: '#app',
            data: {
                message: "test",
                nowNumber: 1,
                nowDate: 2,
                pre_drwtNo1: 3,
                pre_drwtNo2: 4,
                pre_drwtNo3: 5,
                pre_drwtNo4: 6,
                pre_drwtNo5: 7,
                pre_drwtNo6: 8,
                pre_drwtNo7: 9,
                pre_styleA: "background-color:#ffffff",
                pre_styleB: "background-color:#ffffff",
                pre_styleC: "background-color:#ffffff",
                pre_styleD: "background-color:#ffffff",
                pre_styleE: "background-color:#ffffff",
                pre_styleF: "background-color:#ffffff",
                pre_styleG: "background-color:#ffffff"

            },
            created: function() {
                //this.setMessage();
            },
            mounted: function () {
                this.getPreLuckyNumber();
            },
            methods: {
                setMessage: function (responseData) {
                    console.log(responseData);
                    //this.message = "testtest";
                    //    this.pre_drwtNo1 = response.data.drwtNo1;
                    //    this.pre_drwtNo2 = response.data.drwtNo2;
                    //    this.pre_drwtNo3 = response.data.drwtNo3;
                    //    this.pre_drwtNo4 = response.data.drwtNo4;
                    //    this.pre_drwtNo5 = response.data.drwtNo5;
                    //    this.pre_drwtNo6 = response.data.drwtNo6;
                    //    this.pre_drwtNo7 = response.data.bnusNo;

                    //    this.nowNumber = response.data.drwNo;
                    //    this.nowDate = response.data.drwNoDate;

                    //    this.pre_styleA = 'background-color:' + this.getBallColor(this.pre_drwtNo1);
                    //    this.pre_styleB = 'background-color:' + this.getBallColor(this.pre_drwtNo2);
                    //    this.pre_styleC = 'background-color:' + this.getBallColor(this.pre_drwtNo3);
                    //    this.pre_styleD = 'background-color:' + this.getBallColor(this.pre_drwtNo4);
                    //    this.pre_styleE = 'background-color:' + this.getBallColor(this.pre_drwtNo5);
                    //    this.pre_styleF = 'background-color:' + this.getBallColor(this.pre_drwtNo6);
                    //    this.pre_styleG = 'background-color:' + this.getBallColor(this.pre_drwtNo7);
                },
                getPreLuckyNumber: function() {
                    let reqUrl = "http://localhost:11111/DDoService.asmx/GetLottoNumber";
                    var self = this;

                    axios({
                        method: 'GET',
                        url: reqUrl
                    }).then(function(response){
                        self.pre_drwtNo1 = response.data.drwtNo1;
                        self.pre_drwtNo2 = response.data.drwtNo2;
                        self.pre_drwtNo3 = response.data.drwtNo3;
                        self.pre_drwtNo4 = response.data.drwtNo4;
                        self.pre_drwtNo5 = response.data.drwtNo5;
                        self.pre_drwtNo6 = response.data.drwtNo6;
                        self.pre_drwtNo7 = response.data.bnusNo;
                    }).catch(function(ex){
                        console.log("ERR!!!!! : ", ex)
                    });
                    
                    //axios.get(reqUrl).then(function (response) {
                    //    setMessage("1");
                    //    //console.log(response);
                        
                    //    //console.log(response);
                    //    //this.pre_drwtNo1 = response.data.drwtNo1;
                    //    //this.pre_drwtNo2 = response.data.drwtNo2;
                    //    //this.pre_drwtNo3 = response.data.drwtNo3;
                    //    //this.pre_drwtNo4 = response.data.drwtNo4;
                    //    //this.pre_drwtNo5 = response.data.drwtNo5;
                    //    //this.pre_drwtNo6 = response.data.drwtNo6;
                    //    //this.pre_drwtNo7 = response.data.bnusNo;

                    //    //this.nowNumber = response.data.drwNo;
                    //    //this.nowDate = response.data.drwNoDate;

                    //    //this.pre_styleA = 'background-color:' + this.getBallColor(this.pre_drwtNo1);
                    //    //this.pre_styleB = 'background-color:' + this.getBallColor(this.pre_drwtNo2);
                    //    //this.pre_styleC = 'background-color:' + this.getBallColor(this.pre_drwtNo3);
                    //    //this.pre_styleD = 'background-color:' + this.getBallColor(this.pre_drwtNo4);
                    //    //this.pre_styleE = 'background-color:' + this.getBallColor(this.pre_drwtNo5);
                    //    //this.pre_styleF = 'background-color:' + this.getBallColor(this.pre_drwtNo6);
                    //    //this.pre_styleG = 'background-color:' + this.getBallColor(this.pre_drwtNo7);


                    //})
                },
                getBallColor:function(value) {
                    if (value <= 10) {
                        return "#FCC43D;";
                    } else if (value <= 20) {
                        return "#8CC6E7;";
                    } else if (value <= 30) {
                        return "#F18D80;";
                    } else if (value <= 40) {
                        return "#A7A2DE;";
                    } else {
                        return "#6BCE9E;";
                    }
                }
                
            }
        });
    </script>
</asp:Content>
