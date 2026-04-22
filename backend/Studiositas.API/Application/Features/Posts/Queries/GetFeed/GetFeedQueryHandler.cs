using MediatR;
using Microsoft.EntityFrameworkCore;
using Studiositas.API.Application.Features.Posts.Queries.GetFeed;
using Studiositas.API.Data;
using Studiositas.API.Models;

namespace Studiositas.API.Application.Features.Posts.Commands.CreatePost;

public class GetFeedQueryHandler(AppDbContext context) : IRequestHandler<GetFeedQuery, List<StudyPost>>
{
    private readonly AppDbContext _context = context;

    public async Task<List<StudyPost>> Handle(GetFeedQuery request, CancellationToken cancellationToken)
    {
        var feed = await _context.StudyPosts
            .OrderByDescending(p => p.CreatedAt)
            .ToListAsync(cancellationToken);

        return feed;
    }
}