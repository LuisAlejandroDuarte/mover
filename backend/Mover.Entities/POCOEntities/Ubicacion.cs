
using Mover.Entities.POCOEntities.Georeferencia;

namespace Mover.Entities.POCOEntities
{
    public class Ubicacion
    {
        public int Id { get; set; }
        public int CiudadId { get; set; }
        public Ciudad? Ciudad { get; set; }
        public string Latitud { get; set; } = string.Empty;
        public string Longitud { get; set; } = string.Empty;
        public int? Precision { get; set; } 
        public DateTime? FechaHora { get; set; }
        public string Direccion { get; set; } = string.Empty;
        public string DispositivoId { get; set; } = string.Empty;
        public Dispositivos? Dispositivos { get; set; }
    }
}
