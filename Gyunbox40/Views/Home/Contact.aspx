<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Gyunbox40.Views.Home.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="contact-section">
		 	<div class="container">
		 		<h2 class="location">CONTACT</h2>
                <div class="form-box">
		 			<form action="/Views/Home/SaveContent.aspx" method="post" id="cForm">
		 				<fieldset class="cfixed">
		 					<legend class="blind">CONTACT US</legend>
		 					<div class="form">
		 						<label for="name" class="blind">name</label>
		 						<input type="text" id="name" placeholder="Name" name="name">
		 						<label for="phone" class="blind">phone</label>
		 						<input type="text" id="phone" placeholder="Phone" name="phone">
		 						<label for="email" class="blind">email</label>
		 						<input type="text" id="email" placeholder="Email Address" name="email">
							</div>
							<div class="textarea">
								<label for"message" class="blind">message</label>
								<textarea id="message" placeholder="Message" name="msg" maxlength="1000"></textarea>
							</div>
							<div class="send-btn">
								<button onclick="fnContact(); return false;">문의하기</button>
							</div>
		 				</fieldset>
		 			</form>
		 		</div>
            </div>
		</section>
        <script type="text/javascript">

            function chkValidation() {
                if ($("#name").val() == "") {
                    alert("이름을 입력해주세요");
                    $("#name").focus();
                    return false;
                } else if ($("#phone").val() == "") {
                    alert("연락처를 입력해주세요");
                    $("#phone").focus();
                    return false;
                } else if (!Validation.isOnlyNumeric($("#phone").val())) {
                    alert("전화번호는 하이픈등의 특수기호를 제외한 숫자만 입력하셔야 합니다.");
                    $("#phone").focus();
                    return false;
                } else if (!Validation.isValidCellPhone($("#phone").val())) {
                    alert("전화번호를 다시 확인해주세요.");
                    $("#phone").focus();
                    return false;
                } else if ($("#email").val() == "") {
                    alert("이메일을 입력해주세요");
                    $("#email").focus();
                    return false;
                } else if (!Validation.isValidEmail($("#email").val())) {
                    alert("이메일 형식을 확인해주세요.");
                    $("#email").focus();
                    return false;
                } else if ($("#message").val() == "") {
                    alert("문의내용을 입력해주세요");
                    $("#message").focus();
                    return false;
                } else {
                    return true;
                }
            }

            function fnContact() {
                if (chkValidation()) {
                    $("#cForm").submit();
                   
                }
            }
        </script>
</asp:Content>
