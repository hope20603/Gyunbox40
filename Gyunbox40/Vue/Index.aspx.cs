using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Newtonsoft.Json.Linq;
using Gyunbox40.Model;
using System.Text;
using System.Collections;
using System.Data;
using Gyunbox40.Common;

namespace Gyunbox40.Vue
{
    public partial class Index : System.Web.UI.Page
    {
        public string hostString = "";
        public string luckyPoint = "";
        public Hashtable htLucky = new Hashtable();
        public Util util = new Util();
        protected void Page_Load(object sender, EventArgs e)
        {
            hostString = new Common.CommonController().hostString;
            
            //아래 내용은 캐시에 저장해서 속도를 향상 시킬 수 있음.
            if (HttpContext.Current.Application["LUCKY_POINT"] == null)
            {
                
                HttpContext.Current.Application["LUCKY_POINT"] = MakeHashtable();
                HttpContext.Current.Application["LUCKY_POINT_INSERT_TIME"] = DateTime.Now;
            }
            else
            {
                if(Convert.ToDateTime(HttpContext.Current.Application["LUCKY_POINT_INSERT_TIME"]) < DateTime.Now.AddHours(-1))
                {
                    HttpContext.Current.Application["LUCKY_POINT"] = MakeHashtable();
                    HttpContext.Current.Application["LUCKY_POINT_INSERT_TIME"] = DateTime.Now;
                }
                else
                {
                    htLucky = (Hashtable)HttpContext.Current.Application["LUCKY_POINT"];
                }
            }
            
            InsertLottoInfo();
        }

        public Hashtable MakeHashtable()
        {
            DaDdogram daddo = new DaDdogram();
            DataSet ds = daddo.GetLuckyPoint();

            if (!util.ChkDsIsNull(ds))
            {
                for (int i = 0; i < 45; i++)
                {
                    htLucky.Add("" + (i + 1) + "", ds.Tables[0].Rows[i]["CNT"].ToString());
                }
            }
            else
            {
                for (int i = 0; i < 45; i++)
                {
                    htLucky.Add("" + i + "", "0");
                }
            }

            return htLucky;
        }

        public void InsertLottoInfo()
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

            DaDdogram daddo = new DaDdogram();

            if (diffDay % 7 == 1) //당첨일 다음날 해당데이터를 insert 해줌
            {
                daddo.InsertLottoNumber(nowTime.ToString());
            }
        }
    }
}