
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Referencia.Get.ByIdMarca;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Referencia.Get.ByIdMarca
{
    public class GetReferenciaByIdMarcaRepository : IGetReferenciaByIdMarcaRepository
    {

        readonly IMapper mapper;

        readonly MoverContext moverContext;

        public GetReferenciaByIdMarcaRepository(IMapper mapper, MoverContext moverContext)
        {
            this.mapper = mapper;
            this.moverContext = moverContext;
        }

        public async Task<List<ReferenciaDTO>> GetReferenciaByIdMarca(int idMarca)
        {
            var listReferencia = await moverContext.Referencia.Where(x=>x.MarcaId== idMarca).ToListAsync();
            return mapper.Map<List<ReferenciaDTO>>(listReferencia);

        }
    }
}
