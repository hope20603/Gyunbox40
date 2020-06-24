using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GyunboxCore.Models;
using Microsoft.AspNetCore.Mvc;

namespace GyunboxCore.Controllers
{
    public class DemoController : Controller
    {
        public IActionResult Index()
        {
            ViewBag.Name = "박용준";
            ViewBag.Age = 21;
            ViewBag.원하는모든단어 = "모든값...";
            ViewData["Address"] = "세종시...";

            return View();
        }

        public IActionResult Demo1()
        {
            return View();
        }

        public IActionResult Demo2()
        {
            return View();
        }

        /// <summary>
        /// 폼데이터 전송 및 받기
        /// </summary>
        [HttpGet]
        public IActionResult FormPostIndex()
        {
            return View();
        }

        /// <summary>
        /// 폼데이터 전송 및 받기
        /// </summary>
        [HttpPost]
        public IActionResult FormPostIndex(string name, string content)
        {
            //ViewBag.Result = $"이름: {Request.Form["name"]}, "
            //                +$"내용: {Request.Form["content"]}";
            ViewBag.Result += $"이름:{name}, 내용:{content}";

            return View();
        }

        public IActionResult MovieList()
        {
            List<MovieViewModel> vms = new List<MovieViewModel>()
            {
                new MovieViewModel{ Id=1, Title="명량", CreateionDate= new DateTime(2014,1,1) },
                new MovieViewModel{ Id=2, Title="실미도", CreateionDate= new DateTime(2003,1,1) },
                new MovieViewModel{ Id=3, Title="배테랑", CreateionDate= new DateTime(2015,1,1) }
            };

            return View(vms);
        }
    }
}