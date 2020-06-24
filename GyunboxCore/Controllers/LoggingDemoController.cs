using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace GyunboxCore.Controllers
{
    public class LoggingDemoController : Controller
    {
        private ILogger<LoggingDemoController> _logger;

        public LoggingDemoController(ILogger<LoggingDemoController> logger)
        {
            _logger = logger;
        }
        public IActionResult Index()
        {
            //index 페이지 실행시 로그의 Info 범주에 문자열과 시간 출력
            //_logger.LogInformation("Index View{time}", DateTime.Now);
            return View();
        }

        public IActionResult About()
        {
            //_logger.LogInformation("About View{time}", DateTime.Now);
            return View();
        }
    }
}