using Microsoft.AspNetCore.Http;


namespace Mover.DTO.Multimedia
{
    public class MultimediaVehiculoDTO
    {
        public int Id { get; set; }        
        public int Multimedia { get; set; }
        public int VehiculoId { get; set; }
        public string Link { get; set; } = string.Empty;
        public IFormFile? Image { get; set; }
    }
}
