using Gyunbox40.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Model;
using System.Data;

namespace Gyunbox40.Vue
{
    public partial class ManageNumber : System.Web.UI.Page
    {
        public string jsonString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            CommonController cc = new CommonController();
            DaDdogram daDDo = new DaDdogram();
            Util util = new Util();
            
            //로그인 된 사람만 이용가능한 페이지임
            //만약 로그인이 되어 있지 않으면 회원가입페이지로 유도하면 됨....
            //회원가입 페이지로 유도할때 이전 페이지 URL을 기억해두면 제일 좋음..
            //CommonController cc = new CommonController();
            //if(cc.g_USER_ID == "")
            //{
            //    Response.Write("<script>alert('로그인 후 이용가능합니다!'); location.href='Login.aspx?Ref=ManageNumber.aspx'</script>");
            //    Response.End();
            //}

            cc.g_USER_ID = (Util.IsNullOrBlank(cc.g_USER_ID)) ? "hope20603@naver.com" : cc.g_USER_ID;

            DataSet ds = daDDo.GetMyNumber(cc.g_USER_ID);

            if (!util.ChkDsIsNull(ds))
            {
                jsonString = util.DataTableToJSONWithStringBuilder(ds.Tables[0]);
            }

        }
    }
}