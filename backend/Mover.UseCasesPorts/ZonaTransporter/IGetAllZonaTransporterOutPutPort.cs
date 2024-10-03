
using Mover.DTO.ZonaTransporter;

namespace Mover.UseCasesPorts.ZonaTransporter
{
    public interface IGetAllZonaTransporterOutPutPort
    {
        Task GetAllZonaTransporter(List<ZonaTransporterDTO> listZonaTransporter);
    }
}
