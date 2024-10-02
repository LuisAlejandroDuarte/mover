namespace Mover.Entities.POCOEntities.Vehiculos
{
    public class Carroceria
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string? Descripcion { get; set; }

        public int? ClaseId { get; set; }
        public Clase? Clase { get; set; }
    }
}
