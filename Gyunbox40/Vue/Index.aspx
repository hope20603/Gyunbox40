﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Gyunbox40.Vue.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .section{position:relative;}
    </style>
    <div id="app" class="app-index">
        <div class="section section-0">
            {{ message }}
        </div>
        <div class="section section-1">
            <div class="box-1"><a href="CreateNumber.aspx">번호 생성</a></div>
            <div class="box-2"><a href="ManageNumber.aspx">내 번호관리</a></div>
        </div>
        <div class="section section-2">
            <h2>행운번호</h2>
            <ul>
                <li>
                    <span class="lottoBall ball_1" id="ball_1">{{ drwtNo1 }}</span>
                    <span class="lottoBall ball_2">{{ drwtNo2 }}</span>
                    <span class="lottoBall ball_3">{{ drwtNo3 }}</span>
                    <span class="lottoBall ball_4">{{ drwtNo4 }}</span>
                    <span class="lottoBall ball_5">{{ drwtNo5 }}</span>
                    <span class="lottoBall ball_6">{{ drwtNo6 }}</span> + 보너스번호
                    <span class="last lottoBall ball_7">{{ drwtNo7 }}</span>
                </li>
            </ul>
        </div>
        <div class="section section-3">
            <h2><span style="color:red;">{{ nowNumber }}회</span>차 당첨번호 <span>{{ nowDate }}</span></h2>
             <ul>
                <li>
                    <span class="lottoBall ball_1">{{ pre_drwtNo1 }}</span>
                    <span class="lottoBall ball_2">{{ pre_drwtNo2 }}</span>
                    <span class="lottoBall ball_3">{{ pre_drwtNo3 }}</span>
                    <span class="lottoBall ball_4">{{ pre_drwtNo4 }}</span>
                    <span class="lottoBall ball_5">{{ pre_drwtNo5 }}</span>
                    <span class="lottoBall ball_6">{{ pre_drwtNo6 }}</span> + 보너스번호
                    <span class="last lottoBall ball_7">{{ pre_drwtNo7 }}</span>
                </li>
            </ul>
        </div>
        <div style="float:left; width:100%; height:400px; ">
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
                                20, 30, 10, 10, 30,
                                40, 20, 30, 10, 10,
                                30, 40, 20, 30, 10,
                                10, 30, 40, 20, 30,
                                10, 10, 30, 40, 20,
                                30, 10, 110, 30, 200,
                                20, 30, 10, 10, 30,
                                40, 20, 30, 10, 10,
                                30, 40, 30, 10, 10
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
        <%--<div class="section section-4" id="chart">
           <div id="chart" style="width:100%; display:block; float:left;height:200px; border:1px solid red;"></div>
        </div>--%>
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
                message: '나의 로또 일상을 저장하는 로"또그램\"',

                //회차정보
                nowNumber: '1',

                //추첨일자
                nowDate : "1900-01-01",

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
                pre_drwtNo7: '1'
            },
            created() {
                console.log("created");
                

            },
            mounted() {
                console.log("mounted");
                this.getPreLuckyNumber();
            },
            methods: {
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
                        console.log(response);
                        })
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
