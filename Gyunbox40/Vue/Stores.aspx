<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Stores.aspx.cs" Inherits="Gyunbox40.Vue.Stores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-index app-stores">
        <div>
            <ins class="kakao_ad_area" style="display:none;" 
 data-ad-unit    = "DAN-sohv6m57ry9i" 
 data-ad-width   = "320" 
 data-ad-height  = "50"></ins> 
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>

        </div>
        <div class="section section-0" style="height:90px;padding-top:0px;">
            <span style="color: #176D64; padding-left: 7px; font-weight: bold; font-size: 15pt; height: 30px; line-height: 30px;">안녕하세요</span><br />
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">나의 로또 일상을 기록하는 로또그램입니다.</span>
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">당첨된 지역을 확인해보세요!</span>
        </div>
        <div class="section section-1">
            <h2 style="width: 100%; text-align: center; padding-bottom: 30px;">
                <%--<span style="color: #B40000; font-size: 15pt;"><%=htLot["seq"]%>회 </span><span style="color: #514856; font-size: 15pt;">당첨결과</span>
                <span style="width: 100%; line-height: 20px; float: left; font-size: 10pt; color: #A5A5A5; height: 20px; margin-top: -5px;">( <%=htLot["win_date"]%>일 추첨 )</span>--%>
                <!-- 당첨결과 선택해서 조회 가능하도록 수정 -->
                <span class="sp_search">
                    <asp:DropDownList ID="ddl_lotSeq" runat="server" OnDataBound="ddl_lotSeq_DataBound" AutoPostBack="True" OnSelectedIndexChanged="ddl_lotSeq_SelectedIndexChanged"></asp:DropDownList>
                </span>
                <span style="color: #514856; font-size: 14pt; margin-left:5px;">당첨결과</span>
            </h2>
            <ul>
                <li>
                    <div class="ball_wrap">
                        <span class="lottoBall ball_1 <%=htLot["num1_class"]%>" style=""><span class="ball_con"><%=htLot["num1"]%></span></span>
                        <span class="lottoBall ball_2 <%=htLot["num2_class"]%>" style=""><span class="ball_con"><%=htLot["num2"]%></span></span>
                        <span class="lottoBall ball_3 <%=htLot["num3_class"]%>" style=""><span class="ball_con"><%=htLot["num3"]%></span></span>
                        <span class="lottoBall ball_4 <%=htLot["num4_class"]%>" style=""><span class="ball_con"><%=htLot["num4"]%></span></span>
                        <span class="lottoBall ball_5 <%=htLot["num5_class"]%>" style=""><span class="ball_con"><%=htLot["num5"]%></span></span>
                        <span class="lottoBall ball_6 <%=htLot["num6_class"]%>" style=""><span class="ball_con"><%=htLot["num6"]%></span></span>
                        <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                        <span class="last lottoBall ball_7 <%=htLot["num7_class"]%>" style=""><span class="ball_con"><%=htLot["num7"]%></span></span>
                    </div>
                </li>
            </ul>
        </div>
        <div class="section-hf div_list-winner">
            <h1 class="title">등수별 당첨 정보</h1>
            <asp:Repeater ID="rpt_winner" runat="server" OnItemDataBound="rpt_winner_ItemDataBound">
                <ItemTemplate>
                    <div class="listBox">
                        <div class="win-ord"><%#Eval("ORD")%>등</div>
                        <div class="win-cnt"><%#Eval("CNT")%>명</div>
                        <div class="win-mny">
                            <%#Eval("MNY")%>
                            <span class="sp_real">
                                (실 수령액 : <span class="sp_hi"><asp:Label ID="lbl_realGet" runat="server" Text="Label"></asp:Label></span> 원 )
                            </span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="section-hf div_list-stores">
            <h1 class="title">1등 판매점</h1>
            <asp:Repeater ID="rpt_stores" runat="server">
                <ItemTemplate>
                    <div class="listBox ord-<%#Eval("ord")%>">
                        <div class="store-ord"><%#Eval("ord")%></div>
                        <div class="store-name">
                            <span class="sp_name"><%#Eval("store_name")%></span>
                            <span class="sp_map_icon">
                                <a href="StoresMap.aspx?seq=<%=seq%>&loc=<%#Eval("store_loc")%>">
                                    <img src="../images/icon/icons8-map-marker-100.png" alt="map" class="icon-small" />
                                </a>
                            </span>
                        </div>
                        <div class="store-address"><%#Eval("store_add")%></div>
                        <div class="store-gub"><%#Eval("buy_gub")%></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <%--<div class="section section-3"></div>--%>
    </div>
</asp:Content>
