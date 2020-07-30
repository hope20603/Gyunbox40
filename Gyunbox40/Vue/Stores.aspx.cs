using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Model;

namespace Gyunbox40.Vue
{
    public partial class Stores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DaDdogram daDdo = new DaDdogram();
            DataSet ds = daDdo.GetStores("921");
            rpt_stores.DataSource = ds.Tables[0].DefaultView;
            rpt_stores.DataBind();

        }
    }
}