
using Mover.Entities.POCOEntities.Vehiculos;

namespace Mover.Entities.POCOEntities
{
    public class Equipo
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


        public User? User { get; set; }
        public EstadoEquipo? EstadoEquipo { get; set; }
        public Marca? Marca { get; set; }
        public Modelo? Modelo { get; set; }
        public Referencia? Referencia { get; set; }
        public Carroceria? Carroceria { get; set; }

    }
}
