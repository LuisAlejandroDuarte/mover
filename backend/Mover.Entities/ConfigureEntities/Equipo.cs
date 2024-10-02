using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Mover.Entities.POCOEntities;

namespace Mover.Entities.ConfigureEntities
{
    public class EquipoEntityTypeConfiguration : IEntityTypeConfiguration<Equipo>
    {    
        public void Configure(EntityTypeBuilder<Equipo> builder)
        {

            builder
                .Property(x => x.PlacasVehiculo)
                .IsRequired()
                .HasMaxLength(50);

            builder
               .Property(x => x.PlacasSemirremolque)
               .IsRequired()
               .HasMaxLength(50);

        }
    }
}