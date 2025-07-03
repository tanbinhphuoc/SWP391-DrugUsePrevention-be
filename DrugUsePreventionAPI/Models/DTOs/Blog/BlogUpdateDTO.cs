using System;
namespace DrugUsePreventionAPI.Models.DTOs.Blog
{
    public class BlogUpdateDTO
    {
        public int BlogID { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public int AuthorID { get; set; }
        public DateTime PublishDate { get; set; }
        public string Status { get; set; }
        public string? Thumbnail { get; set; }
        public string? AuthorAvatar { get; set; }
    }
}
