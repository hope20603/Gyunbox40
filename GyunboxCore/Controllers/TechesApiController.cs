using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GyunboxCore.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace GyunboxCore.Controllers
{
    [Produces("application/json")]
    [Route("api/TechesApi")]
    public class TechesApiController : Controller
    {
        private ITechRepository _repo;

        //의존성 주입 : ITechRepository의 인스턴스를 TechRepository의 인스터스로
        //TechRepository가 완성되지 않았더라도 인터페이스만 있으면 바로 개발 가능함.
        //협업에 좋고, 테스트주도개발에 좋음
        public TechesApiController(ITechRepository repo)
        {
            _repo = repo;
        }

        [HttpGet]
        public IEnumerable<Tech> Get()
        {
            return _repo.GetTechs();
        }

        [HttpPost]
        public Tech Post([FromBody] Tech tech)
        {
            _repo.AddTech(tech);
            return tech;
        }

    }
}
