using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GyunboxInsa.Views
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                SetLabel();
                MultiView1.ActiveViewIndex = 0;
            }
        }

        private void SetLabel()
        {
            DropDownList1.Items.Add(new ListItem("강승균"));
            DropDownList1.Items.Add(new ListItem("지은별"));
            DropDownList1.Items.Add(new ListItem("지은우"));
            DropDownList1.Items.Add(new ListItem("지수아"));
            lbl_1.Text = "1번셋팅";
            lbl_2.Text = "2번셋팅";
            lbl_3.Text = "3번셋팅";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }
    }
}