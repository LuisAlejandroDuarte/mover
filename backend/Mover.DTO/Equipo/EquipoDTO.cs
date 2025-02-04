
namespace Mover.DTO.Equipo
{
    public class EquipoDTO
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string PlacasVehiculo { get; set; } = string.Empty;
        public int MarcaId { get; set; }
        public int ModeloId { get; set; }
        public int ReferenciaId { get; set; }
        public int CarroceriaId { get; set; }        
        public string Color { get; set; } = string.Empty;
        public string PlacasSemirremolque { get; set; } = string.Empty;
        public string LinkLicenciaConduccion { get; set; } = string.Empty;
        public string LinkSoat { get; set; } = string.Empty;
        public string LinkTecnomecanica { get; set; } = string.Empty;
        public int? EstadoEquipoId { get; set; }

    }
}
