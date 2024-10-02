
using Mover.DTO.Ubicaciones;
using Mover.Entities.Interfaces.Ubicacion.Crear;
using Mover.UseCasesPorts.Ubicacion.Crear;

namespace Mover.UseCases.Ubicacion.Crear
{
    public class CrearUbicacionInteractor:ICrearUbicacionInPutPort
    {
        readonly ICrearUbicacionOutPutPort crearUbicacionOutPutPort;

        readonly ICrearUbicacionRepository crearUbicacionRepository;

        public CrearUbicacionInteractor(ICrearUbicacionOutPutPort crearUbicacionOutPutPort, ICrearUbicacionRepository crearUbicacionRepository)
        {
            this.crearUbicacionOutPutPort = crearUbicacionOutPutPort;
            this.crearUbicacionRepository = crearUbicacionRepository;
        }

        public async Task Handle(UbicacionDTO ubicacion)
        {
            int ubicacionId = await crearUbicacionRepository.CrearUbicacion(ubicacion);

            await crearUbicacionOutPutPort.CrearUbicacion(ubicacionId);
        }
    }
}
