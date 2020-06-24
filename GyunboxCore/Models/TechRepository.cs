using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Models
{
    public class TechRepository : ITechRepository
    {
        private IConfiguration _config;
        private SqlConnection db;

        public TechRepository(IConfiguration config)
        {
            _config = config;

            //IConfiguration 개체를 통해서
            //appsettings.json의 데이터 베이스 연결 문자열을 읽어온다.

            db = new SqlConnection(_config.GetSection("ConnectionStrings").GetSection("DefaultConnection").Value);
        }

        //입력
        public void AddTech(Tech model)
        {
            string sql = "Insert Into Teches (Title) Values (@Title)";
            var id = this.db.Execute(sql, model);
        }

        //출력
        public List<Tech> GetTechs()
        {
            string sql = "Select Id, Title From Teches Order By Id Asc";
            List<Tech> tmpList = this.db.Query<Tech>(sql).ToList();

            return this.db.Query<Tech>(sql).ToList();
        }
    }
}
