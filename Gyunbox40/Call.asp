<% @ LANGUAGE ="VBSCRIPT" CODEPAGE="65001"%>
<%
Option Explicit
Response.Buffer = True
Response.Expires = -1
Response.AddHeader "Pragma","no-cache"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<script src="/Content/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
    alert("test");
});


var timer =0; 

function resetTimer(){
    $("#hid_sec").val(0);$("#sec").html("0"); 
} 

function startTimer(){
    
    timer = setInterval(function () {
            $("#hid_sec").val(Number($("#hid_sec").val()) + 1);
            $("#sec").html($("#hid_sec").val());}
        , 1000); 
} 

function stopTimer(){
    clearInterval(timer); 
} 



function calProc(gub){
    $.ajax({
        type : 'POST',
        url : "Proc.asp",
        data : "gub=" + gub,
        error : function(error) {
            alert("Error!");
        },
        beforeSend:function(){
            startTimer();
        },
        success : function(data) {
            if(data == 0)
            {
                alert("성공");
            }else{
                alert("실패!!!!!!!!!!!");
            }
        },
        complete : function() {
            stopTimer();  
            alert("처리시간 : " + $("#hid_sec").val());
            resetTimer();
        }
    });

}

</script>
<body>
    <input type="hidden" value="0" id="hid_sec"/>
    처리시간 : <span id="sec">0</span>
    <a href="javascript:;" onclick="javascript:calProc('KW');">프로시저 호출</a>
</body>
</html>