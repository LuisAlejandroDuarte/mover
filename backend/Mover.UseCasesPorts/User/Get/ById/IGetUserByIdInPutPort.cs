
namespace Mover.UseCasesPorts.User.Get.ById
{
    public interface IGetUserByIdInPutPort
    {
        Task Handle(int id);
    }
}
