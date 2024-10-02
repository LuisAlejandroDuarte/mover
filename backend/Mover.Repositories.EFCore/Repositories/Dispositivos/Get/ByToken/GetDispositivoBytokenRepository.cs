
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Dispositivo;
using Mover.Entities.Interfaces.Dispositivos.Get.ByToken;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Dispositivos.Get.ByToken
{
    public class GetDispositivoBytokenRepository : IGetByTokenDispositivoRepository
    {
        private readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public GetDispositivoBytokenRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<DispositivoDTO> GetDispositivoByToken(string token)
        {
            var dispositivo = await this.moverContext.Dispositivos.Where(x=>x.TokenNotificacion == token && x.Activo==true).FirstOrDefaultAsync();

            if (dispositivo == null)
            {
                return new DispositivoDTO()
                {
                    Id = 0,
                    Activo = false,
                    FechaRegistro=null,
                    Modelo="",
                    TokenNotificacion="",
                    UltimaConexion=null,
                    UserId = -1
                };
            }

            return this.imapper.Map<DispositivoDTO>(dispositivo);

        }
    }
}
