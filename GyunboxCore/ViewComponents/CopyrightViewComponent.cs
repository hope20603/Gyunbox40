using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.ViewComponents
{
    public class CopyrightViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            //초 단위로 짝수일대와 홀수일대 서로 다른 뷰 출력
            string viewName = "Default";
            if(DateTime.Now.Second  % 2 == 0)
            {
                viewName = "Details";
            }
            return View(viewName);
        }
    }
}
