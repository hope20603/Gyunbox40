using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using Gyunbox40.Common;
using Gyunbox40.Model;

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

                if(ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    returnStr = "FAIL";
                }
            }

            Context.Response.Write(returnStr);
            Context.Response.End();

            return string.Empty;
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


            if (userId != "" && userPwd !="" && userEml != "")
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
    }
}
