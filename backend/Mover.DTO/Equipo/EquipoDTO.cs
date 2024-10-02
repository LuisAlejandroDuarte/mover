
namespace Mover.DTO.Equipo
{
    public class EquipoDTO
    {
        public int Id { get; set; }
        public int UserId { get; set; }

        public string PlacasVehiculo { get; set; } = string.Empty;
        public int IdMarca { get; set; }
        public int IdModelo { get; set; }

        public int IdLinea { get; set; }

        public int IdTipoCarroceria { get; set; }

        public string PlacasSemirremolque { get; set; } = string.Empty;

        public int IdColor { get; set; }

        public string LinkLicenciaConduccion { get; set; } = string.Empty;

        public string LinkSoat { get; set; } = string.Empty;

        public string LinkTecnomecanica { get; set; } = string.Empty;

        public int Estado { get; set; }
    }
}
