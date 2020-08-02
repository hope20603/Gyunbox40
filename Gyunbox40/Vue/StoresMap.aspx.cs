using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;
using Gyunbox40.Model;

namespace Gyunbox40.Vue
{
    public partial class StoresMap : System.Web.UI.Page
    {
        CommonController cc;
        DaDdogram daddo;
        string locNumber = string.Empty;
        protected string seq = string.Empty;
        protected string mapX = string.Empty;
        protected string mapY = string.Empty;

        protected string store_name = string.Empty;
        protected string store_add = string.Empty;
        protected string win_cnt = string.Empty;

        LotStore ls;

        protected void Page_Load(object sender, EventArgs e)
        {
            cc = new CommonController();
            daddo = new DaDdogram();
            locNumber = cc.NullToBlank(Request["loc"]);
            seq = cc.NullToBlank(Request["seq"]);

            if (locNumber != "")
            {
                ls = daddo.GetStoreDetail(locNumber);
                store_name = ls.store_name;
                store_add = ls.store_add;
                win_cnt = ls.wincnt;
            }
        }
    }
}