<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Stores.aspx.cs" Inherits="Gyunbox40.Vue.Stores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-index app-stores">
        <div class="section section-0" style="height: 120px;">
            <span style="color: #176D64; padding-left: 7px; font-weight: bold; font-size: 15pt; height: 30px; line-height: 30px;">안녕하세요</span><br />
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">나의 로또 일상을 기록하는 로또그램입니다.</span>
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">당첨된 지역을 확인해보세요!</span>
        </div>
        <div class="section section-1">
            <!-- 당첨결과 선택해서 조회 가능하도록 수정 -->
            <h2 style="width: 100%; text-align: center; padding-bottom: 30px;">
                <span style="color: #B40000; font-size: 15pt;">721회 </span><span style="color: #514856; font-size: 15pt;">당첨결과</span>
                <span style="width: 100%; line-height: 20px; float: left; font-size: 10pt; color: #A5A5A5; height: 20px; margin-top: -5px;">( 2020-07-25일 추첨 )</span>
            </h2>
            <ul>
                <li>
                    <div class="ball_wrap">
                        <span class="lottoBall ball_1" style=""><span class="ball_con"></span></span>
                        <span class="lottoBall ball_2" style=""><span class="ball_con"></span></span>
                        <span class="lottoBall ball_3" style=""><span class="ball_con"></span></span>
                        <span class="lottoBall ball_4" style=""><span class="ball_con"></span></span>
                        <span class="lottoBall ball_5" style=""><span class="ball_con"></span></span>
                        <span class="lottoBall ball_6" style=""><span class="ball_con"></span></span>
                        <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                        <span class="last lottoBall ball_7" style=""><span class="ball_con"></span></span>
                    </div>
                </li>
            </ul>
        </div>
        <div class="section-hf">
            <table class="tbl_stores">
                <thead>
                    <tr>
                        <th>등수</th><th>구입처</th><th>구분</th><th>주소</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_stores" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%#Eval("ord")%>
                                </td>
                                <td><%#Eval("store_name")%></td>
                                <td><%#Eval("buy_gub")%></td>
                                <td><%#Eval("store_add")%> <a href="javascript:;" onclick="alert('<%#Eval("store_loc")%>');">map</a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <div class="section section-3"></div>
    </div>
</asp:Content>
