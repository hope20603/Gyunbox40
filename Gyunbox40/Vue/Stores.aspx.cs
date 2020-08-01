using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;
using Gyunbox40.Model;

namespace Gyunbox40.Vue
{
    public partial class Stores : System.Web.UI.Page
    {
        protected Hashtable htLot;
        CommonController cc;
        DaDdogram daDdo;
        LotnumModel model;
        List<LotWinner> mWinner;
        List<LotnumModel> models;
        string seq = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            cc = new CommonController();
            daDdo = new DaDdogram();
            htLot = new Hashtable();

            seq = cc.NullToBlank(Request["seq"]);

            InitData(seq);

            if (!IsPostBack)
            {
                models = daDdo.GetLotNumAllModel();

                ddl_lotSeq.DataSource = models;
                ddl_lotSeq.DataTextField = "WIN_DATE";
                ddl_lotSeq.DataValueField = "SEQ";
                ddl_lotSeq.DataBind();
            }
            

        }

        public void InitData(string seq)
        {
            if (seq == "") model = daDdo.GetRecentLotNum();
            else model = daDdo.GetLotNumBySeq(seq);

            htLot["seq"] = model.SEQ;
            htLot["win_date"] = model.WIN_DATE;

            htLot["num1_class"] = getBallClass(model.NUM1);
            htLot["num2_class"] = getBallClass(model.NUM2);
            htLot["num3_class"] = getBallClass(model.NUM3);
            htLot["num4_class"] = getBallClass(model.NUM4);
            htLot["num5_class"] = getBallClass(model.NUM5);
            htLot["num6_class"] = getBallClass(model.NUM6);
            htLot["num7_class"] = getBallClass(model.NUM7);

            htLot["num1"] = model.NUM1;
            htLot["num2"] = model.NUM2;
            htLot["num3"] = model.NUM3;
            htLot["num4"] = model.NUM4;
            htLot["num5"] = model.NUM5;
            htLot["num6"] = model.NUM6;
            htLot["num7"] = model.NUM7;


            mWinner = daDdo.GetWinnerInfo(model.SEQ.ToString());
            rpt_winner.DataSource = mWinner;
            rpt_winner.DataBind();

            DataSet ds = daDdo.GetStores(model.SEQ.ToString());
            rpt_stores.DataSource = ds.Tables[0].DefaultView;
            rpt_stores.DataBind();
        }

        public string getBallClass(int num)
        {
            if(num <= 10)
            {
                return "color_1";
            }
            else if (num <= 20)
            {
                return "color_2";
            }
            else if (num <= 30)
            {
                return "color_3";
            }
            else if (num <= 40)
            {
                return "color_4";
            }
            else
            {
                return "color_5";
            }

        }

        /// <summary>
        /// text field 값 셋팅
        /// </summary>
        protected void ddl_lotSeq_DataBound(object sender, EventArgs e)
        {
            foreach (ListItem Item in ddl_lotSeq.Items)
            {
                Item.Text = Server.HtmlDecode(Item.Value +"회 (" + Item.Text.Trim() +")");
            }
        }

        /// <summary>
        /// 선택 변경시 처리
        /// </summary>
        protected void ddl_lotSeq_SelectedIndexChanged(object sender, EventArgs e)
        {
            string seq = ddl_lotSeq.SelectedValue;

            InitData(seq);
        }
    }
}