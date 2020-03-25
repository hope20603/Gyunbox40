using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Models
{
    public class MaximModel
    {
        public int Id { get; set; }
        [Display(Name="이름")]
        [Required(ErrorMessage ="이름을 입력하시오.")]
        [StringLength(5,MinimumLength=1, ErrorMessage="이름은 1자 이상 5자 이하")]
        public string Name { get; set; }

        [Required(ErrorMessage ="내용을 입력하시오.")]
        [StringLength(10, MinimumLength =1, ErrorMessage ="내용은 1자 이상 10자 이하")]
        [Display(Name = "내용")]
        public string Content { get; set; }


    }
}
