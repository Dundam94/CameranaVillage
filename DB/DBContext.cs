using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using CameranaVillage.DB.Entities;


namespace CameranaVillage.DB
{
    public class DBContext : IdentityDbContext<User>
    {
        public DBContext(DbContextOptions<DBContext> options)
            : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            // Customize the ASP.NET Identity model and override the defaults if needed.
            // For example, you can rename the ASP.NET Identity table names and more.
            // Add your customizations after calling base.OnModelCreating(builder);
        }

        public DbSet<User> AspNetUsers { get; set; } //è sbagliato aggiungerla perché c'è già nel framework
        public DbSet<Attivita> Attivita { get; set; }
        public DbSet<PrenotazioneAttivita> PrenotazioneAttivita { get; set; }





    }
}