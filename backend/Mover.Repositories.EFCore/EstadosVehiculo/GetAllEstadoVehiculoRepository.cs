

using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.EstadoVehiculo;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.EstadosVehiculo
{
    public class GetAllEstadoVehiculoRepository:IGetAllEstadoVehiculoRepository
    {

        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public GetAllEstadoVehiculoRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<List<EstadoVehiculoDTO>> GetAllEstadoVehiculo()
        {
            var lista = await moverContext.EstadoVehiculo.ToListAsync();

            return mapper.Map<List<EstadoVehiculoDTO>>(lista);
        }
    }
}
