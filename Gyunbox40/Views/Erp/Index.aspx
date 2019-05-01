<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Gyunbox40.Views.Erp.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="/Content/js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <style type="text/css">
        html,body,ul,li,a,img,h1,h2,h3,div,p,a{margin:0px; padding:0px; font-size:15px; color:black; text-decoration:none;}
        .erp_wrap{width:100%; min-width:1200px; min-height:1000px; background-color:#d2d2d2;}
        .erp_wrap a{color:#ffffff;text-decoration:none;}
        .erp_wrap .main_top{height:100px;border:1px solid red;width:100%;}
        .erp_wrap .main_con{height:800px;border:1px solid blue;  width:1600px;}
        .erp_wrap .main_bot{height:100px; border:1px solid green; width:100%;}
        .erp_wrap .main_con .main_left{width:200px; height:800px; float:left; background-color:#1E1E1E; color:#ffffff;}
        .erp_wrap .main_con .main_con{width:1300px; height:800px; background-color:white; float:left;}
        .erp_wrap .main_con .main_con #main_frame{width:100%; height:100%;}

        .erp_wrap .main_con .main_left .sub_box{float:left; padding-bottom:20px;}
        .erp_wrap .main_con .main_left .sub_box .sub_title {width:180px;padding-left:20px;min-height:40px;line-height:40px; background-color:#3E3E42; border-bottom:1px solid #1E1E1E; color:#ffffff; float:left; height:30px;}
        .erp_wrap .main_con .main_left .sub_box .sub_con{width:180px;}
        .erp_wrap .main_con .main_left .sub_box .sub_con li{height:30px; color:#ffffff;float:left;width:180px;line-height:30px; border-bottom:1px solid #ffffff; padding-left:20px;}
        .erp_wrap .main_con .main_left .sub_box .sub_con li.li_last{border:none;}
        .erp_wrap .main_con .main_left .sub_box .sub_con li a{width:100%; float:left;}
    </style>
    <script type="text/javascript">
        function changeMainFrame(frameNumber) {
            if (frameNumber == "100001") {
                $("#main_frame").attr("src", "FormIndex.aspx");
            } else if (frameNumber == "200001") {
                $("#main_frame").attr("src", "AddMember.aspx");
            } else if (frameNumber == "300001") {
                $("#main_frame").attr("src", "ManageDepart.aspx");
            }
        }
    </script>
    <form id="form1" runat="server">
        <div class="erp_wrap">
            <div class="main_top"></div>
            <div class="main_con">
                <div class="main_left">
                    <div class="sub_box box_1">
                        <a href="javascript:;" onclick="changeMainFrame('100000');" class="sub_title">전자결재</a>
                        <ul class="sub_con sub_1">
                            <li><a href="javascript:;" onclick="changeMainFrame('100001');">품의문서</a></li>
                            <li><a href="javascript:;" onclick="changeMainFrame('100002');">미결재함</a></li>
                            <li><a href="javascript:;" onclick="changeMainFrame('100003');">기결함</a></li>
                            <li><a href="javascript:;" onclick="changeMainFrame('100004');">문서접수대장</a></li>
                            <li class="li_last"><a href="javascript:;" onclick="changeMainFrame('100005');">문서발송대장</a></li>
                        </ul>
                    </div>
                    <div class="sub_box box_2">
                        <a href="javascript:;" onclick="changeMainFrame('200000');"  class="sub_title">인사관리</a>
                        <ul class="sub_con sub_2">
                            <li><a href="javascript:;" onclick="changeMainFrame('200001');">사원등록</a></li>
                            <li><a href="javascript:;" onclick="changeMainFrame('200002');">정보수정</a></li>
                            <li class="li_last"><a href="javascript:;" onclick="changeMainFrame('200003');">급여관리</a></li>
                        </ul>
                    </div>
                    <div class="sub_box box_3">
                        <a href="javascript:;" onclick="changeMainFrame('300000');"  class="sub_title">관리자</a>
                        <ul class="sub_con sub_3">
                            <li><a href="javascript:;" onclick="changeMainFrame('300001');">부서관리</a></li>
                            <li class="li_last"><a href="javascript:;" onclick="changeMainFrame('300002');">정보수정</a></li>
                        </ul>
                    </div>
                </div>
                <div class="main_con">
                    <iframe id="main_frame" src="AddMember.aspx"></iframe>
                </div>
            </div>
            <div class="main_bot"></div>
        </div>
    </form>
</body>
</html>
