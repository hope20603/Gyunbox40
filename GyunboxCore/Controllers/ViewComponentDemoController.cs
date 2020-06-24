using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace GyunboxCore.Controllers
{
    public class ViewComponentDemoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// CopyrightViewComponent 출력 데모
        /// </summary>
        /// <returns></returns>
        public IActionResult CopyrightDemo()
        {
            return View();
        }

        /// <summary>
        /// TechListViewComponent 사용 데모
        /// </summary>
        /// <returns></returns>
        public IActionResult TechListDemo()
        {
            return View();
        }

        /// <summary>
        /// SiteListViewComponent 사용 데모
        /// </summary>
        /// <returns></returns>
        public IActionResult SiteListDemo()
        {
            return View();
        }
    }
}