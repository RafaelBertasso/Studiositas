using MediatR;

namespace Studiositas.API.Application.Features.Posts.Commands.CreatePost;

public record CreatePostCommand(
    int UserId,
    string UserName, 
    string ImageUrl, 
    string Duration, 
    string Title, 
    string Content
) : IRequest<int>;