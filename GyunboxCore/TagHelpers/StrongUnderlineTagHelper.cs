using Microsoft.AspNetCore.Razor.TagHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.TagHelpers
{
    public class StrongUnderlineTagHelper : TagHelper
    {
        public override async Task ProcessAsync(TagHelperContext context, TagHelperOutput output)
        {
            //태그 헬퍼 안의 텍스트 가져오기
            string origin = (await output.GetChildContentAsync()).GetContent();

            string result = $"<u>{origin}</u>";

            output.TagName = "strong";
            output.Content.AppendHtml(result); //<strong>안에 <u>태그 포함 출력
        }
    }
}
