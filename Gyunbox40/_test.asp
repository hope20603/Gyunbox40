<!DOCTYPE html>
<html>
<head>
    <title>테스트페이지</title>
</head>
<script src="/content/js/jquery-3.3.1.min.js"></script>
<script>
    $(document).ready(function(){
        alert("test");
    });

    function funcTest(){
        alert('click');
        }
</script>
<body>
<div>
<a href="javascript:;" onclick="javscript:funcTest();">클릭하시오</a>
</div>
<table>
<%
for i = 0 to 100 step 1
%>
<tr><Td><%=i%></td></tr>
<%
next
%>
</table>
</body>
</html>