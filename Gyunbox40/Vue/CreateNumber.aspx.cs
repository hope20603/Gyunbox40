﻿using System;
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
        public string IsLogin = "N";

        protected void Page_Load(object sender, EventArgs e)
        {
            Util util = new Util();
            IsLogin = (util.NullToBlank(new CommonController().g_USER_ID) != "") ? "Y" : "N";
            //세션으로 바꿔야함....
        }
    }
}