
namespace Mover.Entities.POCOEntities.Vehiculos
{
    public class ParametrosVehiculo
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;

        public ICollection<ParametrosVehiculoVehiculo> ParametrosVehiculoVehiculo { get; set; } = new List<ParametrosVehiculoVehiculo>();
    }
}
