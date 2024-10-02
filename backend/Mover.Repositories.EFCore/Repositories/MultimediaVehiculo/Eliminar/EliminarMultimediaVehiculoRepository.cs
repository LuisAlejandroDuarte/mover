using Mover.Entities.Enums;
using Mover.Entities.Interfaces.Multimedia.Eliminar;
using Mover.Repositories.EFCore.AzureBlob;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.MultimediaVehiculo.Eliminar
{
    public class EliminarMultimediaVehiculoRepository : IEliminarMultimediaVehiculoRepository
    {
        private readonly MoverContext moverContext;
        private readonly AzureBlobStorage azureBlobStorage;

        public EliminarMultimediaVehiculoRepository(MoverContext moverContext, AzureBlobStorage azureBlobStorage)
        {
            this.moverContext = moverContext;
            this.azureBlobStorage = azureBlobStorage;
        }

        public async Task<bool> Eliminar(int idMultimediaVehiculo)
        {
            try
            {
                var multimediaVe = this.moverContext.MultimediaVehiculo.FirstOrDefault(x => x.Id == idMultimediaVehiculo);
                if (multimediaVe == null)
                {
                    throw new Exception("no existe");
                }

                string link = multimediaVe.Link;

                await this.azureBlobStorage.DeleteAsync(TypeContainerBlob.images,link);
                
                this.moverContext.Remove(multimediaVe);
                await this.moverContext.SaveChangesAsync();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

        
            return true;
        }
    }
}
