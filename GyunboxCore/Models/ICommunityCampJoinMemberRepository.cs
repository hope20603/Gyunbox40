using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Models
{
    public interface ICommunityCampJoinMemberRepository
    {
        List<CommunityCampJoinMember> GetAll();
        void AddMember(CommunityCampJoinMember model);
        void DeleteMember(CommunityCampJoinMember model);
    }
}
