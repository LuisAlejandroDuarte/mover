

using Mover.DTO.Dispositivo;
using Mover.Entities.Interfaces.Dispositivos.Crear;
using Mover.UseCasesPorts.Dispositivos.Crear;


namespace Mover.UseCases.Dispositivos.crear
{
    public class CrearDispositivoInteractor : ICrearDispositivoInPutPort
    {
        private readonly ICrearDispositivoOutPutPort  crearDispositivoOutPutPort;
        private readonly ICrearDispositivoRepository  crearDispositivoRepository;

        public CrearDispositivoInteractor(ICrearDispositivoOutPutPort crearDispositivoOutPutPort, ICrearDispositivoRepository crearDispositivoRepository)
        {
            this.crearDispositivoOutPutPort = crearDispositivoOutPutPort;
            this.crearDispositivoRepository = crearDispositivoRepository;
        }

        public async Task Handle(DispositivoDTO dispositivoDTO)
        {
            DispositivoDTO? dispositivo= await  crearDispositivoRepository.Create(dispositivoDTO);

            await crearDispositivoOutPutPort.Handle(dispositivo);

        }
    }
}
