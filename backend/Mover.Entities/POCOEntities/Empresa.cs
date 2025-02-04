
namespace Mover.Entities.POCOEntities
{
    public class Empresa
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public User? User { get; set; }
        public string? RazonSocial { get; set; }
        public string? NIT { get; set; }
        public string? RepresentanteLegal { get; set; }
        public string Direccion { get; set; } = string.Empty;
        public string Telefono { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
    }
}
