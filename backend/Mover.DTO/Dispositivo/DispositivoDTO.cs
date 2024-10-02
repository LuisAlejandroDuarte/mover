
namespace Mover.DTO.Dispositivo
{
    public class DispositivoDTO
    {
        public int? Id { get; set; }
        public int UserId { get; set; }
        public string TokenNotificacion { get; set; } = string.Empty;
        public string UniqueDeviceId { get; set; } = string.Empty;
        public string Modelo { get; set; } = string.Empty;
        public DateTime? FechaRegistro { get; set; } = null;
        public DateTime? UltimaConexion { get; set; } = null;
        public bool? Activo { get; set; }
        
    }
}
