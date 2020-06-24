using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GyunboxCore.Models;
using Microsoft.AspNetCore.Mvc;

namespace GyunboxCore.Controllers
{
    public class ViewWithModelDemoController : Controller
    {
        public IActionResult Index()
        {
            DemoModel dm = new DemoModel();
            dm.Id = 1;
            dm.Name = "홍길동";

            return View(dm);
        }

        public IActionResult ListIndex()
        {
            List<DemoModel> models = new List<DemoModel>()
            {
                new DemoModel { Id = 1, Name = "홍길동" },
                new DemoModel { Id = 2, Name = "백두산" },
                new DemoModel { Id = 3, Name = "임꺽정" }
            };

            return View(models);
        }

       

    }
}