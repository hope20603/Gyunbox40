<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="Calc.aspx.cs" Inherits="Gyunbox40.Vue.Calc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-calc">
        <div class="section section-0" style="">
            <span style="color: #176D64; padding-left: 7px; font-weight: bold; font-size: 15pt; height: 30px; line-height: 30px;">안녕하세요</span><br />
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">나의 로또 일상을 기록하는 로또그램입니다.</span>
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">실수령액을 계산해보세요.</span>
        </div>
        <div class="section section-1" style="height: 120px;">
            <h2 style="width: 100%; text-align: center; padding-bottom: 30px;">
                <span style="color: #B40000; font-size: 15pt;"><%=htLot["seq"]%>회 </span><span style="color: #514856; font-size: 15pt;">당첨결과</span>
                <span style="width: 100%; line-height: 20px; float: left; font-size: 10pt; color: #A5A5A5; height: 20px; margin-top: -5px;">( <%=htLot["win_date"]%>일 추첨 )</span>
                <!-- 당첨결과 선택해서 조회 가능하도록 수정 -->
                <%--<span class="sp_search">
                    <asp:DropDownList ID="ddl_lotSeq" runat="server" OnDataBound="ddl_lotSeq_DataBound" AutoPostBack="True" OnSelectedIndexChanged="ddl_lotSeq_SelectedIndexChanged"></asp:DropDownList>
                </span>--%>
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
        <div class="section section-2">
            <h1>실수령액 계산기</h1>
            <div>
                <div class="input_wrap">
                    <h2 class="blind">당첨금액입력</h2>
                    <asp:TextBox ID="tb_mny" runat="server" OnKeyPress="if((event.keyCode<48)|(event.keyCode>57))event.returnValue=false;" CssClass="txt_wide txt_gray" placeholder="당첨금액입력"></asp:TextBox>
                </div>
            </div>
            <div class="btn_wrap">
                <asp:Button ID="btn_cancel" OnClientClick="return Reset();" runat="server" Text="초기화" CssClass="btn_black"/>
                <asp:Button ID="btn_cal" OnClientClick="return CheckValue();" OnClick="btn_cal_Click"  runat="server" Text="실수령액계산" CssClass="btn_green"/>
            </div>
            <div class="result_wrap">
                <%--<asp:Label ID="lbl_result" runat="server" Text=""></asp:Label>--%>
                <div class="inner">
                <asp:Literal ID="ltl_result" runat="server"></asp:Literal>
                    </div>

            </div>
        </div>
    </div>
    <script>
        //$(document).ready(function () {
        //    alert("test");
        //});

        function CheckValue() {
            var tb = "<%=tb_mny.ClientID%>";
            var chkValue = $("#" + tb).val();

            if (chkValue == "") {
                alert('당첨금액을 입력해주세요.');
                return false;
            }

            if (isNaN(chkValue)) {
                alert('숫자만 입력해주세요.');
                return false;
            }
            return true;
        }

        function Reset() {
            var tb = "<%=tb_mny.ClientID%>";
            $("#" + tb).val("");
            return false;
        }
    </script>
</asp:Content>
