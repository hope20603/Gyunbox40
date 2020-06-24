using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Models
{
    public interface ITechRepository
    {
        void AddTech(Tech model); //입력
        List<Tech> GetTechs();
    }
}
