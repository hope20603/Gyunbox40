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
    public partial class Calc : System.Web.UI.Page
    {
        protected Hashtable htLot;
        LottoController lot;
        DaDdogram daDdo;
        LotnumModel model;
        protected void Page_Load(object sender, EventArgs e)
        {
            lot = new LottoController();
            daDdo = new DaDdogram();
            htLot = new Hashtable();

            //if (!IsPostBack)
            //{
                InitData();
            //}
        }

        public void InitData()
        {
            model = daDdo.GetRecentLotNum();

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
        }

        protected void btn_cal_Click(object sender, EventArgs e)
        {
            string tmp = tb_mny.Text;
            tmp = tmp.Replace("원", "");
            tmp = tmp.Replace(",", "");
            double wMoney = Convert.ToDouble(tmp);

            ltl_result.Text = string.Format("<span>실수령액은 <span class='sp_hi'>{0}</span>원 입니다.</span>", string.Format("{0:#,0}", lot.getRealGetMoney(wMoney)));
        }

    }
}