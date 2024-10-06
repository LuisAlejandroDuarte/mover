
namespace Mover.Entities.POCOEntities.Georeferencia
{
    public class Ciudad
    {
        public int Id { get; set; }
        public string Codigo { get; set; } = string.Empty;
        public string Nombre { get; set; } = string.Empty;
        public int DepartamentoId { get; set; }
        public Departamento? Departamento { get; set; }
    }
}
