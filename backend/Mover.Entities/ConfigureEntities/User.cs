using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using Mover.Entities.POCOEntities;

namespace Mover.Entities.ConfigureEntities
{
    public class UserEntityTypeConfiguration : IEntityTypeConfiguration<User>
    {       

        public void Configure(EntityTypeBuilder<User> modelBuilder)
        {

            modelBuilder
               .Property(x => x.UserName)
               .IsRequired()
               .HasMaxLength(100);
            modelBuilder
              .Property(x => x.Password)
              .IsRequired();

            modelBuilder
                .Property(x => x.UltimaSesion)
                .IsRequired(false);             

            modelBuilder.HasMany(u => u.ListEquipos)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId);

            modelBuilder.HasMany(u => u.ListConductorAutorizado)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId);            
        }
    }
}
