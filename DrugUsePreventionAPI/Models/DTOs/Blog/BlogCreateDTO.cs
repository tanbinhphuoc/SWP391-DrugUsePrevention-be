namespace DrugUsePreventionAPI.Models.DTOs.Blog
{
    public class BlogCreateDTO
    {
        public string Title { get; set; }
        public string Content { get; set; }
        public int AuthorID { get; set; }
        public DateTime PublishDate { get; set; }
        public string Status { get; set; }
        public string? Thumbnail { get; set; }
        public string? AuthorAvatar { get; set; }
    }
}
