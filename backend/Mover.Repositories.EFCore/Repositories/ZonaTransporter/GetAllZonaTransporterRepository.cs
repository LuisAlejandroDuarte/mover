
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.ZonaTransporter;
using Mover.Entities.Interfaces.ZonaTransporter;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.ZonaTransporter
{
    public class GetAllZonaTransporterRepository:IGetAllZonaTransporterRepository
    {

        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public GetAllZonaTransporterRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<List<ZonaTransporterDTO>> GetAllZonaTransporter()
        {
            var lista = await moverContext.ZonaTransporter.ToListAsync();

            return mapper.Map<List<ZonaTransporterDTO>>(lista); 
        }
    }
}
