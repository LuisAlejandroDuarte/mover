
using Mover.DTO.User;

namespace Mover.Entities.Interfaces.User.Get.ById
{
    public interface IGetUserByIdRepository
    {
         Task<UserDTO> GetById(int id);
    }
}
