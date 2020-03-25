using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Razor.Runtime.TagHelpers;
using Microsoft.AspNetCore.Razor.TagHelpers;

namespace GyunboxCore.TagHelpers
{
    
    public class UnixTimeConverterTagHelper : TagHelper
    {
        public override async Task ProcessAsync(TagHelperContext context, TagHelperOutput output)
        {
            var childContent = (await output.GetChildContentAsync()).GetContent();

            var unixTime = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);

            var currentTime = unixTime.AddSeconds(Convert.ToDouble(childContent));

            output.Content.SetContent(currentTime.ToString(Formatter));
        }

        public string Formatter { get; set; } = "yyyy-MM-dd hh:mm:ss";
    }
}
