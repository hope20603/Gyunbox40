<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Vue.Master" AutoEventWireup="true" CodeBehind="FindUser.aspx.cs" Inherits="Gyunbox40.Vue.FindUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="app" class="app-calc">
        <div>
            <ins class="kakao_ad_area" style="display: none;"
                data-ad-unit="DAN-sohv6m57ry9i"
                data-ad-width="320"
                data-ad-height="50"></ins>
            <script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>

        </div>
        <div class="section section-0" style="">
            <span style="color: #176D64; padding-left: 7px; font-weight: bold; font-size: 15pt; height: 30px; line-height: 30px;">안녕하세요</span><br />
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">나의 로또 일상을 기록하는 로또집사 사이트입니다.</span>
            <span style="width: 100%; float: left; box-sizing: border-box; padding-left: 7px;">로또로 집사!</span>
        </div>
        <div class="section section-2" style="height:550px;">
            <h1>비밀번호 찾기</h1>
            <div>
                <div class="input_wrap">
                    <h2>아이디</h2>
                    <asp:TextBox ID="tb_uid" runat="server"  CssClass="txt_wide txt_gray" placeholder="아이디"></asp:TextBox>
                    <h2 style="margin-top:30px;">이메일</h2>
                    <asp:TextBox ID="tb_eml" runat="server"  CssClass="txt_wide txt_gray" placeholder="이메일"></asp:TextBox>
                </div>
            </div>
            <div class="btn_wrap">
                <asp:Button ID="btn_find" OnClientClick="return CheckValue();" OnClick="btn_find_Click"  runat="server" Text="비밀번호찾기" CssClass="btn_green" />
            </div>
            <div class="result_wrap" style="height:80px; padding:5px; background-color:#F4F4F4; box-size:border-box;">
                <div class="inner" style="font-size:20px;padding-top:36px;">
                    <asp:Literal ID="ltl_result" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
        <div class="section-add">
            <div style="width:50%;float:left;overflow:hidden;"><ins class="kakao_ad_area" style="display:none;" 
 data-ad-unit    = "DAN-1k1ty6cac4h9g" 
 data-ad-width   = "250" 
 data-ad-height  = "250"></ins> 
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script></div>
            <div style="width:50%;float:right;overflow:hidden;">
                <ins class="kakao_ad_area" style="display:none;" 
 data-ad-unit    = "DAN-1iextrvmvi52u" 
 data-ad-width   = "250" 
 data-ad-height  = "250"></ins> 
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
            </div>
        </div>
    </div>
    <script>
        function CheckValue() {
            var tb = "<%=tb_uid.ClientID%>";
            var tw = "<%=tb_eml.ClientID%>";

            var chkValue = $("#" + tb).val();
            var chkValue2 = $("#" + tw).val();

           if (chkValue == "") {
               alert('아이디를 입력해주세요.');
               return false;
            }

            if (chkValue2 == "") {
                alert('이메일을 입력해주세요.');
                return false;
            }

           return true;
       }
    </script>
</asp:Content>
