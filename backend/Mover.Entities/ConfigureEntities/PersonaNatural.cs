
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Mover.Entities.POCOEntities;

namespace Mover.Entities.ConfigureEntities
{
    public class PersonaNaturalEntityTypeConfiguration : IEntityTypeConfiguration<PersonaNatural>
    {
        public void Configure(EntityTypeBuilder<PersonaNatural> builder)
        {
            builder.HasKey(p => p.Id);

            builder.HasOne(p => p.User)
           .WithOne(u => u.PersonaNatural)
           .HasForeignKey<PersonaNatural>(p => p.UserId)
           .OnDelete(DeleteBehavior.Cascade); // Elimina la persona natural si el usuario es eliminado


            builder.HasIndex(p => p.Identificacion)
          .IsUnique();
        }
    }
}
