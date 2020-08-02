using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;
using Gyunbox40.Controller;
using Gyunbox40.Model;

namespace Gyunbox40.Vue
{
    public partial class Stores : System.Web.UI.Page
    {
        protected Hashtable htLot;
        LottoController lot;
        DaDdogram daDdo;
        LotnumModel model;
        List<LotWinner> mWinner;
        List<LotnumModel> models;
        protected string seq = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            lot = new LottoController();
            daDdo = new DaDdogram();
            htLot = new Hashtable();

            seq = lot.NullToBlank(Request["seq"]);

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

            htLot["num1_class"] = lot.getBallClass(model.NUM1);
            htLot["num2_class"] = lot.getBallClass(model.NUM2);
            htLot["num3_class"] = lot.getBallClass(model.NUM3);
            htLot["num4_class"] = lot.getBallClass(model.NUM4);
            htLot["num5_class"] = lot.getBallClass(model.NUM5);
            htLot["num6_class"] = lot.getBallClass(model.NUM6);
            htLot["num7_class"] = lot.getBallClass(model.NUM7);

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

        protected void rpt_winner_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            object items = e.Item.DataItem as object;
            string tmp = DataBinder.Eval(items, "MNY").ToString();
            tmp = tmp.Replace("원", "");
            tmp = tmp.Replace(",", "");
            double wMoney = Convert.ToDouble(tmp);

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl_real = e.Item.FindControl("lbl_realGet") as Label;
                lbl_real.Text = string.Format("{0:#,0}", lot.getRealGetMoney(wMoney));
                //ArrayList arr = e.Item.DataItem as ArrayList;
                //String strTest = arr[0] as String;    //CommandArgument  값 row 마다 DataSource 값(동적인 값)을 사용하여 이벤트 처리시 사용
                //LinkButton btnlink = e.Item.FindControl("btnlink") as LinkButton;
                ////버튼의 속성 값 등록
                //btnlink.CommandArgument = strTest;
                //btnlink.CommandName = "name";
                ////이벤트 등록을 할 수 도 있다
                //btnlink.Click += new EventHandler(btnlink_Click);
                ////row에 이벤트를 주기 위해 Link버튼 이벤트를 호출 한다
                //HtmlTableRow tr = e.Item.FindControl("tr") as HtmlTableRow;
                //tr.Attributes.Add("onclick", Page.GetPostBackEventReference(btnlink));

            }
        }
    }
}