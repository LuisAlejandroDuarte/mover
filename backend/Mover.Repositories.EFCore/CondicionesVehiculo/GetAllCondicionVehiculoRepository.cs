
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.CondicionVehiculo;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.CondicionesVehiculo
{
    public class GetAllCondicionVehiculoRepository:IGetAllCondicionVehiculoRepository
    {

        readonly IMapper mapper;
        readonly MoverContext moverContext;

        public GetAllCondicionVehiculoRepository(IMapper mapper, MoverContext moverContext)
        {
            this.mapper = mapper;
            this.moverContext = moverContext;
        }

        public async Task<List<CondicionVehiculoDTO>> GetAllCondicionVehiculo()
        {
            var lista = await moverContext.CondicionVehiculo.ToListAsync();


            return mapper.Map<List<CondicionVehiculoDTO>>(lista);
        }
    }
}
