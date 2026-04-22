using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Studiositas.API.Application.Features.Posts.Commands.CreatePost;
using Studiositas.API.Application.Features.Posts.Queries.GetFeed;
using Studiositas.API.Data;
using Studiositas.API.Models;

namespace Studiositas.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class PostController(IMediator mediator) : ControllerBase
{
    private readonly IMediator _mediator = mediator;

    [HttpGet]
    public async Task<IActionResult> GetFeed()
    {
        var query = new GetFeedQuery();

        var posts = await _mediator.Send(query);

        return Ok(posts);
    }

    [HttpPost]
    public async Task<ActionResult> CreateStudy([FromBody] CreatePostCommand command)
    {
        var postId = await _mediator.Send(command);

        return Ok(new { message = "Post criado com sucesso!", id = postId });
    }
}
