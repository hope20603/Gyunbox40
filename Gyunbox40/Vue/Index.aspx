<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Gyunbox40.Vue.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .section {
            position: relative;
        }
    </style>
    <div id="app" class="app-index">
        <div class="section section-0">
            <span style="font-size: 15pt;">안녕하세요?</span><br />
            <span>나의 로또 일상을 저장하는 로</span><span style="color: #1F77B4; font-weight: bold; font-size: 15pt;">또그램</span>
        </div>
        <div class="section section-1">
            <a href="CreateNumber.aspx">
                <div class="box-1">번호 생성</div>
            </a>
            <a href="ManageNumber.aspx">
                <div class="box-2">내 번호관리</div>
            </a>
        </div>
        <div class="section section-2">
            <h2 style="width: 100%; text-align: center;">행운번호</h2>
            <ul>
                <li>
                    <div class="ball_wrap">
                        <span class="lottoBall ball_1" id="ball_1" v-bind:style="styleA"><span class="ball_con">{{ drwtNo1 }}</span></span>
                        <span class="lottoBall ball_2" v-bind:style="styleB"><span class="ball_con">{{ drwtNo2 }}</span></span>
                        <span class="lottoBall ball_3" v-bind:style="styleC"><span class="ball_con">{{ drwtNo3 }}</span></span>
                        <span class="lottoBall ball_4" v-bind:style="styleD"><span class="ball_con">{{ drwtNo4 }}</span></span>
                        <span class="lottoBall ball_5" v-bind:style="styleE"><span class="ball_con">{{ drwtNo5 }}</span></span>
                        <span class="lottoBall ball_6" v-bind:style="styleF"><span class="ball_con">{{ drwtNo6 }}</span></span>
                        <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                        <span class="last lottoBall ball_7" v-bind:style="styleG"><span class="ball_con">{{ drwtNo7 }}</span></span>
                    </div>
                </li>
            </ul>
        </div>
        <div class="section section-3">
            <h2 style="width: 100%; text-align: center; padding-bottom: 30px;">
                <span style="color: #B40000; font-size: 15pt;">{{ nowNumber }}회 </span><span style="color: #514856; font-size: 15pt;">당첨결과</span>
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
        <div class="section-title">
            <h2>각 번호별 추첨 현황</h2>
        </div>
        <div style="float: left; width: 100%; height: 300px; padding-top: 10px; background-color: #ffffff;">
            <div id="chart"></div>
        </div>
        <script>
            $(document).ready(function () {
                var chart = bb.generate({
                    data: {
                        x: "x",
                        columns: [
                            ["x",
                                "1", "2", "3", "4", "5",
                                "6", "7", "8", "9", "10",
                                "11", "12", "13", "14", "15",
                                "16", "17", "18", "19", "20",
                                "21", "22", "23", "24", "25",
                                "26", "27", "28", "29", "30",
                                "31", "32", "33", "34", "35",
                                "36", "37", "38", "39", "40",
                                "41", "42", "43", "44", "45"


                            ],
                            ["추첨횟수",
                                <%=htLucky["1"]%>, <%=htLucky["2"]%>,<%=htLucky["3"]%>,<%=htLucky["4"]%>,<%=htLucky["5"]%>,
                                <%=htLucky["6"]%>, <%=htLucky["7"]%>,<%=htLucky["8"]%>,<%=htLucky["9"]%>,<%=htLucky["10"]%>,
                                <%=htLucky["11"]%>, <%=htLucky["12"]%>,<%=htLucky["13"]%>,<%=htLucky["14"]%>,<%=htLucky["15"]%>,
                                <%=htLucky["16"]%>, <%=htLucky["17"]%>,<%=htLucky["18"]%>,<%=htLucky["19"]%>,<%=htLucky["20"]%>,
                                <%=htLucky["21"]%>, <%=htLucky["22"]%>,<%=htLucky["23"]%>,<%=htLucky["24"]%>,<%=htLucky["25"]%>,
                                <%=htLucky["26"]%>, <%=htLucky["27"]%>,<%=htLucky["28"]%>,<%=htLucky["29"]%>,<%=htLucky["30"]%>,
                                <%=htLucky["31"]%>, <%=htLucky["32"]%>,<%=htLucky["33"]%>,<%=htLucky["34"]%>,<%=htLucky["35"]%>,
                                <%=htLucky["36"]%>, <%=htLucky["37"]%>,<%=htLucky["38"]%>,<%=htLucky["39"]%>,<%=htLucky["40"]%>,
                                <%=htLucky["41"]%>, <%=htLucky["42"]%>,<%=htLucky["43"]%>,<%=htLucky["44"]%>,<%=htLucky["45"]%>
                            ]
                        ]
                    },
                    size: {
                        width: 350,
                        height: 300
                    },
                    axis: {
                        //x: {
                        //    type: "timeseries",
                        //    tick: {
                        //        format: "%Y-%m-%d"
                        //    }
                        //}
                    },
                    tooltip: {
                        linked: true
                    },
                    bindto: "#chart"
                });
            });

        </script>
    </div>
    <!-- IE 에러 대비 -->
    <script src="../Content/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="http://unpkg.com/vue-router@3.0.1/dist/vue-router.js"></script>
    <script src="https://d3js.org/d3.v5.min.js"></script>
    <script src="../Content/js/billboard.min.js"></script>
    <link href="../Content/css/billboard.min.css" rel="stylesheet" />
    <script>
        new Vue({
            el: '#app',
            data: {
                //message: '나의 로또 일상을 저장하는 로"또그램\"',

                //회차정보
                nowNumber: '1',

                //추첨일자
                nowDate: "1900-01-01",

                //추천행운번호
                drwtNo1: '1',
                drwtNo2: '2',
                drwtNo3: '3',
                drwtNo4: '4',
                drwtNo5: '5',
                drwtNo6: '6',
                drwtNo7: '7',

                //당첨번호
                pre_drwtNo1: '1',
                pre_drwtNo2: '1',
                pre_drwtNo3: '1',
                pre_drwtNo4: '1',
                pre_drwtNo5: '1',
                pre_drwtNo6: '1',
                pre_drwtNo7: '1',

                //로또볼 색 정의
                styleA: "background-color:#ffffff",
                styleB: "background-color:#ffffff",
                styleC: "background-color:#ffffff",
                styleD: "background-color:#ffffff",
                styleE: "background-color:#ffffff",
                styleF: "background-color:#ffffff",
                styleG: "background-color:#ffffff",

                pre_styleA: "background-color:#ffffff",
                pre_styleB: "background-color:#ffffff",
                pre_styleC: "background-color:#ffffff",
                pre_styleD: "background-color:#ffffff",
                pre_styleE: "background-color:#ffffff",
                pre_styleF: "background-color:#ffffff",
                pre_styleG: "background-color:#ffffff"
            },
            created() {
                //console.log("created");


            },
            mounted() {
                //console.log("mounted");
                this.getPreLuckyNumber();
            },
            methods: {

                //당첨번호 가져오기
                getPreLuckyNumber() {

                    let reqUrl = "http://<%=hostString%>/DDoService.asmx/GetLottoNumber";

                  axios.get(reqUrl).then((response) => {

                      this.pre_drwtNo1 = response.data.drwtNo1;
                      this.pre_drwtNo2 = response.data.drwtNo2;
                      this.pre_drwtNo3 = response.data.drwtNo3;
                      this.pre_drwtNo4 = response.data.drwtNo4;
                      this.pre_drwtNo5 = response.data.drwtNo5;
                      this.pre_drwtNo6 = response.data.drwtNo6;
                      this.pre_drwtNo7 = response.data.bnusNo;

                      this.nowNumber = response.data.drwNo;
                      this.nowDate = response.data.drwNoDate;

                      this.pre_styleA = 'background-color:' + this.getColorClass(this.pre_drwtNo1);
                      this.pre_styleB = 'background-color:' + this.getColorClass(this.pre_drwtNo2);
                      this.pre_styleC = 'background-color:' + this.getColorClass(this.pre_drwtNo3);
                      this.pre_styleD = 'background-color:' + this.getColorClass(this.pre_drwtNo4);
                      this.pre_styleE = 'background-color:' + this.getColorClass(this.pre_drwtNo5);
                      this.pre_styleF = 'background-color:' + this.getColorClass(this.pre_drwtNo6);
                      this.pre_styleG = 'background-color:' + this.getColorClass(this.bnusNo);


                      //행운번호 api로 이동해야 함.
                      this.styleA = 'background-color:' + this.getColorClass(this.pre_drwtNo1);
                      this.styleB = 'background-color:' + this.getColorClass(this.pre_drwtNo2);
                      this.styleC = 'background-color:' + this.getColorClass(this.pre_drwtNo3);
                      this.styleD = 'background-color:' + this.getColorClass(this.pre_drwtNo4);
                      this.styleE = 'background-color:' + this.getColorClass(this.pre_drwtNo5);
                      this.styleF = 'background-color:' + this.getColorClass(this.pre_drwtNo6);
                      this.styleG = 'background-color:' + this.getColorClass(this.bnusNo);

                  })
                },
                getColorClass(value) {
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
      })

        //https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=898

        //{ "totSellamnt": 90067839000, "returnValue": "success", "drwNoDate": "2020-02-15", "firstWinamnt": 2639313235, "drwtNo6": 42, "drwtNo4": 35, "firstPrzwnerCo": 8, "drwtNo5": 37, "bnusNo": 17, "firstAccumamnt": 21114505880, "drwNo": 898, "drwtNo2": 21, "drwtNo3": 28, "drwtNo1": 18 }
        // +7일마다 회차 1회 추가

        //returnValue
        //실행 결과

        //totSellamnt
        //누적 금

        //drwNo
        //회차

        //drwNoDate
        //당첨일

        //firstWinamnt
        //1등 당첨금

        //firstPrzwnerCo
        //1등 당첨 인원

        //firstAccumamnt
        //1등 당첨금 총액

    </script>

</asp:Content>
