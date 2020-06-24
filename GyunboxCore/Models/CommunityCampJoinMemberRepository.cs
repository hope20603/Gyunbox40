using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;

namespace GyunboxCore.Models
{
    public class CommunityCampJoinMemberRepository : ICommunityCampJoinMemberRepository
    {
        private readonly IConfiguration _config;
        private SqlConnection con;

        public CommunityCampJoinMemberRepository(IConfiguration config)
        {
            _config = config;
            con = new SqlConnection(_config.GetSection("Data").GetSection("DefaultConnection").GetSection("ConnectionString").Value);
        }

        public List<CommunityCampJoinMember> GetAll()
        {
            return con.Query<CommunityCampJoinMember>("Select * from CommunityCampJoinMembers Order by id asc").ToList();
        }

        public void AddMember(CommunityCampJoinMember model)
        {
            string query = "Insert Into CommunityCampJoinMembers  " +
                    " ( CommunityName, Name, Mobile, Email, Size, CreationDate ) " +
                    " Values ( @CommunityName, @Name, @Mobile, @Email, @Size, GetDate() )";
            con.Execute(query, model);
        }

        public void DeleteMember(CommunityCampJoinMember model)
        {
            string query = "Delete CommunityCampJoinMembers Where" 
                + " CommunityName = @CommunityName And Name = @Name And "
                + " Mobile = @Mobile And Email=@Email";
            con.Execute(query, model);
        }
    }
}
