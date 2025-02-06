
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Mover.DTO.Empresa;
using Mover.Entities.Interfaces.Empresa.Crear;
using Mover.Repositories.EFCore.DataContext;

namespace Mover.Repositories.EFCore.Repositories.Empresa.Crear
{
    public class CrearEmpresaRepository :IEmpresaCrearRepository
    {
        private readonly IMapper mapper;
        private readonly MoverContext moverContext;

        public CrearEmpresaRepository(IMapper mapper, MoverContext moverContext)
        {
            this.mapper = mapper;
            this.moverContext = moverContext;
        }

        public async Task<EmpresaDTO> CrearEmpresa(EmpresaDTO empresa)
        {
           var email = await this.moverContext.Empresa.FirstOrDefaultAsync(x=>x.Email == empresa.Email);

            if (email!=null)
            {
                throw new Exception("Ya existe el email");
            }

            var _empresa = this.mapper.Map<Mover.Entities.POCOEntities.Empresa>(empresa);

            moverContext.Add(_empresa);
            moverContext.SaveChanges();

            empresa = this.mapper.Map<EmpresaDTO>(_empresa);


            return empresa;
        }
    }
}
