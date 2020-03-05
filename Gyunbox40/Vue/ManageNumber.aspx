<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="ManageNumber.aspx.cs" Inherits="Gyunbox40.Vue.ManageNumber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-manageNumber">
        <div class="section section-0">
            <span style="color: #176D64; padding-left: 7px; font-weight: bold; font-size: 15pt; height: 30px; line-height: 30px;">안녕하세요</span><br />
            <span style="padding-left: 7px;">{{ message }}</span>
        </div>
        <div class="section section-1">
            <h2>내가 저장한 번호</h2>
            <ul>
                <li v-for="(item, index) in listArr" class="li-numbers">
                    <div class="list-index">
                        <span>{{ index+1 }}</span>
                    </div>
                    <div class="list-con">
                        <div class="list-ball_wrap">
                            <span class="lottoBall ball_1">{{ item.num1 }}</span>
                            <span class="lottoBall ball_2">{{ item.num2 }}</span>
                            <span class="lottoBall ball_3">{{ item.num3 }}</span>
                            <span class="lottoBall ball_4">{{ item.num4 }}</span>
                            <span class="lottoBall ball_5">{{ item.num5 }}</span>
                            <span class="lottoBall ball_6">{{ item.num6 }}</span>
                            <span class="lottoBall plus_mark"><span class="ball_con">+</span></span>
                            <span class="last lottoBall  ball_7">{{ item.num7 }}</span>
                        </div>
                    </div>
                    <div class="list-tail">
                        <a @click=deleteNumber(index) title="삭제"><span class="btn_del"></span></a>
                    </div>
                </li>
            </ul>
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
        <div class="section section-4">광고</div>
    </div>
    <script>
        var listArr = [];
        var jsonStr = <%=jsonString%>;
        var pageSize = 10;
        var curPage = 1;

        listArr = jsonStr.slice(curPage, (curPage * pageSize) + 1);

        var app = new Vue({
            el: '#app',
            data: {
                message: '내가 좋아하는 번호들을 관리하세요.\n이번엔 당첨 될 수도 있습니다!!'
            },
            created() {

            },
            mounted() {
                //console.log(<%=jsonString%>);
                this.makePager(<%=jsonString%>);
                this.makeMyList(<%=jsonString%>);
            },
            methods: {
                deleteNumber() {
                    console.log("deleteNumber");
                },
                makePager() {
                    console.log("makePager");
                },
                makeMyList(jsonString) {
                    //console.log(jsonString);
                    //console.log(jsonString.length);
                    //listArr = jsonStr.slice(curPage, (curPage * pageSize) + 1);
                    //console.log(listArr);
                    //for (var i = 0; i < listArr.length; i++) {
                    //    console.log(listArr[i].createdDate);
                    //}
                    //console.log(listArr);
                    //var obj = JSON.parse(jsonString);
                    //console.log(obj);
                },
                actionPaging() {

                }
            }
        })
    </script>
    <style>
        

        
    </style>
</asp:Content>
