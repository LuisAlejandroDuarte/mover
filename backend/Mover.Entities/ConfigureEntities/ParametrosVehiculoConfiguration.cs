
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Mover.Entities.POCOEntities.Vehiculos;

namespace Mover.Entities.ConfigureEntities
{
    public class ParametrosVehiculoConfiguration : IEntityTypeConfiguration<ParametrosVehiculoVehiculo>
    {
        public void Configure(EntityTypeBuilder<ParametrosVehiculoVehiculo> builder)
        {
            builder
            .HasKey(vc => new { vc.VehiculoId, vc.ParametrosVehiculoId });

            builder
                .HasOne(vc => vc.Vehiculo)
                .WithMany(v => v.ParametrosVehiculoVehiculo)
                .HasForeignKey(vc => vc.VehiculoId);

            builder
                .HasOne(vc => vc.ParametrosVehiculo)
                .WithMany(c => c.ParametrosVehiculoVehiculo)
                .HasForeignKey(vc => vc.ParametrosVehiculoId);
        }
    }
}
