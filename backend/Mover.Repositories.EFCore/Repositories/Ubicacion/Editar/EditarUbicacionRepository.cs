

using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Ubicaciones;
using Mover.Entities.Interfaces.Ubicacion.Editar;
using Mover.Entities.POCOEntities.Vehiculos;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Ubicacion.Editar
{
    public class EditarUbicacionRepository:IEditarUbicacionRepository
    {
        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public EditarUbicacionRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<bool> EditarUbicacion(UbicacionDTO ubicacion)
        {
            try
            {                
                var result = await moverContext.Ubicacion.FirstOrDefaultAsync(x => x.Id == ubicacion.Id) ?? throw new Exception($" no se encontró ubicación : {ubicacion.Id}");
                mapper.Map(ubicacion, result);                
                moverContext.Ubicacion.Update(result);
                await moverContext.SaveChangesAsync();
                return true;
            }
            catch (Exception e)
            {

                throw new Exception($"{e.Message}, error al editar el ubicación  {ubicacion.Id}");
            }
        }
    }
}
