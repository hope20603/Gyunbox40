using Gyunbox40.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Gyunbox40.Controller
{
    public class MemberController : Common.CommonController
    {
        public bool Login(DataSet ds)
        {
            g_USER_ID = ds.Tables[0].Rows[0]["UID"].ToString();
            //HttpContext.Current.Session["userID"] = g_USER_ID;
            return true;
        }

        public void WriteLoginLog(string refUrl, string uid )
        {
            DaDdogram daModel = new DaDdogram();
            daModel.SetLoginLog(refUrl, uid);
        }
    }
}