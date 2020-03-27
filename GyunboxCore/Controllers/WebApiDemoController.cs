using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace GyunboxCore.Controllers
{
    [Route("api/[controller]")]
    public class WebApiDemoController : Controller
    {
        // GET: api/<controller>
        [HttpGet]
        public JsonResult Get()
        {
            return Json(new { name = "kang seung gyun" });
        }

        [HttpPost]
        public JsonResult Post([FromBody]WebApiDemoClass name)
        {
            if (ModelState.IsValid)
            {
                Response.StatusCode = (int)HttpStatusCode.Created;
                return Json(true);
            }

            Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return Json("실패");
        }


    }

    public class WebApiDemoClass
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50,MinimumLength=3, ErrorMessage ="3자 이상")]
        public string Name { get; set; }

    }
}
