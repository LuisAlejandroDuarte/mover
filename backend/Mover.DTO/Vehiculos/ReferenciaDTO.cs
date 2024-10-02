
namespace Mover.DTO.Vehiculos
{
    public class ReferenciaDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;

        public int? MarcaId { get; set; }
        public MarcaDTO? Marca { get; set; }
    }
}
