
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Vehiculos;
using Mover.Entities.Interfaces.Vehiculo.ListaByOferta;
using Mover.Repositories.EFCore.DataContext;


namespace Mover.Repositories.EFCore.Repositories.Vehiculo.ListByOferta
{
    public class ListaVehiculoByOfertaRepository : IListaVehiculoByOfertaRepository
    {
        readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public ListaVehiculoByOfertaRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<List<VehiculoDTO>> GetListaVehiculoByOferta(int IdOferta)
        {
            List<VehiculoDTO> listaVehiculos = new();
            List<Entities.POCOEntities.Vehiculos.Vehiculo> vehiculos =  await moverContext.Vehiculo.Where(x => x.OfertaId == IdOferta).ToListAsync();

            foreach(var item in vehiculos)
            {
                listaVehiculos.Add(new VehiculoDTO()
                {
                    Id= item.Id,
                    OfertaId = item.OfertaId,
                    Placa = item.Placa,
                    //Ancho = item.Ancho,
                    //Alto = item.Alto,
                    //Observacion = item.Observacion,
                    //IdEstado = item.IdEstado,
                    //IdCondicion = item.IdCondicion,
                    //IdCarroceria = item.IdCarroceria,
                    //IdCategoria = item.IdCategoria,              
                    //IdClase = item.IdClase,
                    //DescripcionMedidas = item.DescripcionMedidas,
                    //IdMarca = item.IdMarca,
                    //IdModelo = item.IdModelo,
                    //IdReferencia = item.IdReferencia,
                    //Largo = item.Largo,
                    //Peso = item.Peso
                });
            }
          
            return listaVehiculos;

        }
    }
}
