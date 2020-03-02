using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using Gyunbox40.Common;
using Gyunbox40.Controller;
using Gyunbox40.Model;
using Newtonsoft.Json.Linq;

namespace Gyunbox40
{
    /// <summary>
    /// DDoService의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
    [System.Web.Script.Services.ScriptService]
    public class DDoService : System.Web.Services.WebService
    {
        CommonController cc = new CommonController();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        /// <summary>
        /// 테스트
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public string CheckUserId()
        {
            string returnStr = "OKK";
            DaDdogram ddo = new DaDdogram();
            //http://localhost:11111/DDoService.asmx/ServiceTest
            string chkUid = cc.NullToBlank(HttpContext.Current.Request["uid"]);


            if (chkUid != "")
            {
                DataSet ds = ddo.ChkUserId(chkUid);

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    returnStr = "FAIL";
                }
            }

            Context.Response.Write(returnStr);
            Context.Response.End();

            return string.Empty;
        }


        /// <summary>
        /// 로또 당첨번호 가져오기
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public string GetLottoNumber()
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
            
            string URL = "https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + nowTime;
            string jsonResult = "";

            GetJsonObjectFromUrl(URL);

            Context.Response.Write(jsonResult);
            Context.Response.End();

            return string.Empty;
        }

        /// <summary>
        /// url을 호출하여 json객체로 리턴받아 온다.
        /// </summary>
        /// <param name="requestUrl"></param>
        /// <returns></returns>
        public JObject GetJsonObjectFromUrl(string requestUrl)
        {
            JObject json = new JObject();

            using (var webClient = new System.Net.WebClient())
            {
                var myJsonString = webClient.DownloadString(requestUrl);
                json = (JObject)myJsonString.ToString();
            }

            return json;
        }



        /// <summary>
        /// 테스트
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        //[ScriptMethod(UseHttpGet = true)]
        public string UserRegister()
        {
            string returnStr = "OKK";
            DaDdogram ddo = new DaDdogram();
            Hashtable ht = new Hashtable();
            //http://localhost:11111/DDoService.asmx/ServiceTest
            string userId = cc.NullToBlank(HttpContext.Current.Request["userId"]);
            string userPwd = cc.NullToBlank(HttpContext.Current.Request["userPwd"]);
            string userEml = cc.NullToBlank(HttpContext.Current.Request["userEml"]);


            if (userId != "" && userPwd != "" && userEml != "")
            {
                ht["UID"] = userId;
                ht["PWD"] = userPwd;
                ht["EML"] = userEml;

                returnStr = ddo.UserRegister(ht);
            }

            Context.Response.Write(returnStr);
            Context.Response.End();

            return string.Empty;
        }


        /// <summary>
        /// 로그인
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        //[ScriptMethod(UseHttpGet = true)]
        public string UserLogin()
        {
            string returnStr = "OKK";
            MemberController mem = new MemberController();
            DaDdogram ddo = new DaDdogram();
            DataSet ds = new DataSet();
            Util util = new Util();

            //http://localhost:11111/DDoService.asmx/ServiceTest
            string userId = cc.NullToBlank(HttpContext.Current.Request["userId"]);
            string userPwd = cc.NullToBlank(HttpContext.Current.Request["userPwd"]);

            if (userId != "" && userPwd != "")
            {
                ds = ddo.UserLogin(userId, userPwd);

                if (!util.ChkDsIsNull(ds))
                {
                    mem.Login(ds);
                }
                else
                {
                    returnStr = "FAIL";
                }
            }

            Context.Response.Write(returnStr);
            Context.Response.End();

            return string.Empty;
        }
    }


    //XML FROM URL
    //XmlDocument xmlApi = new XmlDocument();
    //xmlApi.Load("https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=898");
    //XmlDocument xmlResult = xmlApi;

    //JSON FROM URL
    //string URL = "https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=898";
    //using (var webClient = new System.Net.WebClient())
    //{
    //    var json = webClient.DownloadString(URL);
    //}


    //Json from Url
    //protected void Request_Json()
    //{
    //    string result = null;
    //    string url = "가져올 url";
    //    //http://www.redmine.org/issues.json
    //    try
    //    {
    //        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
    //        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
    //        Stream stream = response.GetResponseStream();
    //        StreamReader reader = new StreamReader(stream);
    //        result = reader.ReadToEnd();
    //        stream.Close();
    //        response.Close();
    //        //Response.Write(result);
    //    }
    //    catch (Exception e)
    //    {
    //        Console.WriteLine(e.Message);
    //    }
    //    ParseJson(result);
    //    //return result;
    //}


}
