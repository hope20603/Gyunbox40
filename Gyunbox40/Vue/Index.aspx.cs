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
        protected void Page_Load(object sender, EventArgs e)
        {
            hostString = new Common.CommonController().hostString;
            DaDdogram daddo = new DaDdogram();
            Util util = new Util();

            //아래 내용은 캐시에 저장해서 속도를 향상 시킬 수 있음.
            DataSet ds = daddo.GetLuckyPoint();
            if (!util.ChkDsIsNull(ds))
            {
                for (int i = 0; i < 45; i++)
                {
                    htLucky.Add("" + (i+1) + "", ds.Tables[0].Rows[i]["CNT"].ToString());
                }
            }
            else
            {
                for (int i = 0; i < 45; i++)
                {
                    htLucky.Add("" + i + "", "0");
                }
            }
        }

        public void InsertLottoInfo()
        {
            DaDdogram daddo = new DaDdogram();
            daddo.InsertLottoNumber();
        }
    }
}