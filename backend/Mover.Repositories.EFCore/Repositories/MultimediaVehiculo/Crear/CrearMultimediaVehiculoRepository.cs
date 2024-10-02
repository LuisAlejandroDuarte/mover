

using Mover.DTO.Multimedia;
using Mover.Entities.Enums;
using Mover.Entities.Interfaces.Multimedia.Crear;
using Mover.Repositories.EFCore.AzureBlob;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.MultimediaVehiculo.Crear
{
    public class CrearMultimediaVehiculoRepository :ICrearMultimediaVehiculoRepository
    {
        private readonly MoverContext moverContext;
        private readonly AzureBlobStorage azureBlobStorage;

        public CrearMultimediaVehiculoRepository(MoverContext moverContext, AzureBlobStorage azureBlobStorage)
        {
            this.moverContext = moverContext;
            this.azureBlobStorage = azureBlobStorage;
        }

        public async Task<MultimediaVehiculoDTO> Create(MultimediaVehiculoDTO multimediaVehiculo)
        {
            Mover.Entities.POCOEntities.MultimediaVehiculo imageVehiculo = new Entities.POCOEntities.MultimediaVehiculo();
            var nameFileImage = await this.azureBlobStorage.UpLoadAsync(multimediaVehiculo.Image, TypeContainerBlob.images);
            imageVehiculo.Multimedia = multimediaVehiculo.Multimedia;
            imageVehiculo.VehiculoId = multimediaVehiculo.VehiculoId;
            imageVehiculo.Link = nameFileImage;
            this.moverContext.Add(imageVehiculo);
            await this.moverContext.SaveChangesAsync();
            multimediaVehiculo.Id = imageVehiculo.Id;
            multimediaVehiculo.Link = imageVehiculo.Link;
            return multimediaVehiculo;

        }
    }
}
