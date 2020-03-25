using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Services
{
    public class CopyrightService : ICopyrightService
    {
        public string GetCopyrightString()
        {
            return $"Copyright {DateTime.Now.Year} all right reserved. " +
                $"from CopyrightService.{GetHashCode()}";
        }

        public string CopyrightString { get; set; } = $"Copyright {DateTime.Now.Year} all right reserved.";
    }
}
