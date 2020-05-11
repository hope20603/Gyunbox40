using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace GyunboxCore.Controllers
{
    public class UserController : Controller
    {
        public IActionResult UserInfo()
        {
            return View();
        }
    }
}