namespace Studiositas.API.Models;

public class StudyPost
{
    public int Id {get; set;}
    public string UserName { get; set; } = string.Empty;
    public string ImageUrl { get; set; } = string.Empty;
    public string Duration { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public int LikesCount { get; set; } = 0;
    public int CommentsCount { get; set; } = 0;
}