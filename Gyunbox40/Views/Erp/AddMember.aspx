<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="Gyunbox40.Views.Erp.AddMember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>직원등록</title>
</head>
<style type="text/css">
    .add_member_wrap {
        width: 100%;
    }

        .add_member_wrap .mem_tit {
        }

        .add_member_wrap .mem_con {
        }

            .add_member_wrap .mem_con table {
                width: 800px;
                border: 1px solid black;
                border-collapse: collapse;
            }

                .add_member_wrap .mem_con table input {
                    height: 40px;
                    padding: 2px;
                    width: 99%;
                    font-size: 20px;
                    border: none;
                }

                .add_member_wrap .mem_con table td {
                    border: 1px solid #000000;
                    height: 40px;
                }
</style>
<body>
    <form id="form1" runat="server">
        <div class="add_member_wrap">
            <div class="mem_tit">
                직원등록
            </div>
            <div class="mem_con">
                <table>
                    <caption>신규 직원 정보를 등록</caption>
                    <thead></thead>
                    <tbody>
                        <tr>
                            <td>이름</td>
                            <td><input type="text" value="" id="txt_name" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>나이</td>
                            <td><input type="text" value="" id="txt_age" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><input type="text" value="" id="txt_email" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>입사일</td>
                            <td><input type="text" value="" id="txt_jin"  runat="server" /></td>
                        </tr>
                        <tr>
                            <td>직급</td>
                            <td><input type="text" value="" id="txt_level" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td><input type="text" value="" id="txt_tel" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td><input type="text" value="" id="txt_phn" runat="server" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="mem_bot">
                <asp:Button ID="btnSave" runat="server" Text="저  장" OnClick="btnSave_Click" />
            </div>
        </div>
    </form>
</body>
</html>
