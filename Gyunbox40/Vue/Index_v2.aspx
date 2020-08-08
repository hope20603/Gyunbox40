<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Index_v2.aspx.cs" Inherits="Gyunbox40.Vue.Index_v2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-index">
        <div>
            <ins class="kakao_ad_area" style="display:none;" 
 data-ad-unit    = "DAN-qxtvjk0wtmpe" 
 data-ad-width   = "320" 
 data-ad-height  = "100"></ins> 
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>

        </div>
        <div class="section section-0" style="height: 100px;">
            <span style="color: #176D64; padding-left: 7px; font-weight: bold; font-size: 15pt; height: 30px; line-height: 30px;">안녕하세요</span><br />
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">나의 로또 일상을 기록하는 로또집사입니다.</span>
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">회원가입 없이도 게스트로 사용하실 수 있습니다.</span>
            <%--<span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;" class="blink">또그램은 <span style="color: #ED184E;">모바일</span>에 최적화 되어있습니다 :)</span>--%>
        </div>
        <div class="section section-1">
            <a href="CreateNumber.aspx">
                <div class="box-1" style="background-color:#8CC6E7;">
                    <%--<span style="width: 57px; height: 5px; background-color: #8CC6E7; float: left;"></span>--%>
                    <%--<span style="width: 100%; float: left; height: 30px; line-height: 30px; color: #BBB8B3;">Create</span>--%>
                    <span style="color:#ffffff; font-size:25px; margin:auto;width:100%;text-align:center; margin-top:40px; display:inline-block;" >번호 생성</span>
                </div>
            </a>
            <a href="Calc.aspx">
                <div class="box-2" style="background-color: #F18D80;">
                    <%--<span style="width: 83px; height: 5px; background-color: #F18D80; float: left;"></span>
                    <span style="width: 100%; float: left; height: 30px; line-height: 30px; color: #BBB8B3;">Calculator</span>
                    <span style="float: right; margin-top: 60px; color: #514856;">실수령액 계산기</span>--%>
                    <span style="color:#ffffff; font-size:25px; margin:auto;width:100%;text-align:center; margin-top:30px; display:inline-block;" >실수령액<br />계산기</span>
                </div>
            </a>
            
        </div>
       
            <div class="section section-1">
            <a href="Stores.aspx">
                <div class="box-1" style="background-color: #A7A2DE">
                    <%--<span style="width: 122px; height: 5px; background-color: #A7A2DE; float: left;"></span>
                    <span style="width: 100%; float: left; height: 30px; line-height: 30px; color: #BBB8B3;">Result & Stores</span>
                    <span style="float: right; margin-top: 60px; color: #514856;">추첨결과/당첨판매점</span>--%>
                    <span style="color:#ffffff; font-size:25px; margin:auto;width:100%;text-align:center; margin-top:30px; display:inline-block;" >추첨결과<br />당첨판매점</span>
                </div>
            </a>
                <a href="Login.aspx">
                <div class="box-2" style="background-color:#0DA084;">
                    
                    <%--<span style="width: 74px; height: 5px; background-color: #0DA084; float: left;"></span>
                    <span style="width: 100%; float: left; height: 30px; line-height: 30px; color: #BBB8B3;">My page</span>--%>
                    
                   <span style="color:#ffffff; font-size:25px; margin:auto;width:100%;text-align:center; margin-top:40px; display:inline-block;" >로그인</span>
                </div>
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
        <div class="section-add">
            <div style="width:50%;float:left;overflow:hidden;">
                <ins class="kakao_ad_area" style="display:none;" 
 data-ad-unit    = "DAN-1k1ty6cac4h9g" 
 data-ad-width   = "250" 
 data-ad-height  = "250"></ins> 
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
            </div>
            <div style="width:50%;float:right;overflow:hidden;">
                <ins class="kakao_ad_area" style="display:none;" 
 data-ad-unit    = "DAN-1iextrvmvi52u" 
 data-ad-width   = "250" 
 data-ad-height  = "250"></ins> 
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
            </div>
        </div>
        <div class="section section-3">
            <!-- 당첨결과 선택해서 조회 가능하도록 수정 -->
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
        <div class="section-tab">
            <div class="tab tab_1 on" onclick="javascript:Tab('1');">번호순</div>
            <div class="tab tab_2" onclick="javascript:Tab('2');">당첨횟수순</div>
        </div>
        <div class="section-tab-content">
            <div class="tab_con tab-content-1">
        <!-- start : 번호순 -->
        <div style="float: left; width: 100%; padding-top: 10px; background-color: #ffffff; margin-top:-5px;">
            <div class="rd_wrap">
                <div class="rd_inner_wrap">
                    <span class="sp_tit">보너스 번호</span>
                    <span class="sp_bonus-y"><input type="radio" value="Y" id="rd_bonus_y" name="rd_bonus" @change="rdChange($event)" checked/><label for="rd_bonus_y">포함</label></span>
                    <span class="sp_bonus-n"><input type="radio" value="N" id="rd_bonus_n"name="rd_bonus" @change="rdChange($event)" /><label for="rd_bonus_n" >불포함</label></span>
                </div>
            </div>
            <!-- 각번호별 1등에 나온 횟수 -->
            <div id="chart_wrap" >
                <!--불포함-->
                <table class="tbl_data" id="tbl_chart" style="display:none;">
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%">
                        <col style="width:75%">
                        <col style="width:15%">
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
                                    <span class="bar <%=clsColor%>" style="width:<%=barWidth%>%"><span style="font-size:5px;">&nbsp;</span></span>
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
                <table class="tbl_data" id="tbl_chart2" style="clear:both;width:100%;">
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%">
                        <col style="width:75%">
                        <col style="width:15%">
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
                                    <span class="bar <%=clsColor2%>" style="width:<%=barWidth2%>%"><span style="font-size:5px;">&nbsp;</span></span>
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
            <div class="tab_con tab-content-2" style="display:none;">
        <!-- start : 당첨횟수순 -->
        <div style="float: left; width: 100%; padding-top: 10px; background-color: #ffffff; margin-top:-5px;">
            <div class="rd_wrap">
                <div class="rd_inner_wrap">
                    <span class="sp_tit">보너스 번호</span>
                    <span class="sp_bonus-y"><input type="radio" value="Y" id="rd_bonus_y2" name="rd_bonus2" @change="rdChange2($event)" checked/><label for="rd_bonus_y2">포함</label></span>
                    <span class="sp_bonus-n"><input type="radio" value="N" id="rd_bonus_n2"name="rd_bonus2" @change="rdChange2($event)" /><label for="rd_bonus_n2" >불포함</label></span>
                </div>
            </div>
            <!-- 각번호별 1등에 나온 횟수 -->
            <div id="chart_wrap2" >
                <!--불포함-->
                <table class="tbl_data" id="tbl_chart3" style="display:none;">
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%">
                        <col style="width:75%">
                        <col style="width:15%">
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
                                    <span class="bar <%=clsColor3%>" style="width:<%=barWidth3%>%"><span style="font-size:5px;">&nbsp;</span></span>
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
                <table class="tbl_data" id="tbl_chart4" style="clear:both;width:100%;">
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%">
                        <col style="width:75%">
                        <col style="width:15%">
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
                                    <span class="bar <%=clsColor4%>" style="width:<%=barWidth4%>%"><span style="font-size:5px;">&nbsp;</span></span>
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
        <div class="coupang_wrap">
            <div class="inner" style="margin:auto;width:360px;">
                <div style="float:left;"><a href="https://coupa.ng/bHwYHI" target="_blank"><img src="https://static.coupangcdn.com/image/affiliate/banner/83a324d17fe67268309c74cbf7fb298a@2x.jpg" alt="LG전자 그램14 노트북 (35.5cm WIN미포함 SSD128G), 팬티엄 5405U, 4GB" width="120" height="240"></a></div>
                <div style="float:left;"><a href="https://coupa.ng/bHwZcW" target="_blank"><img src="https://static.coupangcdn.com/image/affiliate/banner/cab3d3adc847189c1211e9bbba3c845e@2x.jpg" alt="퀸센스 리모컨 서큘레이터 선풍기, QSF-300RK" width="120" height="240"></a></div>
                <div style="float:left;"><a href="https://coupa.ng/bHwZq3" target="_blank"><img src="https://static.coupangcdn.com/image/affiliate/banner/0df648ab21abb380c24a9ff7263add1b@2x.jpg" alt="칼로바이 다밀 다이어트쉐이크 오곡맛 50 g x 7p + 허니바닐라맛 50 g x 7p, 1세트"  width="120" height="240"></a></div>
            </div>
        </div>
        <div class="banner_wrap">
            <script data-ad-client="ca-pub-8384080521274050" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- ddogram.ga 하단 -->
<ins class="adsbygoogle"
     style="display:block"
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
        <script>
            //var shown = true;          //글자 깜빡임을 위한 변수

            ////글자 깜빡임
            //setInterval(toggle, 1000);

            //function toggle() {
            //    if (shown) {
            //        $(".blink").fadeOut();
            //        shown = false;
            //    } else {
            //        $(".blink").fadeIn();
            //        shown = true;
            //    }
            //}

            function Tab(tabNum) {
                $(".tab_con").hide();
                $(".tab-content-" + tabNum).show();
                $(".tab").removeClass("on");
                $(".tab_" + tabNum).addClass("on");
            }
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
                drwtNo1: '<%=datas[0]%>',
                drwtNo2: '<%=datas[1]%>',
                drwtNo3: '<%=datas[2]%>',
                drwtNo4: '<%=datas[3]%>',
                drwtNo5: '<%=datas[4]%>',
                drwtNo6: '<%=datas[5]%>',
                drwtNo7: '<%=datas[6]%>',

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
            created: function () {
                //console.log("created");


            },
            mounted: function () {
                //console.log("mounted");
                this.getPreLuckyNumber();
            },
            methods: {

                //당첨번호 가져오기
                getPreLuckyNumber: function () {
                    var self = this;
                    //let reqUrl = "http://<%=hostString%>/DDoService.asmx/GetLottoNumber";
                    let reqUrl = "/DDoService.asmx/GetLottoNumber";

                    axios.get(reqUrl).then(function (response) {

                        self.pre_drwtNo1 = response.data.drwtNo1;
                        self.pre_drwtNo2 = response.data.drwtNo2;
                        self.pre_drwtNo3 = response.data.drwtNo3;
                        self.pre_drwtNo4 = response.data.drwtNo4;
                        self.pre_drwtNo5 = response.data.drwtNo5;
                        self.pre_drwtNo6 = response.data.drwtNo6;
                        self.pre_drwtNo7 = response.data.bnusNo;

                        self.nowNumber = response.data.drwNo;
                        self.nowDate = response.data.drwNoDate;

                        self.pre_styleA = 'background-color:' + self.getBallColor(self.pre_drwtNo1);
                        self.pre_styleB = 'background-color:' + self.getBallColor(self.pre_drwtNo2);
                        self.pre_styleC = 'background-color:' + self.getBallColor(self.pre_drwtNo3);
                        self.pre_styleD = 'background-color:' + self.getBallColor(self.pre_drwtNo4);
                        self.pre_styleE = 'background-color:' + self.getBallColor(self.pre_drwtNo5);
                        self.pre_styleF = 'background-color:' + self.getBallColor(self.pre_drwtNo6);
                        self.pre_styleG = 'background-color:' + self.getBallColor(self.pre_drwtNo7);


                        //행운번호 api로 이동해야 함.
                        self.styleA = 'background-color:' + self.getBallColor(self.drwtNo1);
                        self.styleB = 'background-color:' + self.getBallColor(self.drwtNo2);
                        self.styleC = 'background-color:' + self.getBallColor(self.drwtNo3);
                        self.styleD = 'background-color:' + self.getBallColor(self.drwtNo4);
                        self.styleE = 'background-color:' + self.getBallColor(self.drwtNo5);
                        self.styleF = 'background-color:' + self.getBallColor(self.drwtNo6);
                        self.styleG = 'background-color:' + self.getBallColor(self.drwtNo7);

                    })
                },

                //로또 볼 번호별 색상 정의
                getBallColor: function (value) {
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
                },
                rdChange: function (event) {
                    var optionText = event.target.value;
                    if (optionText == "N") {
                        $("#tbl_chart").show();
                        $("#tbl_chart2").hide();
                    } else {
                        $("#tbl_chart").hide();
                        $("#tbl_chart2").show();

                    }

                },
                rdChange2: function (event) {
                    var optionText = event.target.value;
                    if (optionText == "N") {
                        $("#tbl_chart3").show();
                        $("#tbl_chart4").hide();
                    } else {
                        $("#tbl_chart3").hide();
                        $("#tbl_chart4").show();

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
    <style>
        /* 그래프 */
        .rd_wrap {
            width: 100%;
            float: left;
            height: 30px;
        }

            .rd_wrap .rd_inner_wrap {
                width: 350px;
                margin: auto;
                height: 50px;
            }

            .rd_wrap span {
                width: 100px;
                float: left;
            }

                .rd_wrap span.sp_tit {
                    height: 20px;
                    line-height: 20px;
                    font-weight: bold;
                }

            .rd_wrap input[type=radio] {
                width: 20px;
                height: 20px;
                border: 1px solid black;
                appearance: auto;
                margin-right: 10px;
            }

            .rd_wrap span.sp_bonus-y {
                height: 20px;
                line-height: 20px;
            }

            .rd_wrap span.sp_bonus-n {
                height: 20px;
                line-height: 20px;
            }

        .tbl_data {
            width: 100%;
            min-height: 1000px;
            float: left;
            border-collapse: collapse;
            margin-top: 10px;
        }

            .tbl_data th {
                height: 20px;
                border: 1px solid #d2d2d2;
                background-color: #d7d7d7;
                color: #ffffff;
                padding: 5px;
                text-align: center;
            }

            .tbl_data td {
                height: 20px;
                border: 1px solid #d2d2d2;
                text-align: center;
            }

                .tbl_data td .graph_bar .bar {
                    float: left;
                    margin-top: 10px;
                }

                .tbl_data td .graph_bar .color1 {
                    background-color: #FCC43D;
                }

                .tbl_data td .graph_bar .color2 {
                    background-color: #8CC6E7;
                }

                .tbl_data td .graph_bar .color3 {
                    background-color: #F18D80;
                }

                .tbl_data td .graph_bar .color4 {
                    background-color: #A7A2DE;
                }

                .tbl_data td .graph_bar .color5 {
                    background-color: #6BCE9E;
                }

            .tbl_data .ball_645 {
                border: 1px solid #ffffff;
                border-radius: 50%;
                font-weight: bold;
                color: #ffffff;
                width: 22px;
                height: 22px;
                display: inline-block;
                line-height: 22px;
            }

                .tbl_data .ball_645.ball1 {
                    background-color: #FCC43D;
                }

                .tbl_data .ball_645.ball2 {
                    background-color: #8CC6E7;
                }

                .tbl_data .ball_645.ball3 {
                    background-color: #F18D80;
                }

                .tbl_data .ball_645.ball4 {
                    background-color: #A7A2DE;
                }

                .tbl_data .ball_645.ball5 {
                    background-color: #6BCE9E;
                }
        /* 방문자 */
        .visit_wrap {
            height: 20px;
            line-height: 20px;
            float: left;
            background-color: #ffffff;
            width: 100%;
            padding-top: 30px;
            padding-bottom: 20px;
        }

            .visit_wrap .inner_wrap {
                margin: auto;
                width: 300px;
            }

                .visit_wrap .inner_wrap span {
                    width: 80px;
                }

                    .visit_wrap .inner_wrap span.sp_tit {
                        font-weight: bold;
                        margin-right: 10px;
                        border-left: 1px solid #d2d2d2;
                        padding-left: 10px;
                    }

                        .visit_wrap .inner_wrap span.sp_tit:first-child {
                            border: none;
                        }

                    .visit_wrap .inner_wrap span.sp_con {
                        margin-right: 10px;
                    }
    </style>

</asp:Content>
