using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;

namespace Gyunbox40.Vue
{
    public partial class CreateNumber : System.Web.UI.Page
    {
        public List<int> datas = new List<int>(); //행운의 번호 - 서버에서 제공해줄 번호!
        public string IsLogin = "N";
        CommonController cc = new CommonController();
        Util util = new Util();

        protected void Page_Load(object sender, EventArgs e)
        {
            Index index = new Index();
            Util util = new Util();
            IsLogin = (util.NullToBlank(new CommonController().g_USER_ID) != "") ? "Y" : "N";
            //세션으로 바꿔야함....

            if (util.NullToBlank(cc.g_PUSH_NUM) == "")
            {
                index.GetLuckyNumber();
                datas = cc.g_PUSH_NUM.Split('|').Select(Int32.Parse).ToList();
            }
            else
            {
                //string[] tmp = cc.g_PUSH_NUM.Split('|');
                datas = cc.g_PUSH_NUM.Split('|').Select(Int32.Parse).ToList();
            }


        }
    }
}