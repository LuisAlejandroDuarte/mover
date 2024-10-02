
namespace Mover.DTO.Vehiculos
{
    public class ParametrosVehiculoDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;

        public List<ParametrosVehiculoVehiculoDTO>? ParametrosVehiculoVehiculo { get; set; } 
    }
}
