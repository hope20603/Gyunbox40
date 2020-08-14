<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Index_v2.aspx.cs" Inherits="Gyunbox40.Vue.Index_v2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- IE 에러 대비 -->
    <script src="../Content/js/jquery-3.3.1.min.js"></script>
    <script src="../Content/js/billboard.min.js"></script>
    <link href="../Content/css/billboard.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="app" class="app-index">
        <div>
            <ins class="kakao_ad_area" style="display: none;"
                data-ad-unit="DAN-qxtvjk0wtmpe"
                data-ad-width="320"
                data-ad-height="100"></ins>
            <script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>

        </div>
        <div class="section section-0" style="height: 100px;">
            <span style="color: #176D64; padding-left: 7px; font-weight: bold; font-size: 15pt; height: 30px; line-height: 30px;">안녕하세요</span><br />
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">나의 로또 일상을 기록하는 로또집사입니다.</span>
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">회원가입 없이도 게스트로 사용하실 수 있습니다.</span>
        </div>
        <div class="section section-1">
            <a href="CreateNumber.aspx">
                <div class="box-1" style="background-color: #8CC6E7;">
                    <span style="color: #ffffff; font-size: 25px; margin: auto; width: 100%; text-align: center; margin-top: 40px; display: inline-block;">번호 생성</span>
                </div>
            </a>
            <a href="Calc.aspx">
                <div class="box-2" style="background-color: #F18D80;">
                    <span style="color: #ffffff; font-size: 25px; margin: auto; width: 100%; text-align: center; margin-top: 30px; display: inline-block;">실수령액<br />
                        계산기</span>
                </div>
            </a>

        </div>

        <div class="section section-1">
            <a href="Stores.aspx">
                <div class="box-1" style="background-color: #A7A2DE">
                    <span style="color: #ffffff; font-size: 25px; margin: auto; width: 100%; text-align: center; margin-top: 30px; display: inline-block;">추첨결과<br />
                        당첨판매점</span>
                </div>
            </a>
            <a href="Login.aspx">
                <div class="box-2" style="background-color: #0DA084;">
                    <span style="color: #ffffff; font-size: 25px; margin: auto; width: 100%; text-align: center; margin-top: 40px; display: inline-block;">로그인</span>
                </div>
            </a>
        </div>
        <div class="section section-2" style="height: 300px;">
            <h2 style="width: 100%; text-align: center;">행운번호</h2>
            <ul>
                <li>
                    <div class="ball_wrap">
                        <div id="loading" class="loading" style="height: 100px; padding: 20px;">
                            <img src="../images/icon/ajax-loader.gif" />
                        </div>
                        <div id="ajaxTarget"></div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="section-add">
            <div style="width: 50%; float: left; overflow: hidden;">
                <ins class="kakao_ad_area" style="display: none;"
                    data-ad-unit="DAN-1k1ty6cac4h9g"
                    data-ad-width="250"
                    data-ad-height="250"></ins>
                <script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
            </div>
            <div style="width: 50%; float: right; overflow: hidden;">
                <ins class="kakao_ad_area" style="display: none;"
                    data-ad-unit="DAN-1iextrvmvi52u"
                    data-ad-width="250"
                    data-ad-height="250"></ins>
                <script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
            </div>
        </div>
        <div class="section section-3">
            <div id="AjaxWeekNumTarget"></div>
        </div>
        <div class="section-tab-wrap">
            <div class="section-title" style="box-sizing: border-box;">
                <h2>각 번호별 추첨 현황</h2>
            </div>
            <div class="section-tab">
                <div class="tab tab_1 on" onclick="javascript:Tab('1');">번호순</div>
                <div class="tab tab_2" onclick="javascript:Tab('2');">당첨횟수순</div>
            </div>
        </div>
        <div class="section-tab-content">
            <div class="tab_con tab-content-1">
                <!-- start : 번호순 -->
                <div style="float: left; width: 100%; padding-top: 10px; background-color: #ffffff; margin-top: -5px; box-sizing: border-box;">
                    <div class="rd_wrap">
                        <div class="rd_inner_wrap">
                            <span class="sp_tit">보너스 번호</span>
                            <span class="sp_bonus-y">
                                <input type="radio" value="Y" id="rd_bonus_y" name="rd_bonus" onchange="rdChange('Y')" checked /><label for="rd_bonus_y">포함</label></span>
                            <span class="sp_bonus-n">
                                <input type="radio" value="N" id="rd_bonus_n" name="rd_bonus" onchange="rdChange('N')" /><label for="rd_bonus_n">불포함</label></span>
                        </div>
                    </div>
                    <!-- 각번호별 1등에 나온 횟수 -->
                    <div id="chart_wrap">
                        <!--불포함-->
                        <table class="tbl_data" id="tbl_chart" style="display: none;">
                            <caption></caption>
                            <colgroup>
                                <col style="width: 10%">
                                <col style="width: 75%">
                                <col style="width: 15%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">그래프</th>
                                    <th scope="col">당첨횟수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    string clsColor = "";
                                    string barWidth = "";
                                    string winCount = "";
                                    string clsBall = "";

                                    for (int i = 1; i <= 45; i++)
                                    {
                                        if (i <= 10) { clsColor = "color1"; clsBall = "ball1"; }
                                        else if (i <= 20) { clsColor = "color2"; clsBall = "ball2"; }
                                        else if (i <= 30) { clsColor = "color3"; clsBall = "ball3"; }
                                        else if (i <= 40) { clsColor = "color4"; clsBall = "ball4"; }
                                        else { clsColor = "color5"; clsBall = "ball5"; }

                                        barWidth = htLucky["PER_" + i].ToString();
                                        winCount = htLucky[i.ToString()].ToString();
                                %>

                                <tr>
                                    <td><span class="ball_645 sml <%=clsBall%>"><%=i%></span></td>
                                    <td class="graph">
                                        <div class="graph_bar no_note">
                                            <span class="bar <%=clsColor%>" style="width: <%=barWidth%>%"><span style="font-size: 5px;">&nbsp;</span></span>
                                        </div>
                                    </td>
                                    <td><%=winCount%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>

                        <!-- 포함 -->
                        <table class="tbl_data" id="tbl_chart2" style="clear: both; width: 100%;">
                            <caption></caption>
                            <colgroup>
                                <col style="width: 10%">
                                <col style="width: 75%">
                                <col style="width: 15%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">그래프</th>
                                    <th scope="col">당첨횟수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    string clsColor2 = "";
                                    string barWidth2 = "";
                                    string winCount2 = "";
                                    string clsBall2 = "";

                                    for (int i = 1; i <= 45; i++)
                                    {
                                        if (i <= 10) { clsColor2 = "color1"; clsBall2 = "ball1"; }
                                        else if (i <= 20) { clsColor2 = "color2"; clsBall2 = "ball2"; }
                                        else if (i <= 30) { clsColor2 = "color3"; clsBall2 = "ball3"; }
                                        else if (i <= 40) { clsColor2 = "color4"; clsBall2 = "ball4"; }
                                        else { clsColor2 = "color5"; clsBall2 = "ball5"; }

                                        barWidth2 = htLucky["INC_PER_" + i].ToString();
                                        winCount2 = htLucky["INC_" + i.ToString()].ToString();
                                %>

                                <tr>
                                    <td><span class="ball_645 sml <%=clsBall2%>"><%=i%></span></td>
                                    <td class="graph">
                                        <div class="graph_bar no_note">
                                            <span class="bar <%=clsColor2%>" style="width: <%=barWidth2%>%"><span style="font-size: 5px;">&nbsp;</span></span>
                                        </div>
                                    </td>
                                    <td><%=winCount2%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- end : 번호순 -->
            </div>
            <div class="tab_con tab-content-2" style="display: none;">
                <!-- start : 당첨횟수순 -->
                <div style="float: left; width: 100%; padding-top: 10px; background-color: #ffffff; margin-top: -5px;">
                    <div class="rd_wrap">
                        <div class="rd_inner_wrap">
                            <span class="sp_tit">보너스 번호</span>
                            <span class="sp_bonus-y">
                                <input type="radio" value="Y" id="rd_bonus_y2" name="rd_bonus2" onchange="rdChange('Y2')" checked /><label for="rd_bonus_y2">포함</label></span>
                            <span class="sp_bonus-n">
                                <input type="radio" value="N" id="rd_bonus_n2" name="rd_bonus2" onchange="rdChange('N2')" /><label for="rd_bonus_n2">불포함</label></span>
                        </div>
                    </div>
                    <!-- 각번호별 1등에 나온 횟수 -->
                    <div id="chart_wrap2">
                        <!--불포함-->
                        <table class="tbl_data" id="tbl_chart3" style="display: none;">
                            <caption></caption>
                            <colgroup>
                                <col style="width: 10%">
                                <col style="width: 75%">
                                <col style="width: 15%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">그래프</th>
                                    <th scope="col">당첨횟수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    string clsColor3 = "";
                                    string barWidth3 = "";
                                    string winCount3 = "";
                                    string clsBall3 = "";
                                    int tNum3 = 0;

                                    for (int i = 1; i <= 45; i++)
                                    {
                                        tNum3 = Convert.ToInt16(htLuckyOrd["NUM_" + i]);

                                        if (tNum3 <= 10) { clsColor3 = "color1"; clsBall3 = "ball1"; }
                                        else if (tNum3 <= 20) { clsColor3 = "color2"; clsBall3 = "ball2"; }
                                        else if (tNum3 <= 30) { clsColor3 = "color3"; clsBall3 = "ball3"; }
                                        else if (tNum3 <= 40) { clsColor3 = "color4"; clsBall3 = "ball4"; }
                                        else { clsColor3 = "color5"; clsBall3 = "ball5"; }

                                        barWidth3 = htLuckyOrd["PER_" + i].ToString();
                                        winCount3 = htLuckyOrd[i.ToString()].ToString();
                                %>

                                <tr>
                                    <td><span class="ball_645 sml <%=clsBall3%>"><%=tNum3%></span></td>
                                    <td class="graph">
                                        <div class="graph_bar no_note">
                                            <span class="bar <%=clsColor3%>" style="width: <%=barWidth3%>%"><span style="font-size: 5px;">&nbsp;</span></span>
                                        </div>
                                    </td>
                                    <td><%=winCount3%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>

                        <!-- 포함 -->
                        <table class="tbl_data" id="tbl_chart4" style="clear: both; width: 100%;">
                            <caption></caption>
                            <colgroup>
                                <col style="width: 10%">
                                <col style="width: 75%">
                                <col style="width: 15%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">그래프</th>
                                    <th scope="col">당첨횟수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    string clsColor4 = "";
                                    string barWidth4 = "";
                                    string winCount4 = "";
                                    string clsBall4 = "";
                                    int tNum = 0;

                                    for (int i = 1; i <= 45; i++)
                                    {
                                        tNum = Convert.ToInt16(htLuckyOrd["INC_NUM_" + i]);

                                        if (tNum <= 10) { clsColor4 = "color1"; clsBall4 = "ball1"; }
                                        else if (tNum <= 20) { clsColor4 = "color2"; clsBall4 = "ball2"; }
                                        else if (tNum <= 30) { clsColor4 = "color3"; clsBall4 = "ball3"; }
                                        else if (tNum <= 40) { clsColor4 = "color4"; clsBall4 = "ball4"; }
                                        else { clsColor4 = "color5"; clsBall4 = "ball5"; }

                                        barWidth4 = htLuckyOrd["INC_PER_" + i].ToString();
                                        winCount4 = htLuckyOrd["INC_" + i.ToString()].ToString();
                                %>

                                <tr>
                                    <td><span class="ball_645 sml <%=clsBall4%>"><%=tNum%></span></td>
                                    <td class="graph">
                                        <div class="graph_bar no_note">
                                            <span class="bar <%=clsColor4%>" style="width: <%=barWidth4%>%"><span style="font-size: 5px;">&nbsp;</span></span>
                                        </div>
                                    </td>
                                    <td><%=winCount4%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- end : 번호순 -->
            </div>
        </div>
        <div class="banner_wrap">
            <script data-ad-client="ca-pub-8384080521274050" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

            <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
            <!-- ddogram.ga 하단 -->
            <ins class="adsbygoogle"
                style="display: block"
                data-ad-client="ca-pub-8384080521274050"
                data-ad-slot="3192841291"
                data-ad-format="auto"
                data-full-width-responsive="true"></ins>
            <script>
                (adsbygoogle = window.adsbygoogle || []).push({});
            </script>

        </div>
        <div class="visit_wrap">
            <div class="inner_wrap">
                <span class="sp_tit">접속중</span><span class="sp_con"><%=ViewState["nowVisit"]%></span>
                <span class="sp_tit">오늘</span>  <span class="sp_con"><%=ViewState["todayVisit"]%></span>
                <span class="sp_tit">전체</span>  <span class="sp_con"><%=ViewState["totalVisit"]%></span>
            </div>

        </div>
        <script type="text/javascript">
            function Tab(tabNum) {
                $(".tab_con").hide();
                $(".tab-content-" + tabNum).show();
                $(".tab").removeClass("on");
                $(".tab_" + tabNum).addClass("on");
            }

            function rdChange(tb) {
                var optionText = tb;
                if (optionText == "N") {
                    $("#tbl_chart").show();
                    $("#tbl_chart2").hide();
                } else if (optionText == "Y") {
                    $("#tbl_chart").hide();
                    $("#tbl_chart2").show();

                } else if (optionText == "N2") {
                    $("#tbl_chart3").show();
                    $("#tbl_chart4").hide();
                } else {
                    $("#tbl_chart3").hide();
                    $("#tbl_chart4").show();
                }
            }

            $(document).ready(function () {
                getLuckyNumberFive();
                changeWeekAjax(0);
            });

            function changeWeekAjax(tSeq) {
                let reqUrl = "AjaxWeekNum.aspx";

                if (tSeq >= 0) {
                    $.ajax({
                        url: reqUrl,
                        type: 'GET',
                        async: true,
                        data: "seq=" + tSeq,
                        dataType: "html",
                        timeout: 10000,
                        //contentType: "application/json",
                        success: function (data) {
                            $("#AjaxWeekNumTarget").html(data);
                        },
                        error: function (request, status, error) {

                        },
                        fail: function () {

                        }
                    });
                } else {
                    alert('마지막 회차입니다.');
                    return false;
                }
            }

            function getLuckyNumberFive() {
                let reqUrl = "/DDoService.asmx/GetLuckyNumberFive";

                $.ajax({
                    url: reqUrl,
                    type: 'GET',
                    async: true,
                    data: "",
                    dataType: "json",
                    timeout: 10000,
                    contentType: "application/json",
                    beforeSend: function () {
                        //    $(''.wrap - loading'').removeClass(''display - none'');
                        $('.loading').show();
                    },
                    complete: function () {
                        $('.loading').hide();
                    },
                    success: function (data) {
                        setLuckyNumberFive(JSON.parse(data.d))
                    },
                    error: function (request, status, error) {
                        $('.loading').show();
                    },
                    fail: function () {

                    }
                });
            }

            function setLuckyNumberFive(jsonObj) {
                let li_num = "";
                for (var i = 0; i < jsonObj.length; i++) {
                    li_num = "<span class='lottoBall " + getBallColor(jsonObj[i].no1) + " ball_1'>" + jsonObj[i].no1 + "</span>";
                    li_num += "<span class='lottoBall " + getBallColor(jsonObj[i].no2) + " ball_2'>" + jsonObj[i].no2 + "</span>";
                    li_num += "<span class='lottoBall " + getBallColor(jsonObj[i].no3) + " ball_3'>" + jsonObj[i].no3 + "</span>";
                    li_num += "<span class='lottoBall " + getBallColor(jsonObj[i].no4) + " ball_4'>" + jsonObj[i].no4 + "</span>";
                    li_num += "<span class='lottoBall " + getBallColor(jsonObj[i].no5) + " ball_5'>" + jsonObj[i].no5 + "</span>";
                    li_num += "<span class='lottoBall " + getBallColor(jsonObj[i].no6) + " ball_6'>" + jsonObj[i].no6 + "</span>";
                    li_num += "<span class='lottoBall plus_mark'>+</span>";
                    li_num += "<span class='last lottoBall " + getBallColor(jsonObj[i].no7) + " ball_7'>" + jsonObj[i].no7 + "</span>";
                    $("#ajaxTarget").append("<li>" + li_num + "</li>");
                }
            }

            function getBallColor(value) {
                if (value <= 10) {
                    return "color_1";
                } else if (value <= 20) {
                    return "color_2";
                } else if (value <= 30) {
                    return "color_3";
                } else if (value <= 40) {
                    return "color_4";
                } else {
                    return "color_5";
                }
            }
        </script>
    </div>
</asp:Content>
