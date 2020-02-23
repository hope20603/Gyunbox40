<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Gyunbox40.Vue.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    <span class="lottoBall ball_6">{{ drwtNo6 }}</span>
                    <span class="lottoBall ball_7">{{ drwtNo7 }}</span>
                    <span class="last lottoBall ball_8">{{ drwtNo8 }}</span>
                </li>
            </ul>
        </div>
        <div class="section section-3">
            <h2>지난당첨번호</h2>
             <ul>
                <li>
                    <span class="lottoBall ball_1">{{ pre_drwtNo1 }}</span>
                    <span class="lottoBall ball_2">{{ pre_drwtNo2 }}</span>
                    <span class="lottoBall ball_3">{{ pre_drwtNo3 }}</span>
                    <span class="lottoBall ball_4">{{ pre_drwtNo4 }}</span>
                    <span class="lottoBall ball_5">{{ pre_drwtNo5 }}</span>
                    <span class="lottoBall ball_6">{{ pre_drwtNo6 }}</span>
                    <span class="lottoBall ball_7">{{ pre_drwtNo7 }}</span>
                    <span class="last lottoBall ball_8">{{ pre_drwtNo8 }}</span>
                </li>
            </ul>
        </div>
        <div class="section section-4">광고</div>
    </div>
    <!-- IE 에러 대비 -->
    <script src="../Content/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="http://unpkg.com/vue-router@3.0.1/dist/vue-router.js"></script>
    <script>
        new Vue({
            el: '#app',
            data: {
                message: '나의 로또 일상을 저장하는 로"또그램\"',

                //추천행운번호
                drwtNo1: '1',
                drwtNo2: '2',
                drwtNo3: '3',
                drwtNo4: '4',
                drwtNo5: '5',
                drwtNo6: '6',
                drwtNo7: '7',
                drwtNo8: '8',

                //당첨번호
                pre_drwtNo1: '1',
                pre_drwtNo2: '1',
                pre_drwtNo3: '1',
                pre_drwtNo4: '1',
                pre_drwtNo5: '1',
                pre_drwtNo6: '1',
                pre_drwtNo7: '1',
                pre_drwtNo8: '1'
            },
            created() {
                console.log("created");
                this.getPreLuckyNumber();

            },
            mounted() {
                console.log("mounted");
            },
            methods: {
                getPreLuckyNumber() {
                    
                    let reqUrl = "https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=898";

                    $.ajax({
                        type: 'GET',
                        dataType: 'jsonp',
                        data: { 'drwNo': '888' },
                        url: reqUrl,
                        jsonp: 'stone',
                        success: function (json) {
                            console.log("aaa");
                        }
                    });

                    
                },
                callback() {
                    console.log("ggg");
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
