namespace Mover.DTO.ConductorAutorizado
{
    public class ConductorAutorizadoDTO
    {
        public int Id { get; set; }
        public int UserId { get; set; }        
        public string Nombre { get; set; } = string.Empty;
        public string Apellido { get; set; } = string.Empty;
        public string Direccion { get; set; } = string.Empty;
        public string Correo { get; set; } = string.Empty;
        public string Identificacion { get; set; } = string.Empty;
        public int Estado { get; set; }
    }
}
