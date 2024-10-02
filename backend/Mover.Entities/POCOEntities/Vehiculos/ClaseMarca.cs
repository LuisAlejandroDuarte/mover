
namespace Mover.Entities.POCOEntities.Vehiculos
{
    public class ClaseMarca
    {
        public int Id { get; set; }
        public int ClaseId { get; set; }
        public Clase? Clase { get; set; }
        public int MarcaId { get; set; }
        public Marca? Marca { get; set; }

    }
}
