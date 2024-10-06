
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Georeferencia;
using Mover.Entities.Interfaces.Georeferencia.Pais.Get.ByCodigo;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Georeferencia.Pais.Get.ByCodigo
{
    public class GetPaisByCodigoRepository : IGetPaisByCodigoRepository
    {
        readonly IMapper mapper;
        readonly MoverContext moverContext;

        public GetPaisByCodigoRepository(IMapper mapper, MoverContext moverContext)
        {
            this.mapper = mapper;
            this.moverContext = moverContext;
        }

        public async Task<PaisDTO> GetPaisByCodigo(string codigo)
        {
            var pais = await moverContext.Pais.Where(x=>x.Codigo== codigo).FirstOrDefaultAsync();

            if (pais == null) {

                throw new Exception($"No existe el pais con el código: {codigo}");

            }

            return mapper.Map<PaisDTO>(pais);

        }
    }
}
