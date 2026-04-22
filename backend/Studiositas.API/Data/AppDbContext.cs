using Microsoft.EntityFrameworkCore;
using Studiositas.API.Models;

namespace Studiositas.API.Data;

public class AppDbContext(DbContextOptions<AppDbContext> options) : DbContext(options)
{
    public DbSet<StudyPost> StudyPosts { get; set; }
    public DbSet<User> Users { get; set; }
}