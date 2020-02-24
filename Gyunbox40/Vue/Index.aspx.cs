using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Newtonsoft.Json.Linq;
using Gyunbox40.Model;

namespace Gyunbox40.Vue
{
    public partial class Index : System.Web.UI.Page
    {
        public string hostString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            hostString = new Common.CommonController().hostString;

            //XmlDocument xmlApi = new XmlDocument();
            //xmlApi.Load("https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=898");
            //XmlDocument xmlResult = xmlApi;


            //2020-02-15 389
            // +7일 390

            //int nowTime = 898;
            //
            //string SDate = "2020-02-15";
            //string EDate = DateTime.Now.ToString("yyyy-MM-dd");
            //DateTime T1 = DateTime.Parse(SDate);
            //DateTime T2 = DateTime.Parse(EDate);
            //
            //TimeSpan ts = T2 - T1;
            //int diffDay = ts.Days;
            //int dayPlus = diffDay / 7;
            //nowTime += dayPlus;
            //
            //string URL = "https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + nowTime;
            //
            //using (var webClient = new System.Net.WebClient())
            //{
            //    var myJsonString = webClient.DownloadString(URL);
            //    // Now parse with JSON.Net
            //    var jo = JObject.Parse(myJsonString);
            //    //JArray joo = JArray.Parse(myJsonString);
            //
            //    //for(int i=0; i<joo.Count; i++)
            //    //{
            //    //    string tmp = joo[i].ToString();
            //    //}
            //   string tmp2 = jo.GetValue("totSellamnt").ToString();
            //
            //    foreach(var item in jo)
            //    {
            //        string tmp = item.Value.ToString();
            //        
            //    }
            //}

            //InsertLottoInfo();
        }

        public void InsertLottoInfo()
        {
            DaDdogram daddo = new DaDdogram();
            daddo.InsertLottoNumber();
        }
    }
}