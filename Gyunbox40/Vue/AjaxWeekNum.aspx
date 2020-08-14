<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Ajax.Master" AutoEventWireup="true" CodeBehind="AjaxWeekNum.aspx.cs" Inherits="Gyunbox40.Vue.AjaxWeekNum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="week_wrap">
        <div class="section_title">
            <h2><strong class="round key_clr1" id="lottoDrwNo"><%=model.SEQ%>회</strong> 당첨번호</h2>
            <span class="date" id="drwNoDate"><%=model.WIN_DATE%> 기준</span>
        </div>
        <div class="week_con">
            <a href="javascript:;" onclick="changeWeekAjax(<%=model.PREVNO%>);" class="btn btn_prev">
                <img src="../images/icon/icon-prev.png" alt="이전" />
            </a>
            <div class="con_con">
                <div class="prizeresult">
                    <div class="num clr<%=model.COL1%>"><span><%=model.NUM1%></span></div>
                    <div class="num clr<%=model.COL2%>"><span><%=model.NUM2%></span></div>
                    <div class="num clr<%=model.COL3%>"><span><%=model.NUM3%></span></div>
                    <div class="num clr<%=model.COL4%>"><span><%=model.NUM4%></span></div>
                    <div class="num clr<%=model.COL5%>"><span><%=model.NUM5%></span></div>
                    <div class="num clr<%=model.COL6%>"><span><%=model.NUM6%></span></div>
                    <div class="num bonus clr<%=model.COL7%>"><span><%=model.NUM7%></span></div>
                </div>
            </div>
            <a href="javascript:;" onclick="changeWeekAjax(<%=model.NEXTNO%>);" class="btn btn_next">
                <img src="../images/icon/icon-next.png" alt="다음" />
            </a>
        </div>
    </div>
    <style>
        
/* 새로운 디자인 - 로또페이지 참고 */

.week_wrap {
    width: 100%;
    height: 100px;
    padding:10px 0;
    background-color:#ffffff;
    position:relative;
}

    .week_wrap .btn {
        position: absolute;
        top: 65px;
    }

        .week_wrap .btn img {
            width: 10px;
        }

        .week_wrap .btn.btn_prev {
            left: 10px;
        }

        .week_wrap .btn.btn_next {
            right: 10px;
        }

    .week_wrap .prizeresult {
        text-align: center;
    }

.prizeresult .num {
    display: inline-block;
    width: 30px;
    height: 30px;
    line-height: 30px;
    font-weight: 700;
    font-size: 13px;
    color: #fff;
    letter-spacing: -0.025em;
    text-align: center;
    border-radius: 100%
}

    .prizeresult .num ~ .num {
        margin-left: 3px
    }

.prizeresult .clr1 {
    background: #e4a816 /*1~10*/
}

.prizeresult .clr2 {
    background: #1994da /*11~20*/
}

.prizeresult .clr3 {
    background: #e86352 /*21~30*/
}

.prizeresult .clr4 {
    background: #8f8f8f /*31~40*/
}

.prizeresult .clr5 {
    background: #5bb544 /*41~45*/
}

.prizeresult .num.bonus {
    position: relative;
    margin-left: 23px
}

    .prizeresult .num.bonus:after {
        content: "";
        position: absolute;
        left: -17px;
        top: 50%;
        z-index: 1;
        width: 9px;
        height: 9px;
        margin-top: -5px;
        background: url(/images/icon/icons8-plus-math-30.png) 0 0 no-repeat;
        background-size: 9px auto
    }


.week_wrap .section_title {
    position: relative;
    padding-top: 7px
}

    .week_wrap .section_title h2 {
        padding-bottom: 13px;
        font-weight: 700;
        font-size: 17px;
        color: #333;
        letter-spacing: -0.025em;
        text-align:center;

    }

    .week_wrap .section_title .date {
        position: absolute;
        right: 10px;
        top: 0;
        font-size: 11px;
        color: #888;
        letter-spacing: 0
    }

    .week_wrap .section_title .cap {
        padding-bottom: 16px;
        font-size: 13px;
        color: #333;
        letter-spacing: 0
    }
    </style>
</asp:Content>
