using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Multimedia;
using Mover.Entities.Interfaces.Multimedia.Listar;
using Mover.Repositories.EFCore.DataContext;


namespace Mover.Repositories.EFCore.Repositories.MultimediaVehiculo.Listar
{
    public class ListarMultimediaVehiculoRepository : IListarMultimediaVehiculoRepository
    {

        private readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public ListarMultimediaVehiculoRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<List<MultimediaVehiculoDTO>> ListaMultimediaVehciulo(int idVehiculo)
        {
            var multimedias = await this.moverContext.MultimediaVehiculo.Where(x => x.VehiculoId == idVehiculo).ToListAsync();

            List<MultimediaVehiculoDTO> result = this.imapper.Map<List<MultimediaVehiculoDTO>>(multimedias);

         
            return result;
        }
    }
}
