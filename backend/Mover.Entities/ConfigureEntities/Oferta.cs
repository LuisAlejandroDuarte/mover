using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Mover.Entities.POCOEntities;

namespace Mover.Entities.ConfigureEntities
{
    public class OfertaEntityTypeConfiguration : IEntityTypeConfiguration<Oferta>
    {
       
        public void Configure(EntityTypeBuilder<Oferta> builder)
        {
            

            builder
            .HasOne<User>()
            .WithMany()
            .HasForeignKey(k => k.UserId);

            builder
            .Property(x => x.Precio)
            .IsRequired(false)
            .HasPrecision(10, 3);

            builder
            .Property(x => x.Observaciones)
            .IsRequired(false);
        }
    }
}


