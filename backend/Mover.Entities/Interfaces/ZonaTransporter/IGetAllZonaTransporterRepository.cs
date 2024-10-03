
using Mover.DTO.ZonaTransporter;

namespace Mover.Entities.Interfaces.ZonaTransporter
{
    public interface IGetAllZonaTransporterRepository
    {
        Task<List<ZonaTransporterDTO>> GetAllZonaTransporter();
    }
}
