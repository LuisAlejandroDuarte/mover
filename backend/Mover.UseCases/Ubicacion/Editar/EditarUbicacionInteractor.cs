
using Mover.DTO.Ubicaciones;
using Mover.Entities.Interfaces.Ubicacion.Editar;
using Mover.UseCasesPorts.Ubicacion.Editar;

namespace Mover.UseCases.Ubicacion.Editar
{
    public class EditarUbicacionInteractor :IEditarUbicacionInPutPort
    {
        readonly IEditarUbicacionOutPutPort editarUbicacionOutPutPort;
        readonly IEditarUbicacionRepository editarUbicacionRepository;

        public EditarUbicacionInteractor(IEditarUbicacionOutPutPort editarUbicacionOutPutPort, IEditarUbicacionRepository editarUbicacionRepository)
        {
            this.editarUbicacionOutPutPort = editarUbicacionOutPutPort;
            this.editarUbicacionRepository = editarUbicacionRepository;
        }

        public async Task Handle(UbicacionDTO ubicacionDTO)
        {
            var result = await editarUbicacionRepository.EditarUbicacion(ubicacionDTO);

            await editarUbicacionOutPutPort.EditarUbicacion(result);
        }
    }
}
