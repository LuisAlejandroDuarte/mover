using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Vehiculo.Editar;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Vehiculo.Editar
{
    public class EditarVehiculoRepository : IEditarVehiculoRepository
    {
        readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public EditarVehiculoRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<bool> EditarVehiculo(VehiculoDTO vehiculo)
        {
            try
            {

                Entities.POCOEntities.Vehiculos.Vehiculo vehiculosearch = await  this.moverContext.Vehiculo.FirstAsync(x => x.Id == vehiculo.Id);

                vehiculosearch.OfertaId = vehiculo.OfertaId;
                vehiculosearch.Placa = vehiculo.Placa;
                //vehiculosearch.Ancho = vehiculo.Ancho;
                //vehiculosearch.Alto = vehiculo.Alto;
                //vehiculosearch.Observacion = vehiculo.Observacion;
                //vehiculosearch.IdEstado = vehiculo.IdEstado;
                //vehiculosearch.IdCondicion = vehiculo.IdCondicion;
                //vehiculosearch.IdCarroceria = vehiculo.IdCarroceria;
                //vehiculosearch.IdCategoria = vehiculo.IdCategoria;                
                //vehiculosearch.IdClase = vehiculo.IdClase;
                //vehiculosearch.DescripcionMedidas = vehiculo.DescripcionMedidas;
                //vehiculosearch.IdMarca = vehiculo.IdMarca;
                //vehiculosearch.IdModelo = vehiculo.IdModelo;
                //vehiculosearch.IdReferencia = vehiculo.IdReferencia;
                //vehiculosearch.Largo = vehiculo.Largo;
                //vehiculosearch.Peso = vehiculo.Peso;

                this.moverContext.Update(vehiculosearch);
                await this.moverContext.SaveChangesAsync();
                return true;
            }
            catch (Exception e)
            {
                throw new Exception($"{e.Message}, error al editar el vehículo  { vehiculo.Id }" );
            }
                      
          
            
        }
    }
}
