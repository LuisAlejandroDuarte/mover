using Mover.DTO.ZonaTransporter;
using Mover.UseCasesPorts.ZonaTransporter;

namespace Mover.Presenter.ZonaTransporter
{
    public class GetAllZonaTransporterPresenter : IGetAllZonaTransporterOutPutPort, IPresenter<List<ZonaTransporterDTO>?>
    {
        public List<ZonaTransporterDTO>? Content { get; private set; }

        public Task GetAllZonaTransporter(List<ZonaTransporterDTO> listZonaTransporter)
        {
            Content = listZonaTransporter;
            return Task.CompletedTask;
        }
    }
}
