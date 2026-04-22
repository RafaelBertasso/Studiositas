using MediatR;
using Studiositas.API.Data;
using Studiositas.API.Models;

namespace Studiositas.API.Application.Features.Posts.Commands.CreatePost;

public class CreatePostCommandHandler(AppDbContext context) : IRequestHandler<CreatePostCommand, int>
{
    private readonly AppDbContext _context = context;

    public async Task<int> Handle(CreatePostCommand command, CancellationToken cancellationToken)
    {
        
        var post = new StudyPost
        {
            UserId = command.UserId,
            UserName = command.UserName,
            ImageUrl = command.ImageUrl,
            Duration = command.Duration,
            Title = command.Title,
            Content = command.Content,
            CreatedAt = DateTime.UtcNow,
            LikesCount = 0,
            CommentsCount = 0
        };

        _context.StudyPosts.Add(post);
        await _context.SaveChangesAsync(cancellationToken);

        return post.Id;
    }
}