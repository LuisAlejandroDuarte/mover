


using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.ParametrosVehiculo.Get;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.ParametrosVehiculo
{
    public class GetAllParametrosVehiculoRepository :IGetAllParametrosVehiculoRepository
    {

        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public GetAllParametrosVehiculoRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<List<ParametrosVehiculoDTO>> GetAllParametrosVehiculo()
        {
            var lista = await moverContext.ParametrosVehiculo.ToListAsync();

            return mapper.Map<List<ParametrosVehiculoDTO>>(lista);
        }
    }
}
