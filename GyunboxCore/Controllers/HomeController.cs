using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using GyunboxCore.Models;

namespace GyunboxCore.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        /// <summary>
        /// 이벤트 리스트를 노출시킬 페이지
        /// </summary>
        /// <returns></returns>
        [Route("Event"), Route("List")] //어트리뷰트 라우팅 테스트
        public IActionResult Event()
        {
            return View();
        }

        public string StringAction()
        {
            return "String을 반환하는 액션 메서드";
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
