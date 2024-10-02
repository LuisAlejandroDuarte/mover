namespace Mover.DTO.Vehiculos
{
    public class CarroceriaDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;

        public int? ClaseId { get; set; }
        public ClaseDTO? Clase { get; set; }
    }
}
