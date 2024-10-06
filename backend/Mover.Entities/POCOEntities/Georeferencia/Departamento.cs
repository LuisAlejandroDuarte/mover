
namespace Mover.Entities.POCOEntities.Georeferencia
{
    public class Departamento
    {
        public int Id { get; set; }
        public string Codigo { get; set; } = string.Empty;
        public string Nombre { get; set; } = string.Empty;
        public int PaisId { get; set; } 
        public Pais? Pais { get; set; }
    }
}
