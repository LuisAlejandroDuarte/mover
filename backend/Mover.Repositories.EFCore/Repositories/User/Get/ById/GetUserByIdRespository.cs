

using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.User;
using Mover.Entities.Interfaces.User.Get.ById;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.User.Get.ById
{
    public class GetUserByIdRespository:IGetUserByIdRepository
    {

        private readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public GetUserByIdRespository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<UserDTO>  GetById(int id)
        {
            var user = await this.moverContext.Users.Where(x => x.Id == id).FirstOrDefaultAsync() ?? throw new Exception("No existe el usuario");

            var userDTO = imapper.Map<UserDTO>(user);

            return userDTO;
        }
    }
}
