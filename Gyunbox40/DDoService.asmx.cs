using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using Gyunbox40.Common;
using Gyunbox40.Controller;
using Gyunbox40.Model;
using Newtonsoft.Json.Linq;
using System.Web.Script.Serialization;

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
            try
            {
               
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
            }
            catch
            {
                returnStr = "ERROR";
            }

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
            
            string URL = "https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=";
            string jsonResult = "";

            JValue jVal = GetJsonObjectFromUrl(URL + nowTime);
            if (jVal == null || jVal.Value.ToString().IndexOf("fail") > -1 )
            {
                //해당회차에 에러가 나는 경우 이전 회차로 5회 더 요청해본다.
                for (int i = nowTime-1; i >= nowTime - 5; i--)
                {
                    jVal = GetJsonObjectFromUrl(URL + i);
                    if (jVal != null && jVal.Value.ToString().IndexOf("fail") < 0) break;
                }
            }

            jsonResult = jVal.ToString();

            Context.Response.Write(jsonResult);
            Context.Response.End();

            return string.Empty;
        }

        /// <summary>
        /// url을 호출하여 json객체로 리턴받아 온다.
        /// </summary>
        /// <param name="requestUrl"></param>
        /// <returns></returns>
        public JValue GetJsonObjectFromUrl(string requestUrl)
        {
            //JObject json = new JObject();
            JValue json = null;

            try
            {
                using (var webClient = new System.Net.WebClient())
                {
                    var myJsonString = webClient.DownloadString(requestUrl);
                    json = (JValue)myJsonString.ToString();
                }
            }
            catch(Exception ex)
            {
                json = null;
            }

            return json;
        }

        /// <summary>
        /// 테스트
        /// </summary>
        /// <returns></returns>
        [WebMethod]
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
        public string UserLogin()
        {
            string returnStr = "OKK";
            try
            {
                MemberController mem = new MemberController();
                DaDdogram ddo = new DaDdogram();
                DataSet ds = new DataSet();
                Util util = new Util();

                //http://localhost:11111/DDoService.asmx/ServiceTest
                string userId = cc.NullToBlank(HttpContext.Current.Request["userId"]);
                string userPwd = cc.NullToBlank(HttpContext.Current.Request["userPwd"]);

                if (userId != "" && userPwd != "")
                {
                    ds = ddo.GetLoginInfo(userId, userPwd);

                    if (!util.ChkDsIsNull(ds))
                    {
                        mem.Login(ds);
                    }
                    else
                    {
                        returnStr = "FAIL";
                    }
                }
            }
            catch
            {
                returnStr = "FAIL";
            }
            
            Context.Response.Write(returnStr);
            Context.Response.End();

            return string.Empty;
        }

        /// <summary>
        /// 로그인 되어 있는지 체크
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        public string IsLogin()
        {
            string userID = cc.g_USER_ID;

            if (userID != "")
            {
                Context.Response.Write("OKK");
            }
            else
            {
                Context.Response.Write("FAIL");
            }

            Context.Response.End();

            return string.Empty;
        }

        /// <summary>
        /// 새로또번호 생성
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public string GetNewNumber()
        {
            #region - Request Body 받기 --
            var bodyStream = new StreamReader(HttpContext.Current.Request.InputStream);
            bodyStream.BaseStream.Seek(0, SeekOrigin.Begin);
            var bodyText = bodyStream.ReadToEnd();

            JObject json = JObject.Parse(bodyText);
            JToken jt = json.SelectToken("pArrParams");
            int[] tmp = jt.ToObject<int[]>();
            //ArrayList<String> arr = jt.ToObject<string[]>().ToArray();
            List<int> arr = tmp.ToList<int>();
            #endregion

            int needCount = 7 - tmp.Length;

            while (needCount > 0)
            {
                Random rand = new Random((int)DateTime.Now.Ticks);
                int numIterations = 0;
                //numIterations = rand.Next(1, 45);
                numIterations = rand.Next(1, 46);
                bool result = arr.Contains(numIterations);
                if (!result)
                {
                    arr.Add(numIterations);
                    needCount--;
                }
            }

            //Random rand2 = new Random((int)DateTime.Now.Ticks);
            //int test = rand2.Next(1, 3);

            //마지막에 생성된 번호는 행운번호로 따로 뽑아둠
            int luckyNumber = arr.Last<int>();
            arr.RemoveAt(6);
            arr.Sort();
            arr.Add(luckyNumber);

            JavaScriptSerializer jss = new JavaScriptSerializer();

            string output = jss.Serialize(arr);

            //고정된 숫자는 그대로 두고.. ( 미리 배열에 집어 넣어줌 )
            //나머지 숫자를 생성한다.
            //겹치는 것은 제외하고 다시 생성함
            //json 데이터로 리턴해주면됨
            //향후에는 DB데이터로 확률따져서 가중치를 둬서 번호를 생성함
            //조건은 처음엔 비율로 따지고...
            //향후 홀짝 조건이라든지.. 뭐 해당월은 행운의 숫자라든지- 재미로 할만한 것들 추가
            //나중에는 고객이 원하는 번호를 자유롭게 고정할 수 있는 기능도 만들 예정

            Context.Response.Write(output);
            Context.Response.End();

            return string.Empty;


        }

        /// <summary>
        /// 새로 생성한 번호들을 로그인 계정에 모두 저장을 해준다.
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        public string SaveNewNumbers()
        {
            DaDdogram daDDo = new DaDdogram();
            Util util = new Util();

            #region - Request Body 받기 --
            var bodyStream = new StreamReader(HttpContext.Current.Request.InputStream);
            bodyStream.BaseStream.Seek(0, SeekOrigin.Begin);
            var bodyText = bodyStream.ReadToEnd();
            #endregion

            JObject json = JObject.Parse(bodyText);
            JToken jt = json.SelectToken("pArrParams");
            //string ttt = jt[1]["createdDate"].ToString();
            Hashtable ht = null;
            int okCount = 0;

            for(int i=0; i< jt.Count(); i++)
            {
                ht = new Hashtable();

                ht["userId"] = util.NullToBlank(cc.g_USER_ID);
                ht["createdDate"] = jt[i]["createdDate"].ToString();
                ht["number_1"] = jt[i]["number_1"].ToString();
                ht["number_2"] = jt[i]["number_2"].ToString();
                ht["number_3"] = jt[i]["number_3"].ToString();
                ht["number_4"] = jt[i]["number_4"].ToString();
                ht["number_5"] = jt[i]["number_5"].ToString();
                ht["number_6"] = jt[i]["number_6"].ToString();
                ht["number_7"] = jt[i]["number_7"].ToString();
                
                if(daDDo.SaveNewNumber(ht).IndexOf("OKK") > -1)
                {
                    okCount++;
                }
            }

            JObject resultJson = new JObject();
            resultJson.Add("Result", "OKK");
            resultJson.Add("OkCount", okCount);
            
            Context.Response.Write(resultJson.ToString());
            Context.Response.End();

            return string.Empty;
        }

        /// <summary>
        /// 저장한 로또번호들을 json 형태로 리턴
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        public string GetMyNumberList()
        {
            CommonController cc = new CommonController();
            DaDdogram daDDo = new DaDdogram();
            Util util = new Util();

            int curPage = cc.NullToZero(HttpContext.Current.Request["page"]);
            int pageSize = cc.NullToZero(HttpContext.Current.Request["size"]);

            curPage = (curPage == 0) ? 1 : curPage;      //기본값으로 셋팅
            pageSize = (pageSize == 0) ? 10 : pageSize;  //기본값으로 셋팅

            int start = ((curPage * pageSize) - pageSize)+1;
            int end = (curPage * pageSize) + 1;

            //cc.g_USER_ID = "hope20603@naver.com";

            DataSet ds = daDDo.GetMyNumber(cc.g_USER_ID, start, end);
            string jsonString = "";

            if (!util.ChkDsIsNull(ds)) { 
                jsonString = util.GetJsonFromDataSet(ds.Tables[0]);
            }

            Context.Response.Write(jsonString);
            Context.Response.End();

            return string.Empty;
        }


        /// <summary>
        /// 저장한 로또번호들을 json 형태로 리턴
        /// </summary>
        /// <returns></returns>
        [WebMethod(EnableSession = true)]
        public string GetMyNumberCount()
        {
            CommonController cc = new CommonController();
            DaDdogram daDDo = new DaDdogram();
            Util util = new Util();

            //cc.g_USER_ID = "hope20603@naver.com";

            DataSet ds = daDDo.GetMyNumberCount(cc.g_USER_ID);
            string jsonString = "";

            if (!util.ChkDsIsNull(ds))
            {
                jsonString = util.GetJsonFromDataSet(ds.Tables[0]);
            }

            Context.Response.Write(jsonString);
            Context.Response.End();

            return string.Empty;
        }

        [WebMethod(EnableSession = true)]
        public string DeleteMyNumber()
        {
            CommonController cc = new CommonController();
            DaDdogram daDDo = new DaDdogram();
            Util util = new Util();
            string jsonResult = "";

            string targetIdx = cc.NullToBlank(HttpContext.Current.Request["targetIdx"]);

            //cc.g_USER_ID = "hope20603@naver.com";

            if (targetIdx != "" && cc.g_USER_ID != "")
            {
                int result = daDDo.DeleteMyNumber(targetIdx, cc.g_USER_ID);
                if(result == -1)
                {
                    jsonResult = "ERROR";
                }
                else if(result == 0)
                {
                    jsonResult = "NOT_MY_NUM";
                }
                else
                {
                    jsonResult = "OK";
                }
                
            }

            Context.Response.Write(jsonResult);
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
