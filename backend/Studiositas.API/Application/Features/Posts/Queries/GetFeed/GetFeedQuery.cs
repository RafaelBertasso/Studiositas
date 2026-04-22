using MediatR;
using Studiositas.API.Models;

namespace Studiositas.API.Application.Features.Posts.Queries.GetFeed;

public record GetFeedQuery() : IRequest<List<StudyPost>>;