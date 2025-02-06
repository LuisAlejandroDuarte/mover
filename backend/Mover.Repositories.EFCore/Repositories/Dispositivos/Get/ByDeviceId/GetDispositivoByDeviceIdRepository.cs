
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Dispositivo;
using Mover.Entities.Interfaces.Dispositivos.Get.ByDeviceId;
using Mover.Repositories.EFCore.DataContext;
using Mover.Repositories.EFCore.Repositories.User.Crear;

namespace Mover.Repositories.EFCore.Repositories.Dispositivos.Get.ByDeviceId
{
    public class GetDispositivoByDeviceIdRepository : IGetByDeviceIdDispositivoRepository
    {

        readonly MoverContext moverContext;
        readonly IMapper mapper;

        public GetDispositivoByDeviceIdRepository(MoverContext moverContext, IMapper mapper)
        {
            this.moverContext = moverContext;
            this.mapper = mapper;
        }

        public async Task<DispositivoDTO> GetByDeviceIdDispositivo(string deviceId)
        {
            var dispositivo = await this.moverContext.Dispositivos.Where(x => x.UniqueDeviceId == deviceId && x.Activo == true).FirstOrDefaultAsync();

            if (dispositivo == null)
            {
                return new DispositivoDTO()
                {
                    Id = 0,
                    Activo = false,
                    FechaRegistro = null,
                    Modelo = "",
                    TokenNotificacion = "",
                    UniqueDeviceId="",
                    UltimaConexion = null,
                    UserId = -1,
                    User = new DTO.User.UserDTO(),
                };
            }

            var user = await this.moverContext.Users.FindAsync(dispositivo.UserId);
            var persona = await this.moverContext.PersonaNatural.FirstOrDefaultAsync(x => x.UserId == dispositivo.UserId);
            var empresa = await this.moverContext.Empresa.FirstOrDefaultAsync(x => x.UserId == dispositivo.UserId);

            user.Empresa = empresa;
            user.PersonaNatural = persona;

            dispositivo.User = user;


            return this.mapper.Map<DispositivoDTO>(dispositivo);
        }
    }
}
