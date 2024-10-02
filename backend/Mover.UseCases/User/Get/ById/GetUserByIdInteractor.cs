using Mover.Entities.Interfaces.User.Get.ById;
using Mover.UseCasesPorts.User.Get.ById;

namespace Mover.UseCases.User.Get.ById
{
    public class GetUserByIdInteractor:IGetUserByIdInPutPort
    {

        readonly IGetUserByIdOutPutPort getUserByIdOutPutPort;
        readonly IGetUserByIdRepository  getUserByIdRepository;

        public GetUserByIdInteractor(IGetUserByIdOutPutPort getUserByIdOutPutPort, IGetUserByIdRepository getUserByIdRepository)
        {
            this.getUserByIdOutPutPort = getUserByIdOutPutPort;
            this.getUserByIdRepository = getUserByIdRepository;
        }


        public async Task Handle(int id)
        {
            var user = await getUserByIdRepository.GetById(id);

            await   getUserByIdOutPutPort.GetUser(user);
        }
    }
}
