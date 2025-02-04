
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Mover.Entities.POCOEntities;

namespace Mover.Entities.ConfigureEntities
{
    public class EstadoEquipoEntityTypeConfiguration : IEntityTypeConfiguration<EstadoEquipo>
    {
        public void Configure(EntityTypeBuilder<EstadoEquipo> builder)
        {
            builder.HasMany(e => e.ListEquipo)
                .WithOne(u => u.EstadoEquipo)
                .HasForeignKey(f => f.EstadoEquipoId);
        }
    }
}
