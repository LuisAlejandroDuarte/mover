using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using Mover.Entities.POCOEntities;

namespace Mover.Entities.ConfigureEntities
{
    public class UserEntityTypeConfiguration : IEntityTypeConfiguration<User>
    {       

        public void Configure(EntityTypeBuilder<User> modelBuilder)
        {
            modelBuilder.Property(x => x.Nombre)
                .IsRequired()
                .HasMaxLength(100);
            modelBuilder.Property(x => x.Apellido)
                .IsRequired()
                .HasMaxLength(100);
            modelBuilder
                .Property(x => x.Direccion)
                .IsRequired()
                .HasMaxLength(200);
            modelBuilder
                .Property(x => x.Telefono)
                .IsRequired()
                .HasMaxLength(50);
            modelBuilder
                .Property(x => x.Email)
                .IsRequired()
                .HasMaxLength(100);
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

            modelBuilder
              .Property(x => x.Identificacion)
              .HasMaxLength(50);

            modelBuilder.HasMany(u => u.ListEquipos)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId);

            modelBuilder.HasMany(u => u.ListConductorAutorizado)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId);
        }
    }
}
