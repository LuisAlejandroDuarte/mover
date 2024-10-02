
namespace Mover.DTO.Ubicaciones
{
    public class UbicacionDTO
    {
        public int Id { get; set; }
        public string NombreCiudad { get; set; } = string.Empty;
        public string Latitud { get; set; } = string.Empty;
        public string Longitud { get; set; } = string.Empty;
        public int? Precision { get; set; }
        public DateTime? FechaHora { get; set; }
        public string Direccion { get; set; } = string.Empty;
        public string DispositivoId { get; set; } = string.Empty;
    }
}
