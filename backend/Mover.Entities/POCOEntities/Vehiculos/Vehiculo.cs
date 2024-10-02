namespace Mover.Entities.POCOEntities.Vehiculos
{
    public class Vehiculo
    {
        public int Id { get; set; }

        
        public string Placa { get; set; } = string.Empty;        
        public string Observacion { get; set; } = string.Empty;


        public int OfertaId { get; set; }
        public int CarroceriaId { get; set; }
        public int CondicionVehiculoId { get; set; }
        public int ReferenciaId { get; set; }
        public int EstadoVehiculoId { get; set; }
        public int ModeloId { get; set; }

        public Oferta? Oferta { get; set; }
        public Carroceria? Carroceria { get; set; }
        public CondicionVehiculo? CondicionVehiculo { get; set; }
        public Referencia? Referencia { get; set; }
        public EstadoVehiculo? EstadoVehiculo { get; set; }
        public Modelo? Modelo { get; set; }

        public List<MultimediaVehiculo>? MultimediaVehiculos { get; set; }

        public ICollection<ParametrosVehiculoVehiculo> ParametrosVehiculoVehiculo { get; set; } = new List<ParametrosVehiculoVehiculo>();

    }
}
