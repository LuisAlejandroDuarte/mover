using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.Entities.Interfaces.Vehiculo.Eliminar;
using Mover.Repositories.EFCore.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mover.Repositories.EFCore.Repositories.Vehiculo.Eliminar
{
    public class EliminarVehiculoRepository : IEliminarVehiculoRepository
    {
        readonly MoverContext moverContext;
        private readonly IMapper imapper;

        public EliminarVehiculoRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<bool> EliminarVehiculo(int id)
        {
            Entities.POCOEntities.Vehiculos.Vehiculo vehiculo;
            try
            {
                vehiculo = await this.moverContext.Vehiculo.FirstOrDefaultAsync(x => x.Id == id);
                if (vehiculo != null)
                {
                    this.moverContext.Vehiculo.Remove(vehiculo);
                    await this.moverContext.SaveChangesAsync();
                }
                else
                {
                    throw new Exception($"No existe el vehículo {vehiculo!.Id!}");
                }

                return true;
            }
            catch (Exception e)
            {

                throw new Exception($"{e.Message}, error al eliminar  el vehículo");
            }

            
        }
    }
}
