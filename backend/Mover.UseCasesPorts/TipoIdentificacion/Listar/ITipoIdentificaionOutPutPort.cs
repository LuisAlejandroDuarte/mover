using Mover.DTO.TipoIdentificacion;
namespace Mover.UseCasesPorts.TipoIdentificacion.Listar
{
    public interface ITipoIdentificaionOutPutPort
    {
        Task GetListaTipoIdentificacion(List<TipoIdentificacionDTO> tipoIdentificacion);
    }
}
