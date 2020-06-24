using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;

namespace Gyunbox40.Share
{
    public partial class Vue : System.Web.UI.MasterPage
    {
        CommonController cc = new CommonController();
        Util util = new Util();
        protected string loginState = "";
        protected string joinStr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = cc.g_USER_ID;

            if (id != "")
            {
                loginState = "<a href = 'Logout.aspx' >로그아웃</a>";
                joinStr = "";
            }
            else
            {
                loginState = "<a href = 'Login.aspx' >로그인</a>";
                joinStr = "<a href = 'Join.aspx'>회원가입</a>";
            }
        }
    }
}