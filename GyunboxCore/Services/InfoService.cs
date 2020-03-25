using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Services
{
    //public class InfoService
    //{
    //    public string GetUrl()
    //    {
    //        return "http://www.gilbut.co.kr";
    //    }
    //}

    public class InfoService : IInfoService
    {
        public string GetUrl()
        {
            return "http://www.gilbut.co.kr";
        }
    }
}
