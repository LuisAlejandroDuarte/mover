
using Mover.DTO.Vehiculos;
using Mover.UseCasesPorts.Marca.Get.ByIdClase;



namespace Mover.Presenter.Marca.Get.ByIdClase
{
    public class GetMarcaByIdClasePresenter : IGetMarcaByIdClaseOutPutPort, IPresenter<List<MarcaDTO>?>
    {
        public List<MarcaDTO>? Content { get; private set; }

        public Task GetMarcaByIdClase(List<MarcaDTO> listMarca)
        {
            Content = listMarca;
            return Task.CompletedTask;
        }

     
    }
}

