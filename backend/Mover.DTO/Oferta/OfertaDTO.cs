namespace Mover.DTO.Oferta
{
    public class OfertaDTO
    {
        public int Id { get; set; }
        public string NombreRecibe { get; set; } = string.Empty;
        public string NombreEntrega { get; set; } = string.Empty;
        public string Observaciones { get; set; } = string.Empty;
        public decimal? Precio { get; set; } = decimal.Zero;

        public int? UserId { get; set; }
        public int? UbicacionOrigenId { get; set; }
        public int? UbicacionDestinoId { get; set; }
        public int? ZonaTransporterId { get; set; }
        public int? EstadoOfertaId { get; set; }
    }
}
