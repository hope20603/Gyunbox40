﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gyunbox40.Vue
{
    public partial class Login : System.Web.UI.Page
    {
        public string hostString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            hostString = new Common.CommonController().hostString;
        }
    }
}