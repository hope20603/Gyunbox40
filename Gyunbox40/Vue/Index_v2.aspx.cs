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
    public partial class Index_v2 : System.Web.UI.Page
    {
        public string hostString = "";
        public string luckyPoint = "";
        public Hashtable htLucky = new Hashtable();
        public Hashtable htLuckyOrd = new Hashtable();
        public List<int> datas = new List<int>(); //행운의 번호 - 서버에서 제공해줄 번호!
        public Util util = new Util();
        DaDdogram daDDo;
        CommonController cc = new CommonController();

        protected void Page_Load(object sender, EventArgs e)
        {
            hostString = new Common.CommonController().hostString;
            daDDo = new DaDdogram();

            //아래 내용은 캐시에 저장해서 속도를 향상 시킬 수 있음.
            if (HttpContext.Current.Application["LUCKY_POINT"] == null)
            {
               
                //HttpContext.Current.Application["LUCKY_POINT"] = MakeHashtable();
                HttpContext.Current.Application["LUCKY_POINT"] = GetMainChartData();
                HttpContext.Current.Application["LUCKY_POINT_ORDERBY"] = GetMainChartDataOrderBy();
                HttpContext.Current.Application["LUCKY_POINT_INSERT_TIME"] = DateTime.Now;
            }
            else
            {
                if (Convert.ToDateTime(HttpContext.Current.Application["LUCKY_POINT_INSERT_TIME"]) < DateTime.Now.AddHours(-1))
                {
                    //HttpContext.Current.Application["LUCKY_POINT"] = MakeHashtable();
                    HttpContext.Current.Application["LUCKY_POINT"] = GetMainChartData();
                    HttpContext.Current.Application["LUCKY_POINT_ORDERBY"] = GetMainChartDataOrderBy();
                    HttpContext.Current.Application["LUCKY_POINT_INSERT_TIME"] = DateTime.Now;
                }
                else
                {
                    htLucky = (Hashtable)HttpContext.Current.Application["LUCKY_POINT"];
                    htLuckyOrd = (Hashtable)HttpContext.Current.Application["LUCKY_POINT_ORDERBY"];
                }
            }

            // 횟수 지정해서 가끔 한번 해주면 됨.
            // DaDdogram daDD = new DaDdogram();
            // daDD.InsertLottoNumber();

            if (util.NullToBlank(cc.g_PUSH_NUM) == "")
            {
                GetLuckyNumber();
            }
            else
            {
                //string[] tmp = cc.g_PUSH_NUM.Split('|');
                datas = cc.g_PUSH_NUM.Split('|').Select(Int32.Parse).ToList();
            }

            string tmp = Request.UserHostName.ToString();
            if (tmp != "::1")
            {
                daDDo.SetLoginLog(util.NullToBlank(Request.UrlReferrer), "");
            }

            ViewState["nowVisit"] = Application["CurrentVisit"].ToString();
            ViewState["totalVisit"] = DaDdogram.GetTotalVisitor().ToString();
            ViewState["todayVisit"] = DaDdogram.GetTodayVisitor().ToString();

            //GetRandom();
        }

        /// <summary>
        /// 추천할 번호 7개를 가져온다.
        /// 그동안 나왔던 비중을 토대로 숫자를 만들어옴-사실 큰 의미는 없음..
        /// </summary>
        public void GetLuckyNumber()
        {
            Util util = new Util();
            //Dictionary<int, int> datas = new Dictionary<int, int>();

            DaDdogram daDdo = new DaDdogram();
            DataSet ds = daDdo.GetLuckyNumber(); //비중을 가지고 옴
            float[] inputNumbers = new float[45];

            //로또 번호의 비중치를 넣어준다.
            if (!util.ChkDsIsNull(ds))
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    inputNumbers[i] = ((float)Convert.ToDouble(ds.Tables[0].Rows[i]["DDOWGT"])) * 100;
                }
            }

            float sumVal = 0;
            for (int i = 0; i < inputNumbers.Length; i++)
            {
                sumVal += inputNumbers[i];
            }

            //겹치는 숫자는 제외하고 보너스 번호를 포함해서 총 7개 번호를 뽑는다.
            //마지막 번호를 보너스 번호로 두고, 나머지는 정렬해서 사용.

            int getNumberCount = 7;

            while (getNumberCount > 0)
            {
                Random seedRnd = new Random((int)DateTime.Now.Ticks + getNumberCount); //단순히 중복된 seed를 피하기위함임.

                int returnValue = GetLottoNumber(inputNumbers, seedRnd);
                if (datas.Contains(returnValue) == false)
                {
                    datas.Add(returnValue);
                    getNumberCount--;
                }
            }

            int bonusNum = datas[6];
            datas.RemoveAt(6);
            datas.Sort();
            datas.Add(bonusNum);

            //문자열로 세션에 담아두고, CreateNumber.aspx 에서 고정할 번호에 동일하게 노출시켜 준다.
            cc.g_PUSH_NUM = string.Join("|", datas); //세션에 집어넣어 주기

        }

        /// <summary>
        /// 제공된 비중에 따라서 로또번호를 뽑는다.
        /// 숫자 하나당 거의 1~2프로 정도의 확률을 가지고 있어서, 거의 랜덤으로 뽑는것과 동일한 확률이긴 함.
        /// </summary>
        /// <param name="inputDatas"></param>
        /// <param name="seedRnd"></param>
        /// <returns></returns>
        public int GetLottoNumber(float[] inputDatas, Random seedRnd)
        {
            float pivot = (float)seedRnd.NextDouble();
            float dr = pivot * 100.0f;
            //float dr = pivot/10;
            float cumulative = 0.0f;
            int reVal = 0;

            for (int i = 0; i < inputDatas.Length; i++)
            {
                cumulative += inputDatas[i];
                if (dr <= cumulative)
                {
                    //reVal = 45 - i; break;
                    reVal = i + 1; break;
                }
            }

            return reVal;
        }

        /// <summary>
        /// 차트에 사용할 해시테이블을 구성해준다.
        /// </summary>
        /// <returns></returns>
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

        /// <summary>
        /// 차트에 사용할 해시테이블을 구성해준다.
        /// </summary>
        /// <returns></returns>
        public Hashtable GetMainChartData()
        {
            DaDdogram daddo = new DaDdogram();
            DataSet ds = daddo.GetWainChartData();

            if (!util.ChkDsIsNull(ds))
            {
                for (int i = 0; i < 45; i++)
                {
                    htLucky.Add("" + (i + 1) + "", ds.Tables[0].Rows[i]["CNT"].ToString());
                    htLucky.Add("PER_" + (i + 1) + "", ds.Tables[0].Rows[i]["PER"].ToString());
                    htLucky.Add("INC_" + (i + 1) + "", ds.Tables[1].Rows[i]["CNT"].ToString());
                    htLucky.Add("INC_PER_" + (i + 1) + "", ds.Tables[1].Rows[i]["PER"].ToString());
                }
            }
            else
            {
                for (int i = 0; i < 45; i++)
                {
                    htLucky.Add("" + i + "", "0");
                    htLucky.Add("PER_" + (i + 1) + "", "0");
                    htLucky.Add("INC_" + i + "", "0");
                    htLucky.Add("INC_PER_" + (i + 1) + "", "0");
                }
            }

            return htLucky;
        }

        /// <summary>
        /// 차트에 사용할 해시테이블을 구성해준다.
        /// </summary>
        /// <returns></returns>
        public Hashtable GetMainChartDataOrderBy()
       {
            DaDdogram daddo = new DaDdogram();
            DataSet ds = daddo.GetWainChartData();
            DataTable dt1 = new DataTable();
            DataTable dtInc = new DataTable();

            if (!util.ChkDsIsNull(ds))
            {
                ds.Tables[0].DefaultView.Sort = "cnt desc"; //보너스 번호 불포함
                ds.Tables[1].DefaultView.Sort = "cnt desc"; //보너스 번호 포함

                dt1 = ds.Tables[0].DefaultView.ToTable();
                dtInc = ds.Tables[1].DefaultView.ToTable();

                for (int i = 0; i < 45; i++)
                {
                    htLuckyOrd.Add("" + (i + 1) + "", dt1.Rows[i]["CNT"].ToString());
                    htLuckyOrd.Add("NUM_" + (i + 1) + "", dt1.Rows[i]["NUM"].ToString());
                    htLuckyOrd.Add("PER_" + (i + 1) + "", dt1.Rows[i]["PER"].ToString());
                    htLuckyOrd.Add("INC_" + (i + 1) + "", dtInc.Rows[i]["CNT"].ToString());
                    htLuckyOrd.Add("INC_NUM_" + (i + 1) + "", dtInc.Rows[i]["NUM"].ToString());
                    htLuckyOrd.Add("INC_PER_" + (i + 1) + "", dtInc.Rows[i]["PER"].ToString());
                }
            }
            else
            {
                for (int i = 0; i < 45; i++)
                {
                    htLuckyOrd.Add("" + i + "", "0");
                    htLuckyOrd.Add("PER_" + (i + 1) + "", "0");
                    htLuckyOrd.Add("INC_" + i + "", "0");
                    htLuckyOrd.Add("INC_PER_" + (i + 1) + "", "0");
                }
            }

            return htLuckyOrd;
        }

        /// <summary>
        /// 추첨이 이루어 지면 다음날에 해당데이터를 DB에 insert 해준다.
        /// --> 비중 조정이 이루어 져야함.
        /// </summary>
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
        /// <summary>
        /// 참고 소스
        /// </summary>
        /// <param name="inputDatas"></param>
        /// <param name="seed"></param>
        /// <returns></returns>
        public float GetRandomNumber(float[] inputDatas, int seed)
        {
            Random random = new Random(seed);
            //rand.Next(); //음수가 아닌 임의의 정수를 반환
            //rand.Next(n); n보다 작은 음수가 아닌 임의의 정수를 반환 0~n-1 사이의 값을 반환
            //rand.Next(n,m); n보다 같거나 크며 m보다 작은 음수가 아닌 임의의 정수를 반환 n~m-1 사이의 값을 반환
            //rand.NextDouble() 0.0과 1.0사이의 임의의 부동 소수점 난수를 반환
            //  Byte[] array=new Byte[10] rand.NextBytes(array);  byte형식의 배열에 난수를 채운다. 


            float total = 0;

            //float[] probs = new float[] { 10f, 20f, 30f, 40f, 50f };

            for (int i = 0; i < inputDatas.Length; i++)
            {
                total += inputDatas[i];
            }

            float pivot = (float)random.NextDouble() * total;

            for (int i = 0; i < inputDatas.Length; i++)
            {
                if (pivot < inputDatas[i])
                {
                    return inputDatas[i];
                }
                else
                {
                    pivot -= inputDatas[i];
                }
            }
            return inputDatas[inputDatas.Length - 1];

        }

        /// <summary>
        /// 참고소스
        /// </summary>
        public void GetRandom()
        {
            Dictionary<float, int> datas = new Dictionary<float, int>();

            float[] probs = new float[] { 10f, 20f, 30f, 40f, 50f };

            int tryNum = 500000;

            Random seedRnd = new Random();
            int startIndex = seedRnd.Next(); //음수가 아닌 임의의 정수를 반환

            for (int i = startIndex; i < startIndex + tryNum; i++)
            {
                float returnValue = GetRandomNumber(probs, i);

                //해당 숫자가 처음 뽑혔을 경우
                if (datas.ContainsKey(returnValue) == false)
                {
                    datas.Add(returnValue, 1);
                }
                //해당 숫자가 이미 있는 경우
                else
                {
                    datas[returnValue]++;
                }
            }

            System.Diagnostics.Debug.WriteLine(string.Format("시행 횟수 : {0}", tryNum));

            List<float> keys = datas.Keys.ToList();
            keys.Sort();

            for (int i = 0; i < keys.Count; i++)
            {
                System.Diagnostics.Debug.WriteLine(string.Format("{0}이 {1}번 나옴 비율 : {2}%", keys[i], datas[keys[i]], ((float)datas[keys[i]] / (float)tryNum) * 100f));
            }
        }

    }
}