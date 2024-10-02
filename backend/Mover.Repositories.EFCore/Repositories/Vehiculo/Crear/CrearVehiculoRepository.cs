using AutoMapper;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Vehiculo.Crear;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Vehiculo.Crear
{
    public class CrearVehiculoRepository : ICrearVehiculoRepository
    {
        readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public CrearVehiculoRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<int> CrearVehiculo(VehiculoDTO vehiculo)
        {
            try
            {
                Mover.Entities.POCOEntities.Vehiculos.Vehiculo vehiculonew = new ()
                {
                    OfertaId = vehiculo.OfertaId,
                    Placa = vehiculo.Placa,
                    //Ancho = vehiculo.Ancho,
                    //Alto = vehiculo.Alto,
                    //Observacion = vehiculo.Observacion,
                    //IdEstado = vehiculo.IdEstado,
                    //IdCarroceria = vehiculo.IdCarroceria,
                    //IdCondicion = vehiculo.IdCondicion,
                    //IdCategoria = vehiculo.IdCategoria
                };
                //vehiculonew.IdCategoria = vehiculo.IdCategoria;
                //vehiculonew.IdClase = vehiculo.IdClase;
                //vehiculonew.DescripcionMedidas = vehiculo.DescripcionMedidas;
                //vehiculonew.IdMarca = vehiculo.IdMarca;
                //vehiculonew.IdModelo = vehiculo.IdModelo;
                //vehiculonew.IdReferencia = vehiculo.IdReferencia;
                //vehiculonew.Largo = vehiculo.Largo;
                //vehiculonew.Peso = vehiculo.Peso;


                this.moverContext.Add(vehiculonew);
                await this.moverContext.SaveChangesAsync();
                return vehiculonew.Id;
            }
            catch (Exception e)
            {
                throw new Exception($"{e.Message}, error al crear el vehículo  {vehiculo.Placa}");                
            }
           
        }
    }
}
