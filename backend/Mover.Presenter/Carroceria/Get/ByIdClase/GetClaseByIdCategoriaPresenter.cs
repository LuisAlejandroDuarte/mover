
using Mover.DTO.Vehiculos;
using Mover.UseCasesPorts.Carroceria.Get.ByIdClase;


namespace Mover.Presenter.Carroceria.Get.ByIdClase
{
    public class GetCarroceriaByIdClasePresenter : IGetCarroceriaByIdClaseOutPutPort, IPresenter<List<CarroceriaDTO>?>
    {
        public List<CarroceriaDTO>? Content { get; private set; }

        public Task GetCarroceriaByIdClase(List<CarroceriaDTO> listCarroceria)
        {
            Content = listCarroceria;
            return Task.CompletedTask;
        }

     
    }
}

