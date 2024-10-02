

namespace Mover.Entities.POCOEntities.Vehiculos
{
    public class ParametrosVehiculoVehiculo
    {
        public int VehiculoId { get; set; }
        public Vehiculo Vehiculo { get; set; } = null!; // Clave foránea a Vehiculo

        public int ParametrosVehiculoId { get; set; }
        public ParametrosVehiculo ParametrosVehiculo { get; set; } = null!; // Clave foránea a Condiciones

        public bool Value { get; set; } = false;
    }
}
