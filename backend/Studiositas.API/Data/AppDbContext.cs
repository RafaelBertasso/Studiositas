using Microsoft.EntityFrameworkCore;
using Studiositas.API.Models;

namespace Studiositas.API.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
    public DbSet<StudyPost> StudyPosts { get; set; }
    public DbSet<User> Users { get; set; }
}