<%@ Page Title="홈 페이지" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Gyunbox40._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content">
      	<section class="display-section">
      		<div class="container">
      			<h2 class="sec-tit">Web Programmer</h2>
      			<p class="desc">
      			    ASP.NET MVC(C#), ASP.NET Webform, ASP, Javascript, jQuery, HTML, CSS, Vue.js, ORACLE, DB2, MS-SQL
                </p>
			</div>
		</section>
		<section class="promotion-section">
			<div class="container">
				<ul class="promo-list">
					<li>
						<a href="/Views/Home/About.aspx">
							<img src="/images/s-images/promo02.png" alt="">
							<h3>Web Programmer</h3>
							<p>
								개발자 소개
							</p>
						</a>
					</li>
					<li>
						<a href="/Views/Home/Portfolio.aspx">
							<img src="/images/s-images/promo03.png" alt="">
							<h3>Portfolio</h3>
							<p>
								개발 및 유지보수 업무 리스트
							</p>
						</a>
					</li>
					<%--<li>
						<a href="/Views/Home/Contact.aspx">
							<img src="/images/s-images/promo04.png" alt="">    
							<h3>Contact</h3>
							<p>
								개발자에게 문의
							</p>
						</a>
					</li>--%>
				</ul>		
			</div>
		</section>
		<hr class="divider">
		<%--<section class="work-section cfixed">
		 	<h2 class="sec-tit">WORK</h2>
		 	<ul class="work-list">
		 		<li>
		 			<a href="">
		 				<div class="info">
		 					<h3>Running</h3>
		 					<span>WEB/PRINT</span>
		 				</div>
		 				<img src="/images/p-images/work01.jpg" alt=""/>
					</a>
				</li>
				<li>
		 			<a href="">
		 				<div class="info">
		 					<h3>Rugby</h3>
		 					<span>WEB/PRINT</span>
		 				</div>
		 				<img src="/images/p-images/work02.jpg" alt=""/>
					</a>
				</li>
				<li>
		 			<a href="">
		 				<div class="info">
		 					<h3>Weight</h3>
		 					<span>WEB/PRINT</span>
		 				</div>
		 				<img src="/images/p-images/work03.jpg" alt=""/>
					</a>
				</li>
				<li>
		 			<a href="">
		 				<div class="info">
		 					<h3>Marathon</h3>
		 					<span>WEB/PRINT</span>
		 				</div>
		 				<img src="/images/p-images/work04.jpg" alt=""/>
					</a>
				</li>
				<li>
		 			<a href="">
		 				<div class="info">
		 					<h3>Boxing</h3>
		 					<span>WEB/PRINT</span>
		 				</div>
		 				<img src="/images/p-images/work05.jpg" alt=""/>
					</a>
				</li>
				<li>
		 			<a href="">
		 				<div class="info">
		 					<h3>Ice Hockey</h3>
		 					<span>WEB/PRINT</span>
		 				</div>
		 				<img src="/images/p-images/work06.jpg" alt=""/>
					</a>
				</li>
				<li>
		 			<a href="">
		 				<div class="info">
		 					<h3>Skate Board</h3>
		 					<span>WEB/PRINT</span>
		 				</div>
		 				<img src="/images/p-images/work07.jpg" alt=""/>
					</a>
				</li>
				<li>
		 			<a href="">
		 				<div class="info">
		 					<h3>Basketball</h3>
		 					<span>WEB/PRINT</span>
		 				</div>
		 				<img src="/images/p-images/work08.jpg" alt=""/>
					</a>
				</li>
		 	</ul>
		</section>
		<hr class="m-divider">
		<section class="blog-section">
		 	<div class="container">
		 		<h2 class="sec-tit">BLOG</h2>
		 		<ul class="blog-list">
		 			<li>
		 				<a href=""><img src="/images/p-images/blog01.jpg" alt=""></a>
		 				<time datetime="2016-01-01">OCT 30, 2016</time>
		 				<a href=""><h3>There are many variations of passages of Lorem Ipsum</h3></a>
					</li>
					<li>
		 				<a href=""><img src="/images/p-images/blog01.jpg" alt=""></a>
		 				<time datetime="2017-10-30">OCT 30, 2016</time>
		 				<a href=""><h3>There are many variations of passages of Lorem Ipsum</h3></a>
					</li>
					<li>
		 				<a href=""><img src="/images/p-images/blog01.jpg" alt=""></a>
		 				<time datetime="2018-01-30">OCT 30, 2016</time>
		 				<a href=""><h3>There are many variations of passages of Lorem Ipsum</h3></a>
					</li>
		 		</ul>
		 	</div>
		</section>--%>
		<section class="contact-section" style="display:none;">
		 	<div class="container">
		 		<h2 class="sec-tit">CONTACT</h2>
		 		<div class="form-box">
		 			<form action="" method="post" name="cForm" id="cForm">
		 				<fieldset class="cfixed">
		 					<legend class="blind">CONTACT US</legend>
		 					<div class="form">
		 						<label for="name" class="blind">name</label>
		 						<input type="text" id="name" placeholder="Name" name="NAME">
		 						<label for="phone" class="blind">phone</label>
		 						<input type="text" id="phone" placeholder="Phone" name="PHONE">
		 						<label for="email" class="blind">email</label>
		 						<input type="text" id="email" placeholder="Email Address" name="EMAIL">
							</div>
							<div class="textarea">
								<label for"message" class="blind">message</label>
								<textarea id="message" placeholder="Message" name="MSG" maxlength="1000"></textarea>
							</div>
							<div class="send-btn">
								<button onclick="fnContact(); return false;">문의하기</button>
							</div>
		 				</fieldset>
		 			</form>
		 		</div>
		 	</div>
		</section>
	   </section>
    <!-- End of Content -->
    <footer class="footer">
	   	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3166.755232775193!2d126.8867087655668!3d37.466500687608026!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b61e9df3897b5%3A0x55a7c7706324106b!2z64-F7IKw7Jet!5e0!3m2!1sko!2skr!4v1532249072475" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
	</footer>
    <script type="text/javascript">
        //입력값 초기화
        function setInit() {
            $("#name").val("");
            $("#phone").val("");
            $("#email").val("");
            $("#message").val("");
        }

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
                var postUrl = "/Home/SaveContact";
                var param = $("#cForm").serialize() + "&gub=INDEX";

                $.ajax({
                    type: "POST",
                    url: postUrl,
                    dataType: "html",
                    data: param,
                    success: function (data, status) {
                        if (data == "0") {
                            //등록 성공
                            alert("문의가 정상적으로 등록되었습니다.");
                            setInit();
                        } else {
                            //등록 실패
                            alert("등록중 문제가 발생 하였습니다.\n다시 시도해주세요.");
                            location.href = "/Home/Index";
                        }
                    },
                    beforeSend: function () {

                    },
                    complete: function () {

                    },
                    error: function () {
                        alert("등록중 문제가 발생 하였습니다.\n다시 시도해주세요.");
                        location.href = "/Home/Index";
                    }
                });
            }
        }

    </script>
</asp:Content>

