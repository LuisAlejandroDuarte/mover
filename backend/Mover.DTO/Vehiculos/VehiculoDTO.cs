
using Mover.DTO.Multimedia;
using System.Reflection;

namespace Mover.DTO.Vehiculos
{
    public class VehiculoDTO
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
        

        public List<MultimediaVehiculoDTO>? MultimediaVehiculos { get; set; }

        public List<ParametrosVehiculoVehiculoDTO>? ParametrosVehiculoVehiculoDTO { get; set; }

    }
}
