using Gyunbox40.Common;
using Gyunbox40.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gyunbox40.Vue
{
    public partial class AjaxWeekNum : System.Web.UI.Page
    {
        protected LotColorModel model;
        protected string seq;
        Util util = new Util();
        protected void Page_Load(object sender, EventArgs e)
        {
            seq = util.NullToBlank(Request["seq"]);

            InitData();
        }

        public void InitData()
        {
            DaDdogram daddo = new DaDdogram();
           

            //파라미터가 
            if (seq == "")
            {
                int nowTime = 898;
                string SDate = "2020-02-15";
                string EDate = DateTime.Now.ToString("yyyy-MM-dd");
                DateTime T1 = DateTime.Parse(SDate);
                DateTime T2 = DateTime.Parse(EDate);
                TimeSpan ts = T2 - T1;
                int diffDay = ts.Days;
                int dayPlus = diffDay / 7;
                nowTime += dayPlus;

                //이미 있는 데이터인지 확인하고 없으면 db에 추가해준다.
                if (!daddo.CheckExistDrwNo(nowTime.ToString()))
                {
                    daddo.InsertLottoNumber(nowTime.ToString());
                }

                model = daddo.GetLotNumBySeqWithColor(nowTime.ToString());

            }
            else
            {
                model = daddo.GetLotNumBySeqWithColor(seq);
            }

           
        }
    }
}