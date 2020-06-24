using GyunboxCore.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.ViewComponents
{
    public class SiteListViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            var siteList = new List<Site>()
            {
                new Site{Id=1, Title="길벗 출판사", Url="http://www.gilbut.co.kr", Description="asp.net core 1.0 서적 출간"},
                new Site{Id=2, Title="길벗 출판사", Url="http://www.gilbut.co.kr", Description="asp.net core 2.0 서적 출간"},
                new Site{Id=3, Title="길벗 출판사", Url="http://www.gilbut.co.kr", Description="asp.net core 3.0 서적 출간"},
                new Site{Id=4, Title="길벗 출판사", Url="http://www.gilbut.co.kr", Description="asp.net core 4.0 서적 출간"},
                new Site{Id=5, Title="길벗 출판사", Url="http://www.gilbut.co.kr", Description="asp.net core 5.0 서적 출간"},
                new Site{Id=6, Title="길벗 출판사", Url="http://www.gilbut.co.kr", Description="asp.net core 6.0 서적 출간"},
                new Site{Id=7, Title="길벗 출판사", Url="http://www.gilbut.co.kr", Description="asp.net core 7.0 서적 출간"}
                
            };

            return View(siteList);
        }
    }
}
