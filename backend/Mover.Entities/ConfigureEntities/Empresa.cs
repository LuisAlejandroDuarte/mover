using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Mover.Entities.POCOEntities;

namespace Mover.Entities.ConfigureEntities
{
    public class EmpresaEntityTypeConfiguration : IEntityTypeConfiguration<Empresa>
    {
        public void Configure(EntityTypeBuilder<Empresa> builder)
        {
            builder.HasKey(e => e.Id);

            builder.HasOne(e => e.User)
           .WithOne(u => u.Empresa)
           .HasForeignKey<Empresa>(p => p.UserId)
           .OnDelete(DeleteBehavior.Cascade); 

            builder.HasIndex(e => e.NIT)
          .IsUnique();
        }
    }
}
