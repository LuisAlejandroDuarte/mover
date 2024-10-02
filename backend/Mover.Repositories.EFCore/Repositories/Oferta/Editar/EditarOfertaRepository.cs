using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Oferta;
using Mover.Entities.Interfaces.Oferta.Editar;
using Mover.Repositories.EFCore.DataContext;


namespace Mover.Repositories.EFCore.Repositories.Oferta.Editar
{
    public class EditarOfertaRepository : IEditarOfertaRepository
    {
        private readonly MoverContext moverContext;

        private readonly IMapper imapper;

        public EditarOfertaRepository(MoverContext moverContext, IMapper imapper)
        {
            this.moverContext = moverContext;
            this.imapper = imapper;
        }

        public async Task<bool> EditarOferta(OfertaDTO oferta)
        {

            //Estado 1: Creado o editado
            //Estado 2: Enviar a revisión con el precio de la oferta
            //Estado 3: Publicado

            var ofertabd = await this.moverContext.Oferta.Where(x=>x.Id == oferta.Id).FirstOrDefaultAsync();
            //if (ofertabd != null)
            //{
            //    switch (oferta.Estado)  
            //    {
            //        case 1:
            //            ofertabd.NombreEntrega = oferta.NombreEntrega;
            //            ofertabd.NombreRecibe = oferta.NombreRecibe;

            //            ofertabd.IdCiudadOrigen = oferta.IdCiudadOrigen;
            //            ofertabd.IdCiudadDestino = oferta.IdCiudadDestino;

            //            ofertabd.DireccionDestino = oferta.DireccionDestino;
            //            ofertabd.DireccionOrigen = oferta.DireccionOrigen;

            //            ofertabd.Observaciones = oferta.Observaciones;
            //            break;
            //      case 2:
            //            ofertabd.Estado = oferta.Estado;
            //            ofertabd.Precio = oferta.Precio;
            //            break;
            //        case 3:
            //            ofertabd.Estado = oferta.Estado;
            //            break;
            //        default:
            //            break;
            //    }

            //    this.moverContext.Update(ofertabd);
            //    this.moverContext.SaveChanges();
            //    return true;
            //} else
            //{
                
               throw new  Exception("No existe la oferta");
            //}

        }
    }
}
