using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Studiositas.API.Data;
using Studiositas.API.Models;

namespace Studiositas.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class PostController : ControllerBase
{
    private readonly AppDbContext _context;

    public PostController(AppDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<StudyPost>>> GetPosts()
    {
        return await _context.StudyPosts.OrderByDescending(p => p.CreatedAt).ToListAsync();
    }

    [HttpPost]
    public async Task<ActionResult<StudyPost>> PostStudy(StudyPost post)
    {
        _context.StudyPosts.Add(post);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetPosts), new { id = post.Id }, post);
    }
}
