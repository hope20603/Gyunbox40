<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="ManageNumber.aspx.cs" Inherits="Gyunbox40.Vue.ManageNumber" %>
<%@ Import Namespace="Gyunbox40.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-manageNumber">
        <div>
            <ins class="kakao_ad_area" style="display:none;" 
 data-ad-unit    = "DAN-sohv6m57ry9i" 
 data-ad-width   = "320" 
 data-ad-height  = "50"></ins> 
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>

        </div>
        <div class="section section-0">
            <span style="color: #176D64; padding-left: 7px; font-weight: bold; font-size: 15pt; height: 30px; line-height: 30px;">안녕하세요</span><br />
            <span style="padding-left: 7px;float:left;">내가 좋아하는 번호들을 관리하세요.</span>
            <span style="padding-left: 7px;float:left;">이번엔 당첨 될 수도 있습니다!!</span>
        </div>
        <div class="section section-2">
            <a href="CreateNumber.aspx">
                <div class="box-1">
                    <span style="width: 57px; height: 5px; background-color: #8CC6E7; float: left;"></span>
                    <span style="width: 100%; float: left; height: 30px; line-height: 30px; color: #BBB8B3;">Create</span>
                    <span style="float: right; margin-top: 60px; color: #514856;">번호 생성</span>
                </div>
            </a>
            <a href="Index.aspx">
                <div class="box-2">
                    <span style="width: 74px; height: 5px; background-color: #0DA084; float: left;"></span>
                    <span style="width: 100%; float: left; height: 30px; line-height: 30px; color: #BBB8B3;">Home</span>
                    <span style="float: right; margin-top: 60px; color: #514856;">홈으로</span>
                </div>
            </a>
        </div>
        <div class="section section-1">
            <h2>내가 저장한 번호 ({{ totalCount }})</h2>
            <ul>
                <li v-for="(item, index) in listArr" class="li-numbers">
                    <div class="list-index">
                        <span>{{ item.rowNum }}</span>
                    </div>
                    <div class="list-con">
                        <div class="list-ball_wrap">
                            <span class="lottoBall ball_1" v-bind:class="getClass(item.num1)">{{ item.num1 }}</span>
                            <span class="lottoBall ball_2" v-bind:class="getClass(item.num2)">{{ item.num2 }}</span>
                            <span class="lottoBall ball_3" v-bind:class="getClass(item.num3)">{{ item.num3 }}</span>
                            <span class="lottoBall ball_4" v-bind:class="getClass(item.num4)">{{ item.num4 }}</span>
                            <span class="lottoBall ball_5" v-bind:class="getClass(item.num5)">{{ item.num5 }}</span>
                            <span class="lottoBall ball_6" v-bind:class="getClass(item.num6)">{{ item.num6 }}</span>
                            <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                            <span class="last lottoBall  ball_7" v-bind:class="getClass(item.num7)">{{ item.num7 }}</span>
                        </div>
                    </div>
                    <div class="list-tail">
                        <a @click=deleteNumber(index,item.IDX) title="삭제"><span class="btn_del"></span></a>
                    </div>
                </li>
            </ul>
        </div>
        <%--<div class="section section-paging">
            <li v-html="strPaging" class="li-paging"></li>
        </div>--%>
        <infinite-loading
            slot="append"
            @infinite="infiniteHandler"
            force-use-infinite-wrapper=".el-table__body-wrapper">
        </infinite-loading>
    </div>
    <%--<div id="loadingPop" style="">
        <div id="loadingCircle" style="">Loading..</div>
    </div>--%>
    <script src="../Content/js/vue-infinite-loading.js"></script>
    <script>
        var listArr = [];
        var jsonStr = <%=jsonString%>;
        var pageSize = 10;
        var curPage = 1;
        //var left = (($(window).width() - 90) / 2 + $(window).scrollLeft()) + "px";
        //
        //$(document).ready(function () {
        //    $("#loadingPop div").css("left", left);
        //});

        //$(window).scroll(function () {
        //
        //    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
        //        curPage++; // 현재 페이지에서 +1 처리.
        //        makeMyList(); //ajax 호출
        //    } 
        //
        //});

        //페이징을 직접 구현했을때 사용
        /*
        $(document).ready(function () {
            $(".li-paging span").on("click", function () {
                $(".li-paging span").each(function () {
                    $(this).removeClass("on");
                });
                $(this).addClass("on");
            });
        });
        */
        

        var app = new Vue({
            el: '#app',
            data: {
                //동적으로 수정이 필요한 변수들은 Vue객체 안에 선언을 해주어야 한다.
                //message: '내가 좋아하는 번호들을 관리하세요.\n이번엔 당첨 될 수도 있습니다!!'
                listArr: jsonStr.slice(0, 11),
                totalCount: '',
                page: 1,
                refCount: 0,
                strPaging : ''
                
            },
            created:function() {

                this.getTotalCount();

                //로딩페이지 필요한 경우 아래 주석 해제
                //로딩페이지 - axios 이벤트 가로채기!
                //axios.interceptors.request.use((config) => {
                //    //요청전에 로딩 오버레이 띄우기
                //    this.setLoading(true);
                //    return config;
                //}, (error) => {
                //    this.setLoading(false);
                //    return Promise.reject(error);
                //});
                //
                //axios.interceptors.response.use((response) => {
                //    // 응답 받으면 로딩 끄기
                //    this.setLoading(false);
                //    return response;
                //}, (error) => {
                //    this.setLoading(false);
                //    return Promise.reject(error);
                //});

                //created훅에서는 data를 반응형으로 추적할 수 있게 되며 computed, methods, watch 등이 활성화되어 접근이 가능하게 됩니다.하지만 아직까지 DOM에는 추가되지 않은 상태입니다.
                //data에 직접 접근이 가능하기 때문에, 컴포넌트 초기에 외부에서 받아온 값들로 data를 세팅해야 하거나 이벤트 리스너를 선언해야 한다면 이 단계에서 하는 것이 가장 적절합니다.
            },
            mounted: function () {
                
            },
            updated: function () {
                //console.log("aaaaaaaaaa");
            },
            methods: {
                //무한스크롤 구현
                infiniteHandler: function ($state) {
                    var self = this;
                    curPage += 1; //다음페이지 번호
                    let reqUrl = "/DDoService.asmx/GetMyNumberList";

                    axios({
                        method: 'GET',
                        url: reqUrl,
                        params: {
                            page: curPage,
                            size: pageSize
                        }
                    }).then(function(response){
                        //console.log(response);
                        if (response.data != null && response.data.length > 0) {
                            //console.log(response);
                            self.listArr = self.listArr.concat(response.data);
                            //this.listArr = response.data;
                            $state.loaded();
                        } else {
                            $state.complete();
                        }
                    }).catch(function(ex){
                        console.log("ERR!!!!! : ", ex)
                    });
                },
                //로딩페이지를 직접 구현한 경우 사용
                /*
                setLoading(isLoading) {
                    if (isLoading) {
                        $("#loadingPop").show();
                    } else {
                        $("#loadingPop").hide();
                    }
                },
                */
                //내가 저장한 번호 개수 
                getTotalCount: function () {
                    var self = this;
                    let reqUrl = "/DDoService.asmx/GetMyNumberCount";
                    axios({
                        method: 'GET',
                        url: reqUrl
                    }).then(function(response){
                        self.totalCount = response.data[0].cnt;
                        //this.makePager();
                    }).catch(function(ex){
                        console.log("ERR!!!!! : ", ex)
                    });
                },

                //번호 리스트에서 삭제
                deleteNumber:function(index, idx) {
                    //console.debug("index", index);
                    //console.debug("idx", idx);
                    var self = this;
                    //해당 번호의 소유자가 로그인 정보와 동일한지 확인 한 후 삭제
                    let reqUrl = "/DDoService.asmx/DeleteMyNumber";

                    axios({
                        method: 'GET',
                        url: reqUrl,
                        params: {
                            targetIdx: idx
                        }
                    }).then(function(response){
                        if (response.data == "OK") {
                            self.listArr.splice(index, 1);
                            self.getTotalCount();
                        } else {
                            alert("삭제 중 문제가 발생하였습니다.\n다시 시도해주세요!!");
                        }
                    }).catch(function(ex){
                        //console.log("ERR!!!!! : ", ex)
                    });
                    

                },

                //페이징 만들기- 무한스크롤 방식으로 전환함
                makePager: function () {
                    var self = this;
                    let totalPage = Math.ceil(Number(self.totalCount / pageSize));

                    self.strPaging += "<a onclick='app.actionPaging(" + 1 + ");'><span class='first'><<</span></a>";

                    for (var i = 0; i < totalPage; i++) {
                        let spClass = "";
                        if (i + 1 == curPage) {
                            spClass = "on";
                        }
                        self.strPaging += "<a onclick='app.actionPaging(" + (i + 1) + ");'><span class='"+ spClass +"'>" + (i + 1) + "</span></a>";
                    }

                    self.strPaging += "<a onclick='app.actionPaging(" + totalPage + ");'><span class='last' >>></span></a>";
                },

                //리스트 구성
                makeMyList:function() {
                    var self = this;
                    let totalPage = Math.ceil(Number(self.totalCount / pageSize));

                    if (totalPage >= curPage) {
                        let reqUrl = "/DDoService.asmx/GetMyNumberList";

                        axios({
                            method: 'GET',
                            url: reqUrl,
                            params: {
                                page: curPage,
                                size: pageSize
                            }
                        }).then(function(response){
                            console.log(response);
                            if (response.data != null && response.data.length > 0) {
                                self.listArr = response.data;
                            }
                        }).catch(function(ex){
                            console.log("ERR!!!!! : ", ex)
                        });
                    }
                },

                //페이징 클릭시 실행- 무한스크롤 방식으로 변경함.
                actionPaging:function(page) {
                    curPage = page;
                    this.makeMyList();
                },

                //로또볼에 색상을 입힘
                getClass:function(ballNumber) {
                    return this.getBallColor(ballNumber);
                },
                getBallColor:function(ballNum) {
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
            }
        })
    </script>
</asp:Content>
